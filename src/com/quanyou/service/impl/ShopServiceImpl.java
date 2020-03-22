package com.quanyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quanyou.dao.ShopDao;
import com.quanyou.po.OrderItem;
import com.quanyou.po.Orders;
import com.quanyou.po.Shop;
import com.quanyou.service.ShopService;
@Service("ShopService")
@Transactional
public class ShopServiceImpl implements ShopService{
@Autowired
 private ShopDao Dao;
	@Override
	public List<Shop> findShopByName(String name) {
		// TODO Auto-generated method stub
		return Dao.findShopByName(name);
	}

	@Override
	public List<Shop> findAll() {
		// TODO Auto-generated method stub
		return Dao.findAll();
	}

	@Override
	public List<Shop> salesDescend() {
		// TODO Auto-generated method stub
		return Dao.salesDescend();
	}

	@Override
	public List<Shop> salesAsc() {
		// TODO Auto-generated method stub
		return Dao.salesAsc();
	}

	@Override
	public List<Shop> NewProductDescend() {
		// TODO Auto-generated method stub
		return Dao.NewProductDescend();
	}

	@Override
	public List<Shop> NewProductAsc() {
		// TODO Auto-generated method stub
		return Dao.NewProductAsc();
	}

	@Override
	public List<Shop> priceDescend() {
		// TODO Auto-generated method stub
		return Dao.priceDescend();
	}

	@Override
	public List<Shop> priceAsc() {
		// TODO Auto-generated method stub
		return Dao.priceAsc();
	}

	@Override
	public List<Shop> discountDescend() {
		// TODO Auto-generated method stub
		return Dao.discountDescend();
	}

	@Override
	public List<Shop> discountAsc() {
		// TODO Auto-generated method stub
		return Dao.discountAsc();
	}

	@Override
	public Shop findShopById(Integer id) {
		// TODO Auto-generated method stub
		return Dao.findShopById(id);
	}

	@Override
	public List<Shop> findById(Integer id) {
		// TODO Auto-generated method stub
		return Dao.findById(id);
	}

	@Override
	public void addOrder(Orders order) {
		// TODO Auto-generated method stub
		Dao.addOrder(order);
		for(int i=0;i<order.getOrderItems().size();i++) {
			Dao.addOrderItem(order.getOrderItems().get(i));
			
		}
	}
	public void addOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Shop> findDrugType1() {
		// TODO Auto-generated method stub
		return Dao.findDrugType1();
	}

	@Override
	public List<Shop> findDrugType2() {
		// TODO Auto-generated method stub
		return Dao.findDrugType2();
	}

	@Override
	public List<Shop> findDrugType3() {
		// TODO Auto-generated method stub
		return Dao.findDrugType3();
	}

	@Override
	public List<Shop> findDrugType4() {
		// TODO Auto-generated method stub
		return Dao.findDrugType4();
	}

	@Override
	public List<Shop> findDrugType5() {
		// TODO Auto-generated method stub
		return Dao.findDrugType5();
	}

	@Override
	public List<Shop> findDrugType6() {
		// TODO Auto-generated method stub
		return Dao.findDrugType6();
	}

	@Override
	public List<Shop> findDrugType7() {
		// TODO Auto-generated method stub
		return Dao.findDrugType7();
	}

	@Override
	public List<Shop> findDrugType8() {
		// TODO Auto-generated method stub
		return Dao.findDrugType8();
	}

	@Override
	public List<Shop> findDrugType9() {
		// TODO Auto-generated method stub
		return Dao.findDrugType9();
	}

}
