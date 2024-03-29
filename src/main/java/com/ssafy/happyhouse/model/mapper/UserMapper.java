package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.SearchCondition;
import com.ssafy.happyhouse.model.User;


public interface UserMapper {
	User select(String id) throws SQLException;
	int insert(User u) throws SQLException;
	List<User> search() throws SQLException;
	List<User> selectName(String name) throws SQLException;
	List<User> selectEmail(String email) throws SQLException;
	int delete(String id) throws SQLException;
	int update(User u) throws SQLException;
	int getTotalSearchCount(SearchCondition condition);
}
