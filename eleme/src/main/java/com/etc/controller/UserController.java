package com.etc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.persistence.Index;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etc.dao.AddressMapper;
import com.etc.dao.ShoptypeMapper;
import com.etc.dao.UserMapper;
import com.etc.entity.Address;
import com.etc.entity.AddressExample;
import com.etc.entity.Shoptype;
import com.etc.entity.User;
import com.etc.entity.UserExample;
import com.etc.service.UserService;
import com.etc.service.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserMapper userMapper;
	
	@Resource
	private AddressMapper addressMapper;
	
	@Resource
	private ShoptypeMapper shoptypeMapper;
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		return "redirect:/";
	}
	
	@RequestMapping("/userinfo")
	public String info(HttpServletRequest request){
		return "userinfo";
	}
	@RequestMapping("/userdetail")
	public String userdetail(HttpServletRequest request){
		return "userdetail";
	}
	@RequestMapping("/userorders")
	public String userorders(HttpServletRequest request){
		return "userorders";
	}
	@RequestMapping("/address")
	public String address(HttpServletRequest request){
		User user=(User)request.getSession().getAttribute("user");
		if (user==null) {
			return "redirect:/";
		} else {
		
		AddressExample ae=new AddressExample();
		ae.createCriteria().andUidEqualTo(user.getUid());
		System.out.println(user.getUid());
		List<Address> adlist = addressMapper.selectByExample(ae);
		if(adlist.size() == 0){
			request.setAttribute("adlist", null);
		}
		else{
			System.out.println(adlist.size());
			request.setAttribute("adlist", adlist);
			System.out.println(adlist.get(0).getLinkman()+adlist.get(0).getUaddress());
		}
		return "address";
		}
	}
	@RequestMapping("/main")
	public String main(HttpServletRequest request){
		List<Shoptype> stList=shoptypeMapper.selectByExample(null);
		request.setAttribute("shoptypelist", stList);
		return "shoplist";
	}
	
	@RequestMapping("/login")
	public String login(String uname,String password,HttpServletRequest request){
		if(uname == null || password == null){
			System.out.println("这是登录功能");
			return "userlogin";
		}
		else{
			UserExample ue = new UserExample();
			ue.createCriteria().andUnameEqualTo(uname).andPasswordEqualTo(password);
			List<User> users = userMapper.selectByExample(ue);
			if(users.size()!=1){
				request.setAttribute("loginmsg", "用户名或密码错误！");
				System.out.println("登录失败！返回登录页！");
				return "userlogin";
			}else{
				request.getSession().setAttribute("user", users.get(0));
				System.out.println("登陆成功！转向主页！");
				return "redirect:/";
			}
		}
	}
	
	@RequestMapping("/register")
	public String register(String uname,String password,HttpServletRequest request){
		if(uname == null || password == null){
			return "userRegister";
		}
		else{
			if(userService.userNameExist(uname)){
				System.out.println("名字已存在");
				request.setAttribute("registermsg", "用户名已存在！");
				return "userRegister";
			}
			else{
				if(userService.userRegister(uname, password)){
					login(uname, password, request);
					System.out.println("注册成功！");
				}
				else{
					System.out.println("注册失败");
				}
			}
			
			return "redirect:/";
		}
	}
	
	@RequestMapping("/cherkname")
	@ResponseBody
	public Boolean cherkName(String uname){
		System.out.println("检查是否重名！");
		boolean isExist = userService.userNameExist(uname);
		return isExist;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		request.setAttribute("msg", "您已安全退出系统");
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/changepwd")
	public String changepwd(String password,HttpServletRequest request){
		
		if(password == null){
			return "changepwd";
		}
		else{
			User user = (User)request.getSession().getAttribute("user");
			user.setPassword(password);
			userMapper.updateByPrimaryKey(user);
			return "userdetail";
		}
	}
}
