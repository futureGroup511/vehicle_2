package com.future.web.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.future.domain.BaseDict;
import com.future.service.BaseDictService;
import com.opensymphony.xwork2.ActionSupport;

import net.sf.json.JSONArray;

/**
 * @Package com.future.web.action
 * 
 * @Title: BaseDictAction.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月8日 下午4:30:07
 * 
 * @Description:  
 *   
 */
public class BaseDictAction extends ActionSupport{
                      
	private String dict_type_code;
	
	private BaseDictService baseDictService;
 	
    @Override
    public String execute() throws Exception {
      //1.调用Service根据typeCode获得数据字典对象list       
    	List<BaseDict> list=baseDictService.getListByTypeCode(dict_type_code);
      //2.将list转换为json格式	
    	String json=JSONArray.fromObject(list).toString(); 
    	
      //3.将json发送给浏览器
       ServletActionContext.getResponse().setContentType("application/json;charset=utf-8");
       ServletActionContext.getResponse().getWriter().write(json);
      	
      //4.告诉struts2不需要进行结果处理
       return null;
    
    }

	public void setDict_type_code(String dict_type_code) {
		this.dict_type_code = dict_type_code;
	}

	public String getDict_type_code() {
		return dict_type_code;
	}

	public void setBaseDictService(BaseDictService baseDictService) {
		this.baseDictService = baseDictService;
	}
    
}
