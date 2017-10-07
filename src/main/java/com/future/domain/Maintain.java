package com.future.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @Package com.future.domain
 * 
 * @Title: Maintain.java
 *
 * @author: 孤城落寞
 *
 * @date 2017年7月31日 下午4:40:40
 * 
 * @Description: 维护信息
 * 
 */
public class Maintain {
    
	//维护信息的编号
	private Integer maintainId;
	//车主id
	private Integer userId;
	//车主姓名
	private String userName;
	//车辆档案号
	private String vehicleId;
	//车牌号
	private String plateId;
	//维护信息的录入日期
	private Date date;
    //假删除  Y能查询到  N不能查询
	private BaseDict judge;
	//车的类型
	private String category;
	//车辆状态
	private BaseDict operationStatus;
	
	//联系方式 
	private String userPhone;
	
	
	public Integer getMaintainId() {
		return maintainId;
	}

	public void setMaintainId(Integer maintainId) {
		this.maintainId = maintainId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getVehicleId() {
		return vehicleId;
	}

	public void setVehicleId(String vehicleId) {
		this.vehicleId = vehicleId;
	}

	public String getPlateId() {
		return plateId;
	}

	public void setPlateId(String plateId) {
		this.plateId = plateId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
   
	public BaseDict getJudge() {
		return judge;
	}

	public void setJudge(BaseDict judge) {
		this.judge = judge;
	}
   
	
	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
    
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public BaseDict getOperationStatus() {
		return operationStatus;
	}

	public void setOperationStatus(BaseDict operationStatus) {
		this.operationStatus = operationStatus;
	}

	@Override
	public String toString() {
		return "Maintain [maintainId=" + maintainId + ", userId=" + userId + ", userName=" + userName + ", vehicleId="
				+ vehicleId + ", plateId=" + plateId + ", date=" + date + ", judge=" + judge + ", category=" + category
				+ ", operationStatus=" + operationStatus + ", userPhone=" + userPhone + "]";
	}

}
