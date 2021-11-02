package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.User;
import com.ssafy.happyhouse.model.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
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
	public List<User> selectName(String name) throws SQLException {
		return null;
	}

	@Override
	public List<User> selectEmail(String email) throws SQLException {
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

}
