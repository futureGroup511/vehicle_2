package com.future.utils;

import java.util.List;

/**
 * @Package com.future.utils
 * 
 * @Title: PageBean.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年7月31日 下午3:41:27
 * 
 * @Description: 分页查询
 *   
 */
public class PageBean {
    
	
	//当前页数
	private Integer currentPage;
	//总记录数
	private Integer totalCount;
	//每页显示条数
	private Integer pageSize;
	//总页数
	private Integer totalPage;
	//分页列表
	private List list;

		
	public PageBean(Integer currentPage, Integer totalCount, Integer pageSize) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageSize = pageSize;
	    
		//如果没有指定页数的话，显示第一页
		if(this.currentPage == null) {
			this.currentPage=1;
		}
		
		//如果每页显示的条数没有指定的话，默认显示3条
		if(this.pageSize == null) {
		   this.pageSize=3;	
		}
		
		//计算总页数
		this.totalPage=(this.totalCount+this.pageSize-1)/this.pageSize;
		
	    /*
	     *    当前页数判断：
	     *     -不能小于1
	     *     -不能大于总页数      
	     */
		
		// -不能小于1
		if(this.currentPage<1) {
			this.currentPage=1;
		}
		
		//不能大于总页数  
		if(this.currentPage>this.totalPage) {
			this.currentPage=this.totalPage;
		}
		
	}
	
	//计算起始索引
	public int getStart() {
		return (this.currentPage-1)*this.pageSize;
	}
	
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	
	@Override
	public String toString() {
		return "PageBean [currentPage=" + currentPage + ", totalCount=" + totalCount + ", pageSize=" + pageSize
				+ ", totalPage=" + totalPage + ", list=" + list + "]";
	}
	
	
} 
