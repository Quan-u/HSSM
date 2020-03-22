package com.quanyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.quanyou.dao.UserDao;
import com.quanyou.po.User;
import com.quanyou.service.UserService;
@Service("userService")//对此类取一个别名方便使用时直接注入 让自动扫描变的轻松
@Transactional//事物（安全 回滚）
public class UserServiceImpl implements UserService{
@Autowired
private UserDao Dao;

@Override
public User findUser(String username, String password) {
	// TODO Auto-generated method stub
	return Dao.findUser(username, password);
}

@Override
public int insertUser(User user) {
	// TODO Auto-generated method stub
	return Dao.insertUser(user);
}

@Override
public User ByUserid(String id) {
	// TODO Auto-generated method stub
	return Dao.ByUserid(id);
}

@Override
public List<User> ByUserids(Integer id) {
	// TODO Auto-generated method stub
	return Dao.ByUserids(id);
}

@Override
public int updateUser(User user) {
	// TODO Auto-generated method stub
	return Dao.updateUser(user);
}


}
