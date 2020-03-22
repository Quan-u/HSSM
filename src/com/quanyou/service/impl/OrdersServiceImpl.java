package com.quanyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quanyou.dao.OrdersDao;
import com.quanyou.po.OrderItem;
import com.quanyou.po.Orders;
import com.quanyou.po.Shop;
import com.quanyou.service.OrdersService;

@Service("OrdersService")
@Transactional
public class OrdersServiceImpl implements OrdersService{
@Autowired
private OrdersDao Dao;

@Override
public List<Orders> selectOrdersList(int user_id) {
	// TODO Auto-generated method stub
	return Dao.selectOrdersList(user_id);
}

@Override
public Orders findOrderById(String id) {
	// TODO Auto-generated method stub
	Orders order=new Orders();
      order= Dao.findOrderById(id);
      List<OrderItem> items=Dao.findOrderItemByOrder(order);
      for(OrderItem item:items) {
    	  Shop shop=Dao.findShopByOrderItem(item.getProduct_id());
    	  item.setP(shop);
      }
      order.setOrderItems(items);
	return order;
}


}
