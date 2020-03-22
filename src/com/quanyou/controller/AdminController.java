package com.quanyou.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.plaf.metal.MetalFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.quanyou.po.Admin;
import com.quanyou.po.Orders;
import com.quanyou.po.Shop;
import com.quanyou.po.User;
import com.quanyou.service.AdminService;
import com.quanyou.utility.Info;

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

    public String createShop( @RequestParam("img") MultipartFile file,String fileName, Shop shop, HttpSession session,HttpServletRequest request,HttpServletResponse response) {
  String name=request.getParameter("name");
  String price=request.getParameter("price");
  String message=request.getParameter("message");
  String address=request.getParameter("address");
  String img=request.getParameter("img");
  Integer num=Integer.parseInt(request.getParameter("num"));
  String discount=request.getParameter("discount");
  String sDate=request.getParameter("sDate");
  String bDate=request.getParameter("bDate");
  String drugType=request.getParameter("drugType");
	  shop.setName(name);
	  shop.setPrice(price);
	  shop.setMessage(message);
	  shop.setAddress(address);
	  shop.setImg(img);
	  System.out.println("要上传的num是："+num);
	  shop.setNum(num);		   
	  shop.setDiscount(discount);
	  shop.setsDate(sDate);
	  shop.setbDate(bDate);
	  shop.setDrugType(drugType); 
    	//时间转换
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        //上传时间
      shop.setPutAway(Timestamp.valueOf(nowTime));
    	int i;
    	i=adminService.createShop(shop); 
    	if(!file.isEmpty()) {
    		  //上传文件路径
            String path = request.getSession().getServletContext().getRealPath("/yaoping/");
            String filename=fileName;
            File filepath=new File(path,filename);
            //判断路径是否存在，如果不存在就创建一个
            if(!filepath.getParentFile().exists()) {
            	filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            try {
				file.transferTo(new File(path+File.separator+filename));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
    	}
      
    	if(i>0) {
    		return "OK";
    	}else {
    		return "FILL";
    	}
    }
    //admin页面修改商品(1.根据id查询2.更新操作)
    @RequestMapping(value="/getShopById")
    @ResponseBody
    public Shop getShopById(String id) {
    	Shop shop=adminService.getShopById(id);
    	return shop;
    }
    @RequestMapping(value="/updateShop")
    @ResponseBody
    public String shop(Shop shop) {
    	int r=adminService.updateShop(shop);
    	if(r>0) {
    		return "OK";
    	}else {
    		return "FAIL";
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
    	model.addAttribute("hotBuyThisWeek", list);
    	return "homePage";
    }
}