package com.etc.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etc.dao.CommentMapper;
import com.etc.entity.Comment;

@Controller
@RequestMapping("/comment")
public class CommentController {

	
	@Resource
	private CommentMapper commentMapper;
	
	
	@RequestMapping("/add")
	public String add(Comment comment,HttpServletRequest request){
		if(comment !=null ){
			commentMapper.insert(comment);
		}
		return "redirect:/orders/showorders.html";
	}
}
