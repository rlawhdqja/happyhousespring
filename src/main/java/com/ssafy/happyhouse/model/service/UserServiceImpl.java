package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.SearchCondition;
import com.ssafy.happyhouse.model.User;
import com.ssafy.happyhouse.model.mapper.UserMapper;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	@Autowired
	ResourceLoader loader;
	
	
	public UserMapper getMapper() {
		return mapper;
	}

	public void setMapper(UserMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public User select(String id) throws SQLException {
		return mapper.select(id);
	}

	@Override
	public int insert(User u) throws SQLException {
		return mapper.insert(u);
	}

	@Override
	public int delete(String id) throws SQLException {
		return mapper.delete(id);
	}

	@Override
	public int update(User u) throws SQLException {
		return mapper.update(u);
	}

	@Override
	public List<User> search(SearchCondition condition) {
		return null;
	}

	@Override
	public Map<String, Object> pagingSearch(SearchCondition condition) {
		return null;
	}

}
