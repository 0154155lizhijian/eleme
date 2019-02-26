package com.etc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etc.dao.UserMapper;
import com.etc.entity.User;
import com.etc.entity.UserExample;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private UserMapper userMapper;
	
	@Override
	public boolean userRegister(String uname, String password) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUname(uname);
		user.setPassword(password);
		int num = userMapper.insert(user);
		if(num == 1){
			return true;
		}
		return false;
	}

	@Override
	public boolean userNameExist(String uname) {
		// TODO Auto-generated method stub
		UserExample ue = new UserExample();
		ue.createCriteria().andUnameEqualTo(uname);
		List<User> userList = userMapper.selectByExample(ue);
		if(userList.size() > 0){
			return true;
		}
		return false;
	}
	
}
