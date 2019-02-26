package com.etc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etc.dao.UserMapper;
import com.etc.entity.User;

@Service
public class UserManageService {
	
	@Resource
	private UserMapper userMapper;
	
	public boolean doAdd(User user) {
		int row = userMapper.insertSelective(user);
		return row>0;
	}
	
	public boolean doModify(User user) {
		int row = userMapper.updateByPrimaryKey(user);
		return row >0;
	}
	
	public boolean doRemove(int uid) {
		int row = userMapper.deleteByPrimaryKey(uid);
		return row > 0;
	}
	
	public User findByUid(int uid) {
		User user = userMapper.selectByPrimaryKey(uid);
	    return user;
	}
	
	public List<User> findAll(){
		List<User> user = userMapper.selectByExample(null);
		return user;
	}

}
