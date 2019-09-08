package com.product.service;

import java.util.List;

import org.apache.ibatis.jdbc.RuntimeSqlException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.product.bean.Emp;
import com.product.dao.EmpDao;
@Transactional
@Service
public class EmpService {
@Autowired
private EmpDao ed;
private int i=1;

public void insertemp(Emp e)
{	
	ed.insertemp(e);
	
	
}
public void delemp(int eid){
	ed.delemp(eid);
}
public List<Emp> getempbyname(String info){
	return ed.getempbyname(info);
}
public void upemp(Emp e){
	ed.upemp(e);
}
public List<Emp> selectAllEmp(){
	return ed.selectAllEmp();
}
public Emp selectOneEmp(int eid){
	return ed.selectOneEmp(eid);
}
}
