package com.etc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etc.dao.GoodsMapper;
import com.etc.entity.Goods;
import com.etc.entity.GoodsExample;

@Service
public class GoodsService {
	
	@Resource
	private GoodsMapper goodsMapper;
	
	public List<Goods> findByname(String gname){
		GoodsExample ge=new GoodsExample();
		gname="%"+gname+"%";
		ge.createCriteria().andGnameLike(gname);
		List<Goods> goodslist = goodsMapper.selectByExample(ge);
		System.out.println("service.findByname:"+goodslist.size()+gname);
		return goodslist;
	}

}
