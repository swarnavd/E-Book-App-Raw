package com.dao;

import com.entity.User;

public interface Userdao {
	public boolean userRegistre(User us);
	public User login(String email,String password);
}
