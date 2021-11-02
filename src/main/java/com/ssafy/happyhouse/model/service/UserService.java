package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.SearchCondition;
import com.ssafy.happyhouse.model.User;

public interface UserService {
	User select(String id) throws SQLException;
	int insert(User u) throws SQLException;
	//List<User> search() throws SQLException;
	int delete(String id) throws SQLException;
	int update(User u) throws SQLException;
	List<User> search() throws SQLException;
	Map<String, Object> pagingSearch(SearchCondition condition);
}
