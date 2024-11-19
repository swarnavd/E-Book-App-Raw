package com.dao;

import java.util.List;

import com.entity.CartAdd;
import com.entity.User;

public interface Cartdao {
	public boolean addCart(CartAdd c);
	
	public List<CartAdd> viewMyCart(String ob);
}
