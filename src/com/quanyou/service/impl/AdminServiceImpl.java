package com.quanyou.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quanyou.dao.AdminDao;
import com.quanyou.po.Admin;
import com.quanyou.po.Orders;
import com.quanyou.po.Shop;
import com.quanyou.po.User;
import com.quanyou.service.AdminService;


@Service("AdminService")
@Transactional
public class AdminServiceImpl implements AdminService {
@Autowired
private AdminDao Dao;


@Override
public Admin findAdmin(String ad_username, String ad_password) {
	// TODO Auto-generated method stub
	return Dao.findAdmin(ad_username, ad_password);
}


@Override
public List<Admin> selectAdminList(String ad_username) {
	// TODO Auto-generated method stub
	return Dao.selectAdminList(ad_username);
}


@Override
public Admin ByAdminId(String ad_id) {
	// TODO Auto-generated method stub
	return Dao.ByAdminId(ad_id);
}


@Override
public int updateAdmin(Admin admin) {
	// TODO Auto-generated method stub
	return Dao.updateAdmin(admin);
}


@Override
public List<User> selectUserInfoList() {
	// TODO Auto-generated method stub
	return Dao.selectUserInfoList();
}


@Override
public int createUser(User user) {
	// TODO Auto-generated method stub
	return Dao.createUser(user);
}


@Override
public int deleteUser(String id) {
	// TODO Auto-generated method stub
	return Dao.deleteUser(id);
}


@Override
public List<User> mohuchaxun(String username, String phone) {
	// TODO Auto-generated method stub
	return Dao.mohuchaxun(username, phone);
}


@Override
public List<Orders> AdminOrdersList() {
	// TODO Auto-generated method stub
	return Dao.AdminOrdersList();
}


@Override
public List<Orders> AdminOrderById(String id) {
	// TODO Auto-generated method stub
	return Dao.AdminOrderById(id);
}


@Override
public Orders updateUserAdressById(String id) {
	// TODO Auto-generated method stub
	return Dao.updateUserAdressById(id);
}


@Override
public int updateUserAdress(Orders order) {
	// TODO Auto-generated method stub
	return Dao.updateUserAdress(order);
}


@Override
public int deleteAdminOrder(String id) {
	// TODO Auto-generated method stub
	return Dao.deleteAdminOrder(id);
}


@Override
public List<Shop> AdminShopList() {
	// TODO Auto-generated method stub
	return Dao.AdminShopList();
}


@Override
public List<Shop> mohuchaxunShop(String id, String name,String drugType) {
	// TODO Auto-generated method stub
	return Dao.mohuchaxunShop(id, name,drugType);
}


@Override
public int createShop(Shop shop) {
	// TODO Auto-generated method stub
	return Dao.createShop(shop);
}


@Override
public Shop getShopById(String id) {
	// TODO Auto-generated method stub
	return Dao.getShopById(id);
}


@Override
public int updateShop(Shop shop) {
	// TODO Auto-generated method stub
	return Dao.updateShop(shop);
}


@Override
public int deleteShop(Integer id) {
	// TODO Auto-generated method stub
	return Dao.deleteShop(id);
}


@Override
public User findSex(String sex) {
	// TODO Auto-generated method stub
	return Dao.findSex(sex);
}


@Override
public List<Map<String, Object>> findCommodityStocks(String drugType) {
	// TODO Auto-generated method stub
	return Dao.findCommodityStocks(drugType);
}


@Override
public List<Map<String, Object>> findCommodityPrice(String drugType) {
	// TODO Auto-generated method stub
	return Dao.findCommodityPrice(drugType);
}


@Override
public List<Shop> HotBuyThisWeek() {
	// TODO Auto-generated method stub
	return Dao.HotBuyThisWeek();
}




}
