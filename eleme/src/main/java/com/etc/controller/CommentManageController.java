package com.etc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etc.entity.Comment;
import com.etc.entity.Goods;
import com.etc.service.CommentManageService;
import com.etc.service.GoodsService;

@Controller
public class CommentManageController {
	
	@Resource
	private CommentManageService commentManageService;
    
	
	@RequestMapping("/commentmanage")
	public String showcommentmanage(HttpServletRequest request) {
		List<Comment> commentlist= commentManageService.findAll();
		request.getSession().setAttribute("commentlist", commentlist);
		return "commentmanage";
	}
	
	
	@RequestMapping("/removemanage")
	public String removeGoods(int cid) {
		commentManageService.doRemove(cid);
		return "redirect:/commentmanage.html";
	}
	
	
	
	
}
