package com.etc.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etc.dao.AddressMapper;
import com.etc.entity.Address;

@Controller()
@RequestMapping("/address")
public class AdderssController {
	
	
	@Resource
	private AddressMapper addressMapper;
	
	@RequestMapping("/add")
	public String add(Address address ,HttpServletRequest request){
		if(address.getLinkman() != null){
			addressMapper.insert(address);
			return "redirect:/user/address.html";
		}
		return "addAddress";
	}
	
	@RequestMapping("/remove")
	public String remove(int aid){
		System.out.println(aid);
		addressMapper.deleteByPrimaryKey(aid);
		return "redirect:/user/address.html";
	}
}
