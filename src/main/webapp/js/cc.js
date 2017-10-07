
 /**   这个方法可以使指定外层块 中方的内层快，被点击后块中内容输出在另一个指定块
  *    支持分层
  * 
  * 
  * @param {any} obj1      外层块
  * @param {any} Elementname    分层块的   标签名 
  * @param {any} obj2     输出块
  */
 function change(obj1,Elementname,obj2,String1){
    var true1 = document.getElementById(obj1),
        trueObj2 = document.getElementById(obj2),
        zijie = trueObj2.innerText;
        var zijie2;Obj
        trueObj2.innerText =zijie2= zijie+'>>'+String1;
        trueObj1.onclick = function(event){
            var clickText = event.srcElement.innerText;
            var clicktagname = event.srcElement.tagName;
            if(clicktagname==Elementname){
                trueObj2.innerText = zijie + '>>' +clickText;
                zijie2=trueObj2.innerText;
            }
            else{
                trueObj2.innerText = zijie2 + '>>' + clickText;
            }
        }
}
change('zijie','H3','here_area',"用户管理");
 
