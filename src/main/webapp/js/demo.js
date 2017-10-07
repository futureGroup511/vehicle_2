function arcSlip(){
     var oPic=document.getElementById('user_pic');
     var oPrev=getByClass(oPic,'prev')[0];
     var oNext=getByClass(oPic,'next')[0];
     
     var aLi=oPic.getElementsByTagName('li');
     
     var arr=[];
       oPic.onmouseover=function(){
          clearInterval(moveTime);
       }
        oPic.onmouseout=function(){
             moveTime=setInterval(function(){ 
                  oNext.click();      
            },2000);
       }
     for(var i=0;i<aLi.length;i++)
     {
       var oImg=aLi[i].getElementsByTagName('img')[0];
       
         arr.push([parseInt(getStyle(aLi[i],'left')),parseInt(getStyle(aLi[i],'top')),
                   getStyle(aLi[i],'zIndex'),oImg.width,parseFloat(getStyle(aLi[i],'opacity')*100)]);
     }
     
     
     oPrev.onclick=function moveTP()
     {
         arr.push(arr[0]);
         arr.shift();
             for(var i=0;i<aLi.length;i++)
             {
                 var oImg=aLi[i].getElementsByTagName('img')[0];
                    
                    aLi[i].style.zIndex=arr[i][2];
                    startMove(aLi[i],{left:arr[i][0],top:arr[i][1],opacity:arr[i][4]});
                    startMove(oImg,{width:arr[i][3]});
             }
            
     }
     
    oNext.onclick=function moveTN()
     {
          arr.unshift(arr[arr.length-1]);
          arr.pop();
             for(var i=0;i<aLi.length;i++)
             {
                 var oImg=aLi[i].getElementsByTagName('img')[0];
                    
                    aLi[i].style.zIndex=arr[i][2];
                    startMove(aLi[i],{left:arr[i][0],top:arr[i][1],opacity:arr[i][4]});
                    startMove(oImg,{width:arr[i][3]});
             }
     }
    var moveTime = setInterval (function(){
    
        oNext.click();
        
        },2000);
    $('#user_pic').hover(function(){
         clearInterval(moveTime);
       },
     function(){
        moveTime=setInterval(function(){    
        oNext.click();      
        },2000);
      });
                
 function getStyle(obj,name)
     {
           if(obj.currentStyle){ return obj.currentStyle[name]; }
           else{ return getComputedStyle(obj,false)[name]; }
     }
  } 
function getByClass(oParent,sClass)
  {
      var aResult=[];
      var aEle=oParent.getElementsByTagName('*');
      
          for(var i=0;i<aEle.length;i++)
          {
             if(aEle[i].className==sClass)
             {
                aResult.push(aEle[i]);
             }
          }
      return aResult;
  }
function getStyle(obj,name)
  {
       if(obj.currentStyle)
       {
           return obj.currentStyle[name];
       }
       
       else
       {
           return getComputedStyle(obj,false)[name];
       }
  }
 function startMove(obj,json,fnEnd)
  {
       clearInterval(obj.timer);
       obj.timer=setInterval(function()
       {
         var bStop=true;
         for(var attr in json)
         {  
               var cur=0;
    
               if(attr=='opacity')
               {
                    cur=Math.round(parseFloat(getStyle(obj,attr))*100);
               }
               else
               {
                    cur=parseInt(getStyle(obj,attr));
               }
          
               var  speed=(json[attr]-cur)/6;
               speed=speed>0?Math.ceil(speed):Math.floor(speed);
           
               if(cur!=json[attr]) bStop=false;
             
               if(attr=='opacity')
               {
                   obj.style.filter='alpha(opacity:'+(cur+speed)+')';
                   obj.style.opacity=(cur+speed)/100;
               }
               else
               {
                   obj.style[attr]=cur+speed+'px';
               }
         }
         
         if(bStop)
         {
             clearInterval(obj.timer);
             if(fnEnd) fnEnd();
         }
         
       },80)
       
     
  }
  arcSlip();