package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.SearchCondition;
import com.ssafy.happyhouse.model.User;
import com.ssafy.happyhouse.model.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	@Autowired
	ResourceLoader loader;
	
	@Override
	public User select(String id) throws SQLException {
		return null;
	}

	@Override
	public int insert(User u) throws SQLException {
		return mapper.insert(u);
	}

	@Override
	public List<User> search() throws SQLException {
		return null;
	}



	@Override
	public int delete(String id) throws SQLException {
		return 0;
	}

	@Override
	public int update(User u) throws SQLException {
		return 0;
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
