package com.product.bean;

public class Sales {
private int sales_id;
private int emp_id;
private int product_id;
private int total;
private int yuefen;
private Emp emp;
private Product product;
public int getSales_id() {
	return sales_id;
}
public void setSales_id(int sales_id) {
	this.sales_id = sales_id;
}
public int getEmp_id() {
	return emp_id;
}
public void setEmp_id(int emp_id) {
	this.emp_id = emp_id;
}
public int getProduct_id() {
	return product_id;
}
public void setProduct_id(int product_id) {
	this.product_id = product_id;
}

public int getTotal() {
	return total;
}
public void setTotal(int total) {
	this.total = total;
}
public int getYuefen() {
	return yuefen;
}
public void setYuefen(int yuefen) {
	this.yuefen = yuefen;
}
public Emp getEmp() {
	return emp;
}
public void setEmp(Emp emp) {
	this.emp = emp;
}
public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
}
