package com.ssafy.happyhouse.model;

public class User {
	private String id;
	private String name;
	private String pass;
	private String email;
	
	
	public User() {
		
	}
	public User(String id, String name, String pass, String email) {
		super();
		this.id = id;
		this.name = name;
		this.pass = pass;
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=").append(id).append(", name=").append(name).append(", pass=").append(pass)
				.append(", email=").append(email).append("]");
		return builder.toString();
	}
	
	
	
	
}
