package com.etc.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etc.dao.AddressMapper;
import com.etc.dao.CommentMapper;
import com.etc.dao.GoodsMapper;
import com.etc.dao.OrdersMapper;
import com.etc.dao.OrdersdetailMapper;
import com.etc.dao.ShopMapper;
import com.etc.entity.Address;
import com.etc.entity.AddressExample;
import com.etc.entity.Comment;
import com.etc.entity.CommentExample;
import com.etc.entity.Goods;
import com.etc.entity.GoodsExample;
import com.etc.entity.Orders;
import com.etc.entity.OrdersExample;
import com.etc.entity.Ordersdetail;
import com.etc.entity.OrdersdetailExample;
import com.etc.entity.Shop;
import com.etc.entity.ShopExample;
import com.etc.entity.User;

@Controller
@RequestMapping("/orders")
public class OrdersController {
	
	@Resource
	private ShopMapper shopMapper;
	
	@Resource
	private GoodsMapper goodsMapper;
	
	@Resource
	private AddressMapper addressMapper;
	
	@Resource
	private OrdersMapper ordersMapper;
	
	@Resource
	private OrdersdetailMapper ordersdetailMapper;
	
	@Resource
	private CommentMapper commentMapper;
	
	@RequestMapping("/cherkout")
	public String add(String ids,String sid, String quantitys,HttpServletRequest request){
		System.out.println("商品ids:"+ids);
		System.out.println("商店id:"+sid);
		System.out.println("商品数量:"+quantitys);
		String[] idList = ids.replace(" ", "").split(",");
		String[] quantityList= quantitys.replace(" ", "").split(",");
		List<Ordersdetail> ordersdetailList = new ArrayList<>();
		
		List<Goods> goodsList = new ArrayList<>();
		
		for(int i=0;i<idList.length;i++){
			//把商品id 和 数量 暂存入ordersdetail ~
			Ordersdetail od = new Ordersdetail();
			od.setGid(Integer.valueOf(idList[i]));
			od.setGcount(Integer.valueOf(quantityList[i]));
			ordersdetailList.add(od);
			// 查询购买的商品的信息
			
			Goods goods = goodsMapper.selectByPrimaryKey(Integer.valueOf(idList[i]));
			for (Goods item : goodsList) {
				if(item.getGid()==goods.getGid()){
					goods = null;
				}
			}
			goodsList.add(goods);		
		}
		
		ShopExample se = new ShopExample();
		se.createCriteria().andSidEqualTo(Integer.valueOf(sid));
		Shop shop = shopMapper.selectByExample(se).get(0);
		System.out.println("商品类型数量:"+ordersdetailList.size());
		
		User user = (User)request.getSession().getAttribute("user");
		AddressExample ae = new AddressExample();
		ae.createCriteria().andUidEqualTo(user.getUid());
		List<Address> addressList = addressMapper.selectByExample(ae);
		
		request.getSession().setAttribute("cherkoutaddressList", addressList);
		request.getSession().setAttribute("cherkoutgoodsList", goodsList);
		request.getSession().setAttribute("cherkoutshop", shop);
		request.getSession().setAttribute("cherkoutordersdetailList", ordersdetailList);
		return "cherkout";
	}
	
	@RequestMapping("/add")
	public String add(int aid,BigDecimal ototal,HttpServletRequest request){
		
		Shop shop = (Shop)request.getSession().getAttribute("cherkoutshop");
		Date date = new Date();
		System.out.println(date.toString());
		
		Orders orders = new Orders();
		orders.setAid(aid);
		orders.setSid(shop.getSid());
		orders.setOtime(date);
		orders.setOstatus("准备中");
		orders.setOtotal(ototal);
		ordersMapper.insert(orders);
		
		OrdersExample oe = new OrdersExample();
		
		oe.createCriteria().andAidEqualTo(aid).andSidEqualTo(shop.getSid()).andOtimeEqualTo(date);
		
		orders = ordersMapper.selectByExample(oe).get(0);
		
		System.out.println(orders.getOid());
		
		@SuppressWarnings("unchecked")
		List<Ordersdetail> ordersdetailList = (List<Ordersdetail>) request.getSession().getAttribute("cherkoutordersdetailList");
		
		for (Ordersdetail ordersdetail : ordersdetailList) {
			ordersdetail.setOid(orders.getOid());
			ordersdetailMapper.insert(ordersdetail);
		}
		
		
		return "redirect:/";
	}
	
