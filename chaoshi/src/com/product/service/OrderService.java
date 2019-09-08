package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.bean.Product;
import com.product.dao.OrderDao;

@Service
public class OrderService {
@Autowired
private OrderDao od;
public List<Product> selectproduct(){
	return od.selectproduct();
}
}
