package com.quanyou.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.quanyou.po.User;



public interface UserDao {
//用户登录
public User findUser(@Param("username") String username, @Param("password") String password);
// 用户注册
public int insertUser(User user);
//根据id查询账户(修改账户)
public User ByUserid(String id);
//根据查询User对象
public List<User> ByUserids(Integer id);
//修改账户
public int updateUser(User user); 

}
