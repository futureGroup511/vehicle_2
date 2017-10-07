package com.future.test;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.future.dao.UserDao;
import com.future.dao.VehicleDao;
import com.future.domain.BaseDict;
import com.future.domain.Maintain;
import com.future.domain.User;
import com.future.domain.Vehicle;

import com.future.service.MaintainService;

import com.future.service.UserService;
import com.future.service.VehicleService;
import com.future.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;

/**
 * @Package com.future.test
 * @Title: HibernateTest.java 
 * @author: 孤城落寞  
 * @date 2017年7月27日 上午9:34:07
 * @Description: hibernate和框架整合 测试
 *   
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class HibernateTest {

	@Test
	//单独测试hibernate
	public void fun() {
	
	Configuration conf=new Configuration().configure();
	SessionFactory sf=conf.buildSessionFactory();
	Session session=sf.openSession();
	Transaction tx=session.beginTransaction();
	 
	 User u=new User();	
	  
	   u.setCode("12345");
	   u.setPassword("12345");
	   u.setName("tom");
       u.setPhone("123456789");
	   u.setAddress("hky");
	   u.setDate(new Date());
	   
	   session.save(u);
	   tx.commit();
	   session.close();
	   sf.close();

	}
	
    @Resource(name="sessionFactory")
	private SessionFactory sf;
   
    @Test
    //测试spring管理sessionFactory
	public void fun2() {
		Session session=sf.openSession();
		Transaction tx=session.beginTransaction();
	    
		User u=new User();	
	    u.setCode("123456");
	    u.setPassword("123456");
	    u.setName("jock");
        u.setPhone("123456789");
	    u.setAddress("hsd");
	    u.setDate(new Date());
		session.save(u);
		
		tx.commit();
		session.close();
		//测试hibernateTemple模板
		
	}
   
    @Resource(name="userDao")
    private UserDao ud;
    @Resource(name="vehicleDao")
    private VehicleDao vd;
    @Test
    public void fun3() {
      /*  Vehicle user = vd.getById("00001");*/
        User user = ud.getById(1);
        
    	System.out.println(user);
    } 

    
    @Resource(name="userService")
    private UserService us; 
    @Test
    //测试aop事务
    public void fun4(){
    	BaseDict baseDict=new BaseDict();
    	
    	User u=new User();	
    	u.setCode("12341");
	    u.setPassword("12");
	    u.setName("rose"); 
        u.setPhone("123456789");
	    u.setAddress("hky");
	    u.setRole("admin");
	    u.setDate(new Date());
	    baseDict.setDict_id("12");
	    u.setJudge(baseDict);
        
	    us.saveUser(u);
    } 
    
    
    @Test
    //测试分页查询
    public void fun5() {
        DetachedCriteria dc=DetachedCriteria.forClass(User.class);
        dc.add(Restrictions.eq("role","ordinary"));
        dc.add(Restrictions.eq("judge","Y"));
        
//      dc.createAlias("judge", "bd"); 
//      dc.add(Restrictions.like("bd.dict_id","12")); 
//      DetachedCriteria dc = DetachedCriteria.forClass(Student.class); 
//      dc.createAlias("team", "t"); 
//      dc.add(Restrictions.like("t.teamName", teamName, MatchMode.ANYWHERE)); 
        
//      dc.add(Restrictions.eq("role","ordinary")).createAlias("judge", "bd")
//      .add(Restrictions.eq("bd.dict_id","12"));
        //dc.add(Restrictions.eq("judge", "12"));
        //detachedCriteria.add(Restrictions.eq("name", "department"))
       /* DetachedCriteria.forClass(Beauty.class);
        beautyCriteria.add(Restrictions.eq("name", "Gates")):*/
        PageBean bean = us.getPageBean(dc, null,null);
        System.out.println(bean); 
    } 
  

	  @Test
	  //测试code不能重复
	  public void fun6() {
		
		User u=new User();	
		u.setCode("12345678");
		u.setPassword("1211");
		u.setName("jock"); 
		u.setRole("both");
		u.setPhone("123456789");
		u.setAddress("xxxy");
		
		User judge = us.getUserJudge(u);
		System.out.println(judge);
		u.setDate(new Date());
		System.out.println("init...");
		us.saveUser(u); 
	  } 
	  
	  @Resource(name="vehicleService")
	  private VehicleService vs;
	  //添加车辆信息测试
	  @Test
	  public void fun7() {
		/* PLATE_ID, MODEL, ENGINE_ID, CAR_CHASSIS_ID, MANU_FACTURE_DATE, WEIGHT, USERS_ID, CATEGORY, OPERATION_STATUS, VEHICLE_ID*/
		 Vehicle ve=new Vehicle(); 
		 ve.setWeight(12133.00);
		 ve.setManufactureDate(new Date());
		 ve.setPlateId("FF");
		 ve.setCarChassisId("123456");
		 ve.setEngineId("123456");
		 ve.setModel("123456");
		 String id=vs.getVehicleId();
	     ve.setVehicleId(id);
		 vs.saveVehicle(ve);
	  } 
	  
	  @Resource(name="maintainService")
	  private MaintainService ms;

	  @Test
	  //维护信息录入
	  public void fun8() throws Exception {
		    
		    Maintain maintain =new Maintain();	    
		    BaseDict baseDict=new BaseDict();
		    String vehicleId = "00001";
		    //封装离线查询对象
	  		DetachedCriteria dc=DetachedCriteria.forClass(Vehicle.class);
		    
		    Vehicle vehicleJudge = vs.getVehicleId(vehicleId);
		   
		    
		    if(!(vehicleJudge.getPlateId().equals("12312"))) {
	  			 throw new RuntimeException("信息录入失败！档案中的车牌号与录入的车牌号不符");
	  		}
	  		
		    if(!(vehicleJudge.getUserName().equals("jock"))) {
	  			throw new RuntimeException("信息录入失败！档案中的车主与录入的车主信息不符不符");
	  		}
	  		
		   
		    
		    if((dc.add(Restrictions.like("operationStatus.dict_id", "9"))!=null)) {
	  			throw new RuntimeException("信息录入失败！该车辆未备案");
	  		}
		    
		    Integer userId = vehicleJudge.getUserId();
		    User u = us.getUserById(userId);
		    //设置查询状态
		    baseDict.setDict_id("12");
		    maintain.setJudge(baseDict);
		    
		    //设置车辆状态
		    
//		    maintain.setCategory(category);
		    System.out.println(u);
		    maintain.setUserPhone(u.getPhone());
		    maintain.setPlateId("12312");
	  		maintain.setVehicleId(vehicleId);
	  		maintain.setUserId(userId);
	  	   
	  		//在录入信息是直接吧时间改成到期时间
	  		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  		Date date=new Date();
			Calendar c = Calendar.getInstance();
			c.add(Calendar.DAY_OF_MONTH,+120);
			Date endDate=sdf.parse(sdf.format(c.getTime()));	
	  		maintain.setDate(endDate);
	  		
	  		us.updateUserMaintain(userId);
	  		ms.saveMaintain(maintain);
	  		
	  		
	  		
	  		
	  } 
	  @Test
	  //测试user信息变化
	  public void fun9() {
		 User user = ud.getById(1);		
		 System.out.println(user);
		 Integer maintainNumber= user.getMaintainNumber();
		 if(maintainNumber==null) {
			 maintainNumber=0;
		 }
		 System.out.println(maintainNumber);
		 maintainNumber++;
		 System.out.println(maintainNumber);
		 user.setMaintainNumber(maintainNumber);
		 System.out.println(user);
		 
		 ud.save(user);    
		  
		  
	  } 
	  
	  @Test
	  //测试查询车辆状态
	  public void fun10() {
		
		//封装离线查询对象
	    DetachedCriteria dc = DetachedCriteria.forClass(Vehicle.class); 
	    dc.add(Restrictions.like("operationStatus.dict_id", "10",MatchMode.ANYWHERE)); 
  		//调用service 查询分页数据pagebean
  		PageBean pb=vs.getPageBean(dc,null,null);
  		
  		System.out.println(pb);
   
	  } 
	  
	  @Test
	  //测试maintain中的时间查询
	  public void fun11() throws Exception {
		  /*DetachedCriteria dc = DetachedCriteria.forClass(BaseDict.class);
		  dc.add(Restrictions.eq("dict_id", "10"));*/
		 /* Maintain ma=new Maintain(); */
//	     Vehicle vehicle=new Vehicle();
		  //封装离线查询对象
//		  DetachedCriteria criteriaInner=DetachedCriteria.forClass(Vehicle.class); 
		  
		  
		  
//		  DetachedCriteria dc = criteriaInner.createAlias(Maintain.class);
		 
//		  criteriaInner.add(Restrictions.eq("name", "Bob"));
		 /* Date endDate = null;*/
//		  List clazzList =  criteria.list();
		  DetachedCriteria dc=DetachedCriteria.forClass(Maintain.class); 
	
		 /* SimpleDateFormat sdf    = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  Date beginDate = sdf.parse("2017-08-13 00:00:00");*/
		  
// 		  dc.add(Restrictions.like("category", "5"));
		  /*System.out.println(dc.add(Restrictions.like("category.dict_id", "5"))!=null);*/
		  /*//如果是货车的话
		  if(dc.add(Restrictions.like("category.dict_id", "5"))!=null){
			  Date date=new Date();
			  Calendar c = Calendar.getInstance();
			  c.add(Calendar.DAY_OF_MONTH,-120);
			  beginDate=sdf.parse(sdf.format(c.getTime())); 
		  }
		  //判断他是不是客车
		  if(dc.add(Restrictions.like("category.dict_id", "1"))!=null) {
			  Date date=new Date();
			  Calendar c = Calendar.getInstance();
			  c.add(Calendar.DAY_OF_MONTH,-90);
			  beginDate=sdf.parse(sdf.format(c.getTime())); 
		  }*/
		  String beginDate="2017-12-01 15:55:37";
		  String endDate="2017-12-14 16:08:12";
		  dc.add(Restrictions.between("date",beginDate,endDate)).
          addOrder( Order.desc("date"));
          
		  
		
		  //调用service 查询分页数据pagebean
		  PageBean pb=ms.getPageBean(dc,null,null);
		  
		  System.out.println(pb);
		  
	  } 
	  @Test
	  //测试到期车辆
	  public void fun12() throws Exception {
		 
		  //封装离线查询对象
		  DetachedCriteria dc=DetachedCriteria.forClass(Maintain.class); 

		  
		  SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  Date date=new Date();
		  Calendar c = Calendar.getInstance();
		  c.add(Calendar.DAY_OF_MONTH,+20);
		  Date endDate=sdf.parse(sdf.format(c.getTime()));
		  dc.add(Restrictions.like("plateId", "1231"));
		  dc.add(Restrictions.lt("date",endDate))
		  .addOrder( Order.desc("date"));
		    
		  //调用service 查询分页数据pagebean
		  PageBean pb=ms.getPageBean(dc,null,null);
		  
		  System.out.println(pb);
		  
	  } 
	 
	  @Test
	  //测试最小id
	  public void fun13() throws Exception {
		  
		 Date date = ms.getMaintainDateById();
		  
		 System.out.println(date);
		  
	  } 
	  
	  
	  
 }