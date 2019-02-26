package com.etc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.etc.dao.ShopMapper;
import com.etc.entity.Shop;

@Service
public class ShopManageService {
	
	@Resource
	private ShopMapper shopMapper;
	
	public boolean doAdd(Shop shop) {
		int row = shopMapper.insertSelective(shop);
		return row>0;
	}
	
	public boolean doModify(Shop shop) {
		int row = shopMapper.updateByPrimaryKeySelective(shop);
		return row >0;
	}
	
	public boolean doRemove(int suid) {
		int row = shopMapper.deleteByPrimaryKey(suid);
		return row > 0;
	}
	
	public Shop findBySuid(int suid) {
		Shop shop = shopMapper.selectByPrimaryKey(suid);
	    return shop;
	}
	
	public List<Shop> findAll(){
		List<Shop> shops = shopMapper.selectByExample(null);
		return shops;
	}

}
