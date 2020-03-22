package com.quanyou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.quanyou.po.OrderItem;
import com.quanyou.po.Orders;
import com.quanyou.po.Shop;

public interface ShopDao {
	//商品名查询
public List<Shop> findShopByName(@Param("name") String name);
	//查询全部商品
public List<Shop> findAll();
//根据销量排序（降序）
public List<Shop> salesDescend();
//根据销量排序（升序）
public List<Shop> salesAsc();
//根据新品排序（降序）
public List<Shop> NewProductDescend();
//根据新品排序（升序）
public List<Shop> NewProductAsc();
//根据价格排序（降序）
public List<Shop> priceDescend();
//根据价格排序（升序）
public List<Shop> priceAsc();
//根据折扣排序（降序）
public List<Shop> discountDescend();
//根据折扣排序（升序）
public List<Shop> discountAsc();
//商品详情页面（通过id查询商品）
public List<Shop> findById(@Param("id") Integer id);
//根据id查询（购物车）
public Shop findShopById(@Param("id") Integer id);
//生成订单向数据库2个表插入数据
public void addOrder(Orders order);
public void addOrderItem(OrderItem orderItem);
//shop商品分类
	public List<Shop> findDrugType1();
	public List<Shop> findDrugType2();
	public List<Shop> findDrugType3();
	public List<Shop> findDrugType4();
	public List<Shop> findDrugType5();
	public List<Shop> findDrugType6();
	public List<Shop> findDrugType7();
	public List<Shop> findDrugType8();
	public List<Shop> findDrugType9();


}