package com.etc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etc.dao.AddressMapper;
import com.etc.dao.CommentMapper;
import com.etc.dao.OrdersMapper;
import com.etc.dao.OrdersdetailMapper;
import com.etc.entity.Address;
import com.etc.entity.AddressExample;
import com.etc.entity.Comment;
import com.etc.entity.CommentExample;
import com.etc.entity.Goods;
import com.etc.entity.Orders;
import com.etc.entity.OrdersExample;
import com.etc.entity.Ordersdetail;
import com.etc.entity.OrdersdetailExample;
import com.etc.entity.Shop;
import com.etc.entity.User;
import com.etc.service.GoodsService;
import com.etc.service.UserManageService;

@Controller
public class UserManageController {
	
	@Resource
	private UserManageService userManageService;
	@Resource
	private AddressMapper addressMapper;
	@Resource
	private CommentMapper commentMapper;
	@Resource
	private OrdersdetailMapper ordersdetailMapper ;
	@Resource
	private OrdersMapper ordersMapper;
    
	
	@RequestMapping("/user_list")
	public String user_list(HttpServletRequest request) {
		List<User> userlist= userManageService.findAll();
		request.getSession().setAttribute("userlist",userlist);
		return "user_list";
	}
	
	
	
	@RequestMapping("/modifyuser")
	public String modifyuser(User user) {
		userManageService.doModify(user);
		return "redirect:/user_list.html";
	}
	
	@RequestMapping("/removeuser")
	public String removeGoods(int uid) {
		
		
		userManageService.doRemove(uid);//删除用户
		
		User user = new User();
		Address address = new Address();
		AddressExample ad = new AddressExample();
		ad.createCriteria().andUidEqualTo(user.getUid());
		addressMapper.deleteByExample(ad);//删除地址
		
		
		Comment comment = new Comment();
		CommentExample cExample = new CommentExample();
		cExample.createCriteria().andUidEqualTo(user.getUid());
		commentMapper.deleteByExample(cExample);//删除评论
		
		Orders orders = new Orders();
		OrdersExample o = new OrdersExample();
		o.createCriteria().andAidEqualTo(address.getAid());
		ordersMapper.deleteByExample(o);//删除订单
	
		Ordersdetail ordersdetail = new Ordersdetail();
		OrdersdetailExample od = new OrdersdetailExample();
		od.createCriteria().andOidEqualTo(orders.getOid());
		ordersdetailMapper.deleteByExample(od);//删除订单详情
		
		
			
		return "redirect:/user_list.html";
	}
	
	
	
	
}
