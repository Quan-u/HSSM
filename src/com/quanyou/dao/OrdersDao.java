package com.quanyou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.quanyou.po.OrderItem;
import com.quanyou.po.Orders;
import com.quanyou.po.Shop;

public interface OrdersDao {
//查看个人中心我的订单
	public List<Orders> selectOrdersList(@Param("user_id") int user_id);
	//user页面查看订单详情(一起三个方法)
	public Orders findOrderById(String id);
	//查询订单详情中的所有商品对应的数量
  	public List<OrderItem> findOrderItemByOrder(Orders order);
  	//查询订单详情中所有商品的信息
  	public Shop findShopByOrderItem(String product_id);
	
}
