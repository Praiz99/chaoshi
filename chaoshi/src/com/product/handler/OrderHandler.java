package com.product.handler;

import java.util.List;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.product.bean.Product;
import com.product.service.OrderService;

@Controller
public class OrderHandler {
@Autowired
private OrderService os;


@RequestMapping(value="/order")
public String Order(Model m){
	List<Product> list=os.selectproduct();
	m.addAttribute("olist", list);
	return "order";
}
}
