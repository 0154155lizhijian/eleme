package com.etc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.etc.dao.CommentMapper;
import com.etc.dao.UserMapper;
import com.etc.entity.Comment;
import com.etc.entity.User;

@Service
public class CommentManageService {
	
	@Resource
	private CommentMapper commentMapper;
	
	public boolean doAdd(Comment comment) {
		int row = commentMapper.insertSelective(comment);
		return row>0;
	}
	
	public boolean doModify(Comment comment) {
		int row = commentMapper.updateByPrimaryKey(comment);
		return row >0;
	}
	
	public boolean doRemove(int cid) {
		int row = commentMapper.deleteByPrimaryKey(cid);
		return row > 0;
	}
	
	public Comment findByUid(int cid) {
		Comment comment = commentMapper.selectByPrimaryKey(cid);
	    return comment;
	}
	
	public List<Comment> findAll(){
		List<Comment> comments = commentMapper.selectByExample(null);
		return comments;
	}

}
