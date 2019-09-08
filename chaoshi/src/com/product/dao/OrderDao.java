package com.product.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.product.bean.Product;

/*@Repository*/
public interface OrderDao {
public List<Product> selectproduct();
}
