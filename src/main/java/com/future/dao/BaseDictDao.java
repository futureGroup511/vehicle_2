package com.future.dao;

import java.util.List;

import com.future.domain.BaseDict;

/**
 * @Package com.future.dao
 * 
 * @Title: BaseDictDao.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月8日 下午5:02:02
 * 
 * @Description:  
 *   
 */
public interface BaseDictDao extends BaseDao<BaseDict> {
    
	//根据类型或单位数据字典列表
	List<BaseDict> getListByTypeCode(String dict_type_code);
    
}
