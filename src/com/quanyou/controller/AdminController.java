package com.quanyou.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.plaf.metal.MetalFileChooserUI;
import javax.swing.text.Document;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.quanyou.po.Admin;
import com.quanyou.po.AdminImg;
import com.quanyou.po.Orders;
import com.quanyou.po.Shop;
import com.quanyou.po.User;
import com.quanyou.service.AdminService;
import com.quanyou.utility.Info;
import com.quanyou.utility.UploadedImageFile;

import javassist.util.proxy.MethodFilter;

@Controller
public class AdminController {
@Autowired AdminService adminService;
@RequestMapping(value="/AdminLogin",method=RequestMethod.POST)
public String findAdmin(Model model,String ad_username,String ad_password,HttpSession session) {
 Admin admin=adminService.findAdmin(ad_username, ad_password);
 if(admin!=null) {
	 session.setAttribute("Admin_session", admin);
	 return "adminGoMain";
	 }
     model.addAttribute("msg", "用户名或密码错误,请重新输入!");
	return "adminLogin";
	
}
//admin退出登录
@RequestMapping(value="/loginOut")
public String loginOut(HttpSession session) {
	session.invalidate();
	return "redirect:login";//重定向
}
//向用户登录页面跳转
@RequestMapping(value="/login",method=RequestMethod.GET)
public String toLogin(){
	return "adminLogin";
	
}
//根据admin名查询资料
@RequestMapping(value="/selectAdminList")
public String selectAdminList(Model model,String ad_username) {
	if(ad_username!=null) {
		List<Admin> admin=adminService.selectAdminList(ad_username);
		model.addAttribute("admin",admin);
		return "adminInfo";
	}
	return "";
	
}
//先根据id查询
@RequestMapping(value="/ByAdminId")
@ResponseBody
public Admin ByAdminId(String ad_id) {
	Admin admin=adminService.ByAdminId(ad_id);
	return admin;
	
}
//更新admin账户
@RequestMapping("/updateAdmin")
@ResponseBody
public String updateAdmin(Admin admin) {
	int a=adminService.updateAdmin(admin);
	if(a>0) {
		return "OK";
	}else {
		return "FALL";
		
	}
}
//admin页面查询用户列表
@RequestMapping(value="/selectUserInfoList")
public String selectUserInfoList(Model model) {
List<User> list	=adminService.selectUserInfoList();
model.addAttribute("selectUserInfoList",list);
	return "adminUserInfo";
}
//用户管理列表添加用户
	@RequestMapping("/createUser")
	@ResponseBody
	public String createUser(User user,HttpSession session){
		//时间转换
	    String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	    user.setRegisterTime(Timestamp.valueOf(nowTime));
		int i;
		i=adminService.createUser(user);
		if(i>0){
			return "OK";
		}else{
			return "FALL";
		}
		
	}
//admin页面删除用户
@RequestMapping(value="/deleteUser")
@ResponseBody
public String deleteUser(String id) {
	int r=adminService.deleteUser(id);
	if(r>0){
		return "OK";
	}else{
		return "FAIL";
		
	}
}
	//admin页面用户模糊查询
	@RequestMapping(value="/mohuchaxun")
	public String mohuchaxun(String username,String phone,Model model){
		if(username!=null||phone!=null) {
			List<User> list=adminService.mohuchaxun(username, phone);
			model.addAttribute("selectUserInfoList", list);
			return "adminUserInfo";
		}
		return "";
	}
	//admin页面查询所有订单信息
    @RequestMapping(value="/AdminOrdersList")
    public String AdminOrdersList(Model model) {
    	List<Orders> list=adminService.AdminOrdersList();
    	model.addAttribute("AdminOrdersList", list);
    	return "adminOrdersInfo";
    } 
    //admin页面根据订单号查询
    @RequestMapping(value="/AdminOrderById")
    public String AdminOrderById(Model model,String id) {
    List<Orders> list=adminService.AdminOrderById(id);
    model.addAttribute("AdminOrdersList", list);
    	return "adminOrdersInfo";
    }
  //根据orders表 Id 查询数据,//修改用户下单信息 
    @RequestMapping("/updateUserAdressById")
    @ResponseBody
    public Orders updateUserAdressById(String id){
    	Orders order=adminService.updateUserAdressById(id);
    	return order;
    	
    }
    @RequestMapping("/updateUserAdress")
    @ResponseBody
    public String updateUserAdress(Orders order){
    	int r=adminService.updateUserAdress(order);
    	if(r>0){
    		return "OK";
    	}else{
    		return "FAIL";
    	}	
    }
    //admin删除订单功能
    @RequestMapping(value="/deleteAdminOrder")
    @ResponseBody
    public String deleteAdminOrder(String id) {
    	int r=adminService.deleteAdminOrder(id);
    	if(r>0) {
    		return "OK";
    	}
    	return "FAIL";
    }
    //admin页面商品列表
    @RequestMapping(value="/AdminShopList")
    public String AdminShopList(Model model) {
    	List<Shop> list=adminService.AdminShopList();
    	model.addAttribute("AdminShopList", list);
    	return "adminShopInfo";
    }
    //admin页面根据id和商品名进行模糊查询
    @RequestMapping(value="/mohuchaxunShop")
    public String mohuchaxunShop(String id,String name,Model model,String drugType) {
    	if(id!=null||name!=null||drugType!=null) {
    		List<Shop> list=adminService.mohuchaxunShop(id, name,drugType);
    		model.addAttribute("AdminShopList", list);
    		return "adminShopInfo";
    	}
    	return "";
    }
    //admin页面创建商品信息
    @RequestMapping(value="/createShop")
    public void createShop( UploadedImageFile file, HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {
    	String name1=RandomStringUtils.randomAlphabetic(10);
    	String newFileName = name1 + ".jpg";
    	 File newFile = new File(request.getServletContext().getRealPath("/yaoping"), newFileName);
    	 System.out.println(newFile.toString()+"fffffffffff");
         try {
        	 newFile.getParentFile().mkdirs();
    		file.getImg().transferTo(newFile);
    	} catch (IllegalStateException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	} catch (IOException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	String name=request.getParameter("name");
    	  String price=request.getParameter("price");
    	  String message=request.getParameter("message");
    	  String address=request.getParameter("address");
    	  String img="yaoping/"+newFileName;
    	  Integer num=Integer.parseInt(request.getParameter("num"));
    	  String discount=request.getParameter("discount");
    	  String sDate=request.getParameter("sDate");
    	  String bDate=request.getParameter("bDate");
    	  String drugType=request.getParameter("drugType");
    	System.out.println(name+""+price+""+message+""+address+""+img+""+num+""+discount+""+sDate+""+bDate);
         	Shop shop=new  Shop();
    		  shop.setName(name);
    		  shop.setPrice(price);
    		  shop.setMessage(message);
    		  shop.setAddress(address);
    		  shop.setImg(img);
    		  if(num!= 0) {
    			  shop.setNum(num);		
    		  }else{
    			   shop.setNum(0); 
    		  }  		 
    		  shop.setDiscount(discount);
    		  shop.setsDate(sDate);
    		  shop.setbDate(bDate);
    		  shop.setDrugType(drugType);
              int i;
           	i=adminService.createShop(shop); 
     	  System.out.println("上传数据库成功!");
    	 if(i>0) {
    	       System.out.println("商品添加成功");
    			response.setCharacterEncoding("utf-8");
				response.getWriter().print("商品添加成功");
		
    	}else {
    		response.setCharacterEncoding("utf-8");
			response.getWriter().print("商品添加成功");
    		System.out.println("商品添加失败");	
    	}
        /* ModelAndView mav = new ModelAndView("showUploadedFile");
         mav.addObject("imageName", newFileName);
         return mav;*/
		
    	
    }

    //admin页面修改商品(1.根据id查询2.更新操作)
    @RequestMapping(value="/getShopById")
    @ResponseBody
    public Shop getShopById(String id) {
    	Shop shop=adminService.getShopById(id);
    	return shop;
    }
/*    @RequestMapping(value="/updateShop")
    @ResponseBody
    public String shop(Shop shop) {
    	int r=adminService.updateShop(shop);
    	if(r>0) {
    		return "OK";
    	}else {
    		return "FAIL";
    	}
    	
    }*/
    @RequestMapping(value="/updateShop")
    public void shop(UploadedImageFile file,HttpServletRequest request) {
    	String name1=RandomStringUtils.randomAlphabetic(10);
    	String newFileName = name1 + ".jpg";
    	 File newFile = new File(request.getServletContext().getRealPath("/yaoping"), newFileName);
    	 System.out.println(newFile.toString()+"fffffffffff");
         try {
        	 newFile.getParentFile().mkdirs();
    		file.getImg().transferTo(newFile);
    	} catch (IllegalStateException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	} catch (IOException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
         String id=request.getParameter("id");
         String name=request.getParameter("name");
   	  String price=request.getParameter("price");
   	  String message=request.getParameter("message");
   	  String address=request.getParameter("address");
   	  String img="yaoping/"+newFileName;
   	  Integer num=Integer.parseInt(request.getParameter("num"));
   	  String discount=request.getParameter("discount");
   	  String sDate=request.getParameter("sDate");
   	  String bDate=request.getParameter("bDate");
   	  String drugType=request.getParameter("drugType");
   	System.out.println(name+""+price+""+message+""+address+""+img+""+num+""+discount+""+sDate+""+bDate);
        	Shop shop=new  Shop();
          shop.setId(id);
   		  shop.setName(name);
   		  shop.setPrice(price);
   		  shop.setMessage(message);
   		  shop.setAddress(address);
   		  shop.setImg(img);
   		  shop.setNum(num);		   
   		  shop.setDiscount(discount);
   		  shop.setsDate(sDate);
   		  shop.setbDate(bDate);
   		  shop.setDrugType(drugType);
    	int r=adminService.updateShop(shop);
    	if(r>0) {
    System.out.println("商品更新成功");
    	}else {
    		 System.out.println("商品更新失败");
    	}
    	
    }
    //admin页面商品列表删除功能
    @RequestMapping(value="/deleteShop")
    @ResponseBody
    public String deleteShop(Integer id) {
    	int r=adminService.deleteShop(id);
    	if(r>0) {
    		return "OK";
    	}else {
    		return "FAIL";	
    	}
    	
    }
/*    //admin商品页面根据商品类型查询商品 
    @RequestMapping(value="/selectShopType")
    public String selectShopType(Model model,String drugType) {
    List<Shop> list=adminService.ShopType(drugType);
    mode
    	return "";
    }*/
    @RequestMapping(value="/findSex")
    @ResponseBody
    public User findSex(Model model,String sex) {
   User list=adminService.findSex(sex);
   model.addAttribute("list", list);
    return list;
    }
    //查询商品库存
    @RequestMapping(value="/findCommodityStocks")
    @ResponseBody
    public List<Map<String,Object>> findCommodityStocks(String drugType) {
    List<Map<String,Object>> map=adminService.findCommodityStocks(drugType);
	return map;
    
    }
    //查询商品折扣
    @RequestMapping(value="/findCommodityPrice")
    @ResponseBody
    public List<Map<String,Object>> findCommodityPrice(String drugType) {
    List<Map<String,Object>> map=adminService.findCommodityPrice(drugType);
    	return map;
    }
    //本周热买
    @RequestMapping(value="/HotBuyThisWeek")
    public String HotBuyThisWeek(Model model){
    	List<Shop> list=adminService.HotBuyThisWeek();
    	/*主页加载图片(和本周热卖一起加载)*/
    	List<AdminImg> lists=adminService.adminImgList();
    	model.addAttribute("adminImgList", lists); 		
    	model.addAttribute("hotBuyThisWeek", list);
    	return "homePage";
    }
    //管理员页面修改主页图片 先遍历全部
    @RequestMapping("/adminImgList")
    public String adminImgList(Model model) {
    	List<AdminImg> list=adminService.adminImgList();
    	model.addAttribute("adminImgList", list); 			
    	return "adminImg";
    }
    //主页加载图片
 /*   @RequestMapping("/adminImgList1")
    public String adminImgList1(Model model) {
    	List<AdminImg> list=adminService.adminImgList();
    	model.addAttribute("adminImgList", list); 			
    	return "homePage";
    }*/
    //修改主页图片 第一张
    @RequestMapping(value="/updateAdminImg1",method=RequestMethod.POST)
    public void updateAdminImg1(UploadedImageFile file,HttpServletResponse response,HttpServletRequest request) throws IOException {
    	String name1=RandomStringUtils.randomAlphabetic(10);
    	String newFileName = name1 + ".jpg";
    	 File newFile = new File(request.getServletContext().getRealPath("/adminImg"), newFileName);
    	 System.out.println(newFile.toString()+"fffffffffff");
         try {
        	 newFile.getParentFile().mkdirs();
    		file.getImg().transferTo(newFile);
    	} catch (IllegalStateException e) { 
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	} catch (IOException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	Integer id=Integer.parseInt(request.getParameter("id1"));
    	 String img="adminImg/"+newFileName;
         String imgTwo=request.getParameter("two1");
         String imgThree=request.getParameter("three1");
         AdminImg adminImg=new AdminImg();
         adminImg.setId(id);
         adminImg.setImgOne(img);
         adminImg.setImgTwo(imgTwo);
         adminImg.setImgThree(imgThree);
    	int sum=adminService.updateAdminImg(adminImg);
    	if(sum>0) {
    		response.setCharacterEncoding("utf-8");
    		response.getWriter().print("主页图片更新成功！");
    		System.out.println("主页图片更新成功！");
    	}else {
    		response.setCharacterEncoding("utf-8");
    		response.getWriter().print("主页图片更新失败！");
    		System.out.println("主页图片更新失败！");
    	}
    	
    }
  //修改主页图片 第二张
    @RequestMapping(value="/updateAdminImg2",method=RequestMethod.POST)
    public void updateAdminImg2(UploadedImageFile file,HttpServletResponse response,HttpServletRequest request) throws IOException {
    	String name1=RandomStringUtils.randomAlphabetic(10);
    	String newFileName = name1 + ".jpg";
    	 File newFile = new File(request.getServletContext().getRealPath("/adminImg"), newFileName);
    	 System.out.println(newFile.toString()+"fffffffffff");
         try {
        	 newFile.getParentFile().mkdirs();
    		file.getImg().transferTo(newFile);
    	} catch (IllegalStateException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	} catch (IOException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	Integer id=Integer.parseInt(request.getParameter("id2"));
         String imgOne=request.getParameter("one2");
         String img="adminImg/"+newFileName;
         String imgThree=request.getParameter("three2");
         AdminImg adminImg=new AdminImg();
         adminImg.setId(id);
         adminImg.setImgOne(imgOne);
         adminImg.setImgTwo(img);
         adminImg.setImgThree(imgThree);
    	int sum=adminService.updateAdminImg(adminImg);
    	if(sum>0) {
    		response.setCharacterEncoding("utf-8");
    		response.getWriter().print("主页图片更新成功！");
    		System.out.println("主页图片更新成功");
    	}else {
    		response.setCharacterEncoding("utf-8");
    		response.getWriter().print("主页图片更新失败！");
    		System.out.println("主页图片更新失败");
    	}
    	
    }
    
    //修改主页图片 第三张
    @RequestMapping(value="/updateAdminImg3",method=RequestMethod.POST)
    public void updateAdminImg3(UploadedImageFile file,HttpServletResponse response,HttpServletRequest request) throws IOException {
    	String name1=RandomStringUtils.randomAlphabetic(10);
    	String newFileName = name1 + ".jpg";
    	 File newFile = new File(request.getServletContext().getRealPath("/adminImg"), newFileName);
    	 System.out.println(newFile.toString()+"fffffffffff");
         try {
        	 newFile.getParentFile().mkdirs();
    		file.getImg().transferTo(newFile);
    	} catch (IllegalStateException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	} catch (IOException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	Integer id=Integer.parseInt(request.getParameter("id3"));
         String imgOne=request.getParameter("one3");
         String imgTwo=request.getParameter("two3");
    	 String img="adminImg/"+newFileName;
         AdminImg adminImg=new AdminImg();
         adminImg.setId(id);
         adminImg.setImgOne(imgOne);
         adminImg.setImgTwo(imgTwo);
         adminImg.setImgThree(img);
    	int sum=adminService.updateAdminImg(adminImg);
    	if(sum>0) {
    		response.setCharacterEncoding("utf-8");
    		response.getWriter().print("主页图片更新成功！");
    		System.out.println("主页图片更新成功");
    	}else {
    		response.setCharacterEncoding("utf-8");
    		response.getWriter().print("主页图片更新失败!");
    		System.out.println("主页图片更新失败");
    	}
    	
    }
}