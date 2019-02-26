package com.etc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etc.dao.ShopMapper;
import com.etc.dao.ShopuserMapper;
import com.etc.entity.Shop;
import com.etc.entity.ShopExample;
import com.etc.entity.Shopuser;
import com.etc.service.ShopManageService;

@Controller
public class ShopManageController {
	
	@Resource
	private ShopManageService shopManageService;
    @Resource
    private ShopuserMapper shopuserMapper;
    @Resource
    private ShopMapper shopMapper;
	
	@RequestMapping("/shopuser_list")
	public String shopuser_list(HttpServletRequest request) {
		List<Shop> shoplist= shopManageService.findAll();
		request.getSession().setAttribute("shoplist", shoplist);
		
		List<Shopuser> shopuerlist = shopuserMapper.selectByExample(null);
		request.getSession().setAttribute("shopuserlist", shopuerlist);
	
		return "shopuser_list";
	}
	

	
	@RequestMapping("/modifyshop")
	public String modifyShop(Shop shop) {	
		shopMapper.updateByPrimaryKeySelective(shop);
		return "redirect:shopuser_list.html";
	}
	

	
	
	
}
