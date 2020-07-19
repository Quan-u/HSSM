package com.quanyou.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.quanyou.po.Admin;
import com.quanyou.po.AdminImg;
import com.quanyou.po.Orders;
import com.quanyou.po.Shop;
import com.quanyou.po.User;

public interface AdminService {
	//admin登录
	public Admin findAdmin(@Param("ad_username") String ad_username,
            @Param("ad_password") String ad_password);
	//根据admin查询个人资料
		public List<Admin> selectAdminList(@Param("ad_username") String ad_username);
		//admin个人资料-先根据id查询
		public Admin ByAdminId(String ad_id);
		//修改admin
		public int updateAdmin(Admin admin); 
		//admin查询用户列表
		public List<User> selectUserInfoList(); 
		//用户管理列表添加用户
		public int createUser(User user);
		//admin页面删除用户
		public int deleteUser(String id);
		//管理用户列表模糊查询
		public List<User> mohuchaxun(@Param("username") String username,
				                     @Param("phone") String phone);
		//admin页面查询所有订单
		public List<Orders> AdminOrdersList();
		//admin页面根据订单号查询
		public List<Orders> AdminOrderById(@Param("id") String id);
		//admin页面修改订单功能(1.根据id查询,2.修改)
		public Orders updateUserAdressById (String id);
		//修改用户订单信息
		public int updateUserAdress(Orders order);
		//删除订单
		public int deleteAdminOrder(String  id);
		//admin页面商品列表
		public List<Shop> AdminShopList();
		//admin页面商品列表根据id和商品名模糊查询
		public List<Shop> mohuchaxunShop(@Param("id") String id,
				                         @Param("name") String name,
				                         @Param("drugType") String drugType);
		//admin页面新建商品信息
		public int createShop(Shop shop);
		//admin页面商品列表修改商品(1.根据id查询，2.更新操作)
		public Shop getShopById(String id);
		public int updateShop(Shop shop);
		//admin商品列表 删除商品
		public int deleteShop(Integer id);
		//
		public User findSex(String sex);
		//商品库存
		public List<Map<String,Object>> findCommodityStocks(String drugType);
		//商品折扣
		public List<Map<String,Object>> findCommodityPrice(String drugType);
		//本周热买
		public List<Shop> HotBuyThisWeek();
		//修改主页图片 先遍历全部
	    public List<AdminImg> adminImgList();
	    //修改主页图片
	    public int updateAdminImg(AdminImg adminImg);
	
}