	@RequestMapping("/showcherkout")
	public String show(){
		return "cherkout";
	}
	
	@RequestMapping("/showorders")
	public String showorders(HttpServletRequest request){
		User user=(User)request.getSession().getAttribute("user");
		if (user==null) {
			return "redirect:/";
		} else {
			AddressExample ae = new AddressExample();
			ae.createCriteria().andUidEqualTo(user.getUid());
			
			System.out.println("userid:"+user.getUid());
			
			List<Goods> goodsList =goodsMapper.selectByExample(null);
			List<Address> addressList = addressMapper.selectByExample(ae);
			
			System.out.println("用户地址长度:"+addressList.size());
			
			List<Orders> ordersList = new ArrayList<>();
			for (Address address : addressList) {
				OrdersExample oe = new OrdersExample();
				oe.createCriteria().andAidEqualTo(address.getAid());
				ordersList.addAll(ordersMapper.selectByExample(oe));
				System.out.println("地址"+address.getAid()+"对应订单个数："+ordersMapper.selectByExample(oe).size());
			}
			List<Ordersdetail> ordersdetailList = new ArrayList<>();
		/*	OrdersdetailExample ode = new OrdersdetailExample();
			ode.createCriteria().andOdidIsNotNull();
			ordersdetailList=ordersdetailMapper.selectByExample(ode);*/
			for (Orders orders : ordersList) {
				OrdersdetailExample ode = new OrdersdetailExample();
				ode.createCriteria().andOidGreaterThan(orders.getOid());
				
				ordersdetailList.addAll(ordersdetailMapper.selectByExample(ode));
				System.out.println("订单"+orders.getOid()+"对应订单详情个数："+ordersdetailMapper.selectByExample(ode).size());
			}
			
			CommentExample ce = new CommentExample();
			ce.createCriteria().andUidEqualTo(user.getUid());
			List<Comment>commentList = commentMapper.selectByExample(ce);
			
			request.setAttribute("goodsList", goodsList);
			request.setAttribute("showaddressList", addressList);
			request.setAttribute("showordersList", ordersList);
			request.setAttribute("showordersdetailList", ordersdetailList);
			request.setAttribute("showorderscommentList", commentList);
			System.out.println(ordersList.size());
			System.out.println(ordersdetailList.size());
			
			return "userorders";
		}	
	}
	@RequestMapping("remove")
	public String remove(int oid){
		OrdersdetailExample ode = new OrdersdetailExample();
		CommentExample ce = new CommentExample();
		ce.createCriteria().andOidEqualTo(oid);
		commentMapper.deleteByExample(ce);
		ode.createCriteria().andOidEqualTo(oid);
		ordersdetailMapper.deleteByExample(ode);
		ordersMapper.deleteByPrimaryKey(oid);
		return "userorders";
	}
	
	@RequestMapping("comment")
	public String comment(int oid,HttpServletRequest request){
		request.setAttribute("commentoid", oid);
		return "addComment";
	}
	
	@RequestMapping("showordersdetail")
	public String showordersdetail(int oid,HttpServletRequest request){
		OrdersdetailExample ode = new OrdersdetailExample();
		ode.createCriteria().andOidEqualTo(oid);
		List<Ordersdetail> ordersdetailList = ordersdetailMapper.selectByExample(ode);
		
		Orders orders = ordersMapper.selectByPrimaryKey(oid);
		Shop shop = shopMapper.selectByPrimaryKey(orders.getSid());
		
		List<Goods> goodsList = new ArrayList<>();
		for (Ordersdetail ordersdetail : ordersdetailList) {
			GoodsExample ge = new GoodsExample();
			ge.createCriteria().andGidEqualTo(ordersdetail.getGid());
			goodsList.addAll(goodsMapper.selectByExample(ge));
		}
		
		request.setAttribute("odordersdetailList", ordersdetailList);
		request.setAttribute("odgoodsList", goodsList);
		request.setAttribute("odshop", shop);
		return "ordersdetail";
	}
	
}
