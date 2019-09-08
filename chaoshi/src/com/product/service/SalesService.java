package com.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.product.bean.Record;
import com.product.bean.Sales;
import com.product.dao.SalesDao;

@Service
public class SalesService {
@Autowired
 private SalesDao sd;
public List<Sales> showsales(int yuefen){
	return sd.showsales(yuefen);
}
public List<Sales> selsalesall(){
	return sd.selsalesall();
}
public void into_goods(int pid,int num ){
	 sd.into_goods(pid, num);
}
public void record_goods(int pid,int num,String info){
	sd.record_goods(pid,num,info);
}
public List<Record> pageselallrecord(int offset,int limit){
	return sd.pageselallrecord(offset,limit);
}
public int count_record(){
	return sd.count_record();
}
public int check(int pid){
	return sd.check(pid);
}
}
