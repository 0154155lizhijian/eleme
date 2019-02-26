package com.etc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etc.dao.GoodstypeMapper;
import com.etc.dao.ShopMapper;
import com.etc.entity.Goods;
import com.etc.entity.Goodstype;
import com.etc.entity.Shop;
import com.etc.entity.ShopExample;
import com.etc.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Resource
	private GoodsService GoodsService;
	@Resource 
	private ShopMapper shopMapper;
	@Resource 
	private GoodstypeMapper goodstypeMapper;
	
	@RequestMapping("/searchgoods")
	public String searchGoods(String gname,HttpServletRequest request ){
		
		if (gname == null || gname.trim() =="") {
			return "shoplist";
		} else {
			List <Goods> goodsList=GoodsService.findByname(gname);
			List<Goodstype> goodsTypeList = goodstypeMapper.selectByExample(null);
			ArrayList<Integer> sid=new ArrayList<Integer>();
			ArrayList<Shop> searchShopList=new ArrayList<Shop>();
			for (Goods goods : goodsList) {
				for (Goodstype goodstype : goodsTypeList) {
					if(goods.getGtid()==goodstype.getGtid()){
						if(sid.contains(goodstype.getSid())){
						}else{
							sid.add(goodstype.getSid());
						}
					}
				}
				
			}
			for (int n : sid) {
				searchShopList.add(shopMapper.selectByPrimaryKey(n));
			}
			request.setAttribute("goodsList",goodsList);
			request.setAttribute("goodsTypeList",goodsTypeList);
			request.setAttribute("searchShopList",searchShopList);
			
			//List<Goods> goodsList = new ArrayList<>();
			
			goodstypeMapper.selectByExample(null);
			return "searchgoods";

		}
		
	}
	
	
	
}
