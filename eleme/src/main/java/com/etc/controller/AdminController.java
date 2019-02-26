package com.etc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etc.dao.AdminMapper;
import com.etc.dao.ShopuserMapper;
import com.etc.entity.Admin;
import com.etc.entity.AdminExample;
import com.etc.entity.Shop;
import com.etc.entity.Shopuser;
import com.etc.service.ShopManageService;
@Controller
public class AdminController {
	@Resource
	private AdminMapper adminMapper;
	@Resource
	private ShopManageService shopManageService;
	@Resource
	private ShopuserMapper shopuserMapper;
	
	@RequestMapping("/adminlogin")
	public String login(String adname, String password, HttpServletRequest request){
		AdminExample ae = new AdminExample();
		ae.createCriteria().andAdnameEqualTo(adname).andPasswordEqualTo(password);
		List<Admin> admins = adminMapper.selectByExample(ae);
		
		if(admins.size()!=1){
			request.setAttribute("msg", "用户名或密码错误！");
			return "../../adminlogin";
		}else{
			request.getSession().setAttribute("admin", admins.get(0));
			List<Shop> shoplist= shopManageService.findAll();
			request.getSession().setAttribute("shoplist", shoplist);
			
			List<Shopuser> shopuerlist = shopuserMapper.selectByExample(null);
			request.getSession().setAttribute("shopuserlist", shopuerlist);
			return "shopuser_list";
		}
		
	}
	
	@RequestMapping("/adminlogout")
	public String logout(HttpServletRequest request){
		request.setAttribute("msg", "您已安全退出系统");
		request.getSession().invalidate();
		return "../../adminlogin";
	}
}
