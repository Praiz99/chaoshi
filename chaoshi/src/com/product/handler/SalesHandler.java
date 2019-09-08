package com.product.handler;

import java.util.List;









import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.product.bean.Record;
import com.product.bean.Sales;
import com.product.service.SalesService;

@Controller
public class SalesHandler {
	
@Autowired
private SalesService ss;

@RequestMapping(value="/showEmpSa")
public String showsales(@RequestParam(value="yuefen",defaultValue="1")int yuefen,Model m,HttpServletRequest request){
	
	HttpSession session=request.getSession();
	session.setAttribute("yuefen", yuefen);
	List<Sales> list=ss.showsales(yuefen);
	m.addAttribute("sslist",list);
	return "showsales";
}
@RequestMapping(value="/goods",method=RequestMethod.POST)
@ResponseBody
public String into_out_goods(@RequestParam("num")int num,@RequestParam("pid")int pid,@RequestParam("caozuo")Boolean caozuo){
	String info = null;
	int i=ss.check(pid);
	if(caozuo){
		info="进货";
		ss.into_goods(pid, num);
		ss.record_goods(pid,num,info);
		return "success";
	}else if(ss.check(pid)>num){
		info="退货";
		ss.into_goods(pid, -num);
		ss.record_goods(pid,num,info);
		return "success";
	}
	return "fail";
}
@RequestMapping(value="/selectallrecord/{pageNo}")
public String selectallrecord(Model m,@PathVariable(value="pageNo")int pageNo){
	int limit=5;
	int offset=(pageNo-1)*limit;
	System.out.println(offset);
	//总页数
	Integer totalItems=ss.count_record();
	System.out.println(totalItems);
	//获取总的信息
	List<Record> list=ss.pageselallrecord(offset, limit);
	int temp=totalItems/limit;
	int totalPages = (totalItems % limit == 0) ? temp : temp+1;
	int curPage = pageNo;
	m.addAttribute("rlist",list);
	m.addAttribute("curPage",curPage);
	m.addAttribute("totalItems",totalItems);
	m.addAttribute("totalPages",totalPages);
	return "selectallrecord";
}
}
