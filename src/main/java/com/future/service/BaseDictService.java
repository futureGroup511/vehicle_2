package com.future.service;

import java.util.List;

import com.future.domain.BaseDict;

/**
 * @Package com.future.service
 * 
 * @Title: BaseDictSerivce.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月8日 下午4:55:35
 * 
 * @Description:  
 *   
 */
public interface BaseDictService {
    
    //根据数据字典类型字段获得数据字典对象
	List<BaseDict> getListByTypeCode(String dict_type_code);
  
}
