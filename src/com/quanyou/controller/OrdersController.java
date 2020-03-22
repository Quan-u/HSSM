package com.quanyou.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quanyou.po.Orders;
import com.quanyou.service.OrdersService;

@Controller
public class OrdersController {
@Autowired 
private OrdersService Dao;
//根据用户名查询用户资料
@RequestMapping("/selectOrdersList")
public String selectOrdersList(Model model,int user_id) {
	if(user_id>0) {
		List<Orders> list=Dao.selectOrdersList(user_id);
		model.addAttribute("myOrders", list);
		return "myOrders";
	}
	return "";
	
}
//根据自己id查看订单详情
@RequestMapping(value="/findOrderById")
public String findOrderById(Model model,String id) {
	Orders order=Dao.findOrderById(id);
	model.addAttribute("order", order);
	return "myOrdersInfo";
}

}
