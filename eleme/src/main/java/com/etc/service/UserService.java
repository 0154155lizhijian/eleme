package com.etc.service;

public interface UserService {
	boolean userRegister(String uname,String password);
	boolean userNameExist(String uname);
}
