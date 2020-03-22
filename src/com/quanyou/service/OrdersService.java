package com.quanyou.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.quanyou.po.OrderItem;
import com.quanyou.po.Orders;
import com.quanyou.po.Shop;

public interface OrdersService {
	//查看个人中心（我的订单）
		public List<Orders> selectOrdersList(@Param("user_id") int user_id);
		//user页面查看订单详情
		public Orders findOrderById(String id);
}
