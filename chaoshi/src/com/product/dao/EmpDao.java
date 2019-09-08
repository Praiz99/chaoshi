package com.product.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.product.bean.Emp;

public interface EmpDao {
public void insertemp(Emp e);
public void delemp(int eid);
public List<Emp> getempbyname(String info);
public void upemp(Emp e);
public List<Emp> selectAllEmp();
public Emp selectOneEmp(int eid);
}
