package com.quanyou.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quanyou.po.Shop;
import com.quanyou.po.User;
import com.quanyou.service.UserService;

@Controller
public class UserController {
@Autowired
private UserService userService;
//用户登录
@RequestMapping("/login.action")
public String login(HttpServletRequest request, HttpServletResponse response,String username,String password, Model model) throws UnsupportedEncodingException{
	User user=userService.findUser(username, password);
	if(user!=null) {
		request.getSession().setAttribute("user", user);
		return "homePage";
	}else {
	model.addAttribute("msg", "用户名或密码错误！");
	return "login";
	}
	
}
//用户注册
@RequestMapping("/insertUser")
public String insertUser(User user ,Model model,HttpSession session) {
	//时间转换
    String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    //上传时间
    user.setRegisterTime(Timestamp.valueOf(nowTime));
    int i;
	i=userService.insertUser(user);
	System.out.println(user); 
	if(i>0){
	
	session.setAttribute("insertUser", i);
		return "login";
	}else{
		return "register";
	}

}
//退出登录
@RequestMapping(value="logout.action")
public String logout(HttpSession session) {
	//清除session
	session.invalidate();
	/*return "redirect:login.action";*/
	return "login";
	
}
//个人资料时使用
@RequestMapping("/ByUserids")
public String ByUserids(int id,Model model){
	List<User> user=userService.ByUserids(id);
	model.addAttribute("PIM", user);
	return "pim";
}
//根据id查询账户（用户修改时使用）
@RequestMapping("/ByUserid")
@ResponseBody
public User ByUserid(String id){
	User user1=userService.ByUserid(id);
	return user1;
}
//更新账户
@RequestMapping("/updateUser")
@ResponseBody
public String updateUser(User user){
	int r=userService.updateUser(user);
	if(r>0){
		return "OK";
		
	}else{
	return "FALL";	
}
}

}
