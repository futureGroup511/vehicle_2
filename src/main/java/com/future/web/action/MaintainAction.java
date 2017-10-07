 package com.future.web.action;

import java.text.SimpleDateFormat;



import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.future.domain.BaseDict;

import com.future.domain.Maintain;
import com.future.domain.User;
import com.future.domain.Vehicle;

import com.future.service.MaintainService;
import com.future.service.UserService;
import com.future.service.VehicleService;
import com.future.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

/**
 * @Package com.future.web.action
 * 
 * @Title: MaintainAction.java 
 *
 * @author: 孤城落寞  
 *
 * @date 2017年8月20日 上午8:35:02
 * 
 * @Description: 维护信息的增删改查  
 *   
 */
public class MaintainAction extends BaseData implements ModelDriven<Maintain>{

	private Maintain maintain =new Maintain();
	private BaseDict baseDict=new BaseDict();
	private VehicleService vehicleService;
	private UserService  userService;
	private MaintainService maintainService;
	private int id;
	private int sign;
	private Maintain maintain1;
	
	// 当前页数
	private Integer currentPage;
	// 每页显示数据的条数
	private Integer pageSize;
	
	// 前台传进起始日期
	private String beginDateString;
	// 前台传进截止日期
	private String endDateString;
	
	// 类型装换  //起始日期  //截止日期	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private Date beginDate;
	private Date endDate;
	
	//session中获取User 
	Map session = ActionContext.getContext().getSession();
	User UserBySession = (User) session.get("admin");
	
	
	//跳转到添加维护信息录入
	public String addMaintain() throws Exception {
	
		return "addMaintain";
	}
	
	//维护信息录入
	public String saveMaintain() throws Exception {

		// 封装离线查询对象
		DetachedCriteria dc = DetachedCriteria.forClass(Vehicle.class);
		
		// 获取车辆档案号
		String vehicleId = maintain.getVehicleId();
		// 验证车辆
		Vehicle vehicleJudge = vehicleService.getVehicleId(vehicleId);
		
		if (!(vehicleJudge.getPlateId().equals(maintain.getPlateId()))) {
			request.put("maintainMessage", "信息录入失败！档案中的车牌号与录入的车牌号不符");
		}else  if (!(vehicleJudge.getUserName().equals(maintain.getUserName()))) {
			request.put("maintainMessage", "信息录入失败！档案中的车主与录入的车主信息不符不符");
		}else  if ((dc.add(Restrictions.like("operationStatus.dict_id", "9")) == null)) {
			request.put("maintainMessage", "信息录入失败！该车辆未备案");
		}else{
			request.put("maintainMessage", "信息录入成功");
			// 获取车主id
			Integer userId = vehicleJudge.getUserId();
			// 获取车主对象
			User u = userService.getUserById(userId);
			baseDict.setDict_id("12");
			maintain.setJudge(baseDict);
			// 设置车辆状态和车辆类
			BaseDict operationStatus = vehicleJudge.getOperationStatus();
			maintain.setCategory(vehicleJudge.getCategory());
			maintain.setOperationStatus(operationStatus);
			// 后台添加属性
			maintain.setUserPhone(u.getPhone());
			maintain.setUserId(userId);
			
			maintain.setDate(new Date());
			// 执行保存操作
			maintainService.saveMaintain(maintain);

			// 执行更新user和vehicle表
			userService.updateUserMaintain(userId);
			vehicleService.updateVehicleMaintain(vehicleId);
		}
		
		return "addMaintain";
	}
	
	//对于维护信息的查询
  	public String selectMainTain() throws Exception{

  		Maintain maintain=maintainService.getById(id);
  		request.put("maintain1",maintain);
  		return "selectMainTain";
  	}
  	
	// 对维护信息进行查询
	public String maintainList() throws Exception {

		// 封装离线查询对象
		DetachedCriteria dc = DetachedCriteria.forClass(Maintain.class);
		
		
		dc.add(Restrictions.like("judge.dict_id", "12", MatchMode.ANYWHERE));
		
		
		if(UserBySession!=null) {
			dc.add(Restrictions.eq("userId",UserBySession.getUserId())); 
		}
		
		// 判断并封装参数
		if (StringUtils.isNotBlank(maintain.getPlateId())) {
			dc.add(Restrictions.like("plateId", "%"+maintain.getPlateId()+"%"));
		}

		if (StringUtils.isNotBlank(maintain.getVehicleId())) {
			dc.add(Restrictions.like("vehicleId","%"+maintain.getVehicleId()+"%"));
		}
		if (StringUtils.isNotBlank(maintain.getUserName())) {
			dc.add(Restrictions.like("userName","%"+maintain.getUserName()+"%"));
		}
        	
		// 起始日期和截止日期都不为空
		if (StringUtils.isNotBlank(beginDateString) && StringUtils.isNotBlank(endDateString)) {
			// 获取时间			
			beginDate = sdf.parse(beginDateString);
			endDate = sdf.parse(endDateString);
			

			dc.add(Restrictions.between("date", beginDate, endDate)).addOrder(Order.desc("date")); 
		}

		// 起始日期不为空 截止日期为空
		if (StringUtils.isNotBlank(beginDateString) && StringUtils.isBlank(endDateString)) {
			// 获取时间
			beginDate = sdf.parse(beginDateString);
			endDate = new Date();
			

			dc.add(Restrictions.between("date", beginDate, endDate)).addOrder(Order.desc("date"));
		}

		// 起始日期为空 截止日期不为空
		if (StringUtils.isBlank(beginDateString) && StringUtils.isNotBlank(endDateString)) {
			// 获取时间
			endDate = sdf.parse(endDateString);
			beginDate = maintainService.getMaintainDateById();

			dc.add(Restrictions.between("date", beginDate, endDate)).addOrder(Order.desc("date"));
		}

		// 调用service 查询分页数据pagebean
		PageBean pb = maintainService.getPageBean(dc, currentPage, pageSize);

		// 将pagebean放到request域中，转发到页面显示
		ActionContext.getContext().getSession().put("pageBean", pb);
		return "maintainList";

	}

	
	@Override
	public Maintain getModel() {
		return maintain;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getBeginDateString() {
		return beginDateString;
	}

	public void setBeginDateString(String beginDateString) {
		this.beginDateString = beginDateString;
	}

	public String getEndDateString() {
		return endDateString;
	}

	public void setEndDateString(String endDateString) {
		this.endDateString = endDateString;
	}

	public void setVehicleService(VehicleService vehicleService) {
		this.vehicleService = vehicleService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setMaintainService(MaintainService maintainService) {
		this.maintainService = maintainService;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Maintain getMaintain1() {
		return maintain1;
	}

	public void setMaintain1(Maintain maintain1) {
		this.maintain1 = maintain1;
	}

	public int getSign() {
		return sign;
	}

	public void setSign(int sign) {
		this.sign = sign;
	}
}
