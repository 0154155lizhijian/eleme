package com.etc.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.etc.dao.GoodsMapper;
import com.etc.dao.GoodstypeMapper;
import com.etc.dao.OrdersMapper;
import com.etc.dao.ShopMapper;
import com.etc.dao.ShoptypeMapper;
import com.etc.dao.ShopuserMapper;
import com.etc.entity.Goods;
import com.etc.entity.GoodsExample;
import com.etc.entity.Goodstype;
import com.etc.entity.GoodstypeExample;
import com.etc.entity.OrdersExample;
import com.etc.entity.Shop;
import com.etc.entity.Shoptype;
import com.etc.entity.Shopuser;
import com.etc.entity.ShopuserExample;

@Controller
@RequestMapping("/shopuser")
public class ShopuserController {
	
	@Resource
	private ShopuserMapper shopuserMapper;
	
	@Resource
	private ShopMapper shopMapper;
	
	@Resource
	private GoodsMapper goodsMapper;
	
	@Resource
	private GoodstypeMapper goodstypeMapper;
	
	@Resource
	private OrdersMapper ordersmapper;
	
	@Resource
	private ShoptypeMapper shoptypeMapper;
	
	@RequestMapping("/login")
	public String login(String suname,String password,HttpServletRequest request){
		if(suname == null || password == null){
			request.getSession().removeAttribute("suloginmsg");
			System.out.println("这是商家用户登录功能");
			return "../../slogin";
		}
		else{
			ShopuserExample sue = new ShopuserExample();
			sue.createCriteria().andSunameEqualTo(suname).andPasswordEqualTo(password);
			List<Shopuser> shopuser = shopuserMapper.selectByExample(sue);
			if(shopuser.size()!=1){
				request.setAttribute("suloginmsg", "用户名或密码错误！");
				System.out.println("登录失败！返回登录页！");
				return "../../slogin";
			}else{
				request.getSession().setAttribute("shopuser", shopuser.get(0));
				System.out.println("登陆成功！转向主页！");
				return "redirect:info.html";
			}
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		request.getSession().setAttribute("suloginmsg", "您已安全退出系统");
		return "redirect:login.html";
	}
	
	@RequestMapping("/info")
	public String info(HttpServletRequest request){
		Shopuser shopuser = (Shopuser)request.getSession().getAttribute("shopuser");
		Shop shop = shopMapper.selectByPrimaryKey(shopuser.getSid());
		
		OrdersExample oe = new OrdersExample();
		oe.createCriteria().andSidEqualTo(shopuser.getSid());
		int orderscount = ordersmapper.countByExample(oe);
		
		Shoptype shoptype = shoptypeMapper.selectByPrimaryKey(shop.getStype());
		
		request.setAttribute("sushoptype",shoptype);
		request.setAttribute("suorderscount",orderscount);
		
		request.setAttribute("sushop", shop);
		return "shopuserinfo";
	}
	
	@RequestMapping("/goods")
	public String goodsManager(HttpServletRequest request) {
		Shopuser shopuser = (Shopuser)request.getSession().getAttribute("shopuser");
		
		GoodstypeExample gte = new GoodstypeExample();
		gte.createCriteria().andSidEqualTo(shopuser.getSid());
		List<Goodstype> goodstypesList = goodstypeMapper.selectByExample(gte);
		
		List<Goods> goodsList = new ArrayList<>();
		
		for (Goodstype goodstype : goodstypesList) {
			GoodsExample ge = new GoodsExample();
			ge.createCriteria().andGtidEqualTo(goodstype.getGtid());
			goodsList.addAll(goodsMapper.selectByExample(ge));
		}
		
		request.setAttribute("sugoodstypesList", goodstypesList);
		request.setAttribute("sugoodsList",goodsList);
		return "shopusergoods";
	}
	
	@RequestMapping("/addgoods")
	public String addgoods(Goods goods) {
		System.out.println("添加商品");
		goodsMapper.insert(goods);
		System.out.println("添加商品");
		return "redirect:goods.html";
	}
	
	@RequestMapping("/updategoods")
	public String updategoods(Goods goods) {
		goodsMapper.updateByPrimaryKeySelective(goods);
		return "redirect:goods.html";
	}
	
	@RequestMapping("/removegoods")
	public String removegoods(int gid) {
		goodsMapper.deleteByPrimaryKey(gid);
		return "redirect:goods.html";
	}
	
	@RequestMapping("/goodstype")
	public String goodstypeManager(HttpServletRequest request){
		Shopuser shopuser = (Shopuser)request.getSession().getAttribute("shopuser");
		GoodstypeExample gte = new GoodstypeExample();
		gte.createCriteria().andSidEqualTo(shopuser.getSid());
		List<Goodstype> goodstypeList = goodstypeMapper.selectByExample(gte);
		
		request.setAttribute("sugoodstypeList", goodstypeList);
		return "shopusergoodstype";
	}
	
	@RequestMapping("/addgoodstype")
	public String addgoodstype(Goodstype goodstype,HttpServletRequest request) {
		Shopuser shopuser = (Shopuser)request.getSession().getAttribute("shopuser");
		System.out.println("添加商品类型时的sid:"+shopuser.getSid());
		goodstype.setSid(shopuser.getSid());
		goodstypeMapper.insert(goodstype);
		return "redirect:goodstype.html";
	}
	@RequestMapping("/updategoodstype")
	public String updategoodstype(Goodstype goodstype) {
		goodstypeMapper.updateByPrimaryKeySelective(goodstype);
		return "redirect:goodstype.html";
	}
	@RequestMapping("/removegoodstype")
	public String removegoodstype(int gtid) {
		GoodsExample ge = new GoodsExample();
		ge.createCriteria().andGtidEqualTo(gtid);
		goodsMapper.deleteByExample(ge);
		
		goodstypeMapper.deleteByPrimaryKey(gtid);
		return "redirect:goodstype.html";
	}
	
	@RequestMapping("/changestatus")
	public String changestatus(HttpServletRequest request) {
		Shopuser shopuser = (Shopuser)request.getSession().getAttribute("shopuser");
		Shop shop = shopMapper.selectByPrimaryKey(shopuser.getSid());
		if(shop.getSstatus().equals("营业中")) {
			shop.setSstatus("休息中");
		}
		else {
			shop.setSstatus("营业中");
		}
		shopMapper.updateByPrimaryKey(shop);
		return "redirect:info.html";
	}
	
}
