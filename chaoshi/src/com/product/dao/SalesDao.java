package com.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import com.product.bean.Record;
import com.product.bean.Sales;

/*@Repository*/
public interface SalesDao {
public List<Sales> showsales(int yuefen);
public List<Sales> selsalesall();
public void into_goods(@Param("pid")int pid,@Param("num")int num);
public void record_goods(@Param("pid")int pid,@Param("num")int num,@Param("caozuo")String info);
public int count_record();
public List<Record> pageselallrecord(@Param("offset")int offset,@Param("limit")int limit);
public int check(int pid);
}
