	package com.product.handler;

import java.util.List;
import java.util.Map;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.product.bean.Emp;
import com.product.service.EmpService;

@Controller
public class EmpHandler {
@Autowired
private EmpService es;

@RequestMapping(value="/showEmp")
public String selectAllEmp(Map<String, Object> map) {
	List<Emp> elist = es.selectAllEmp();
	map.put("elist", elist);
	return "showEmp";
}
@RequestMapping(value="/delEmp/{empid}")
@ResponseBody
public String delEmp(@PathVariable("empid")int eid)
{
es.delemp(eid);
return "success";
}
@RequestMapping(value="/addEmp",method=RequestMethod.POST)
public String addEmp(Emp e) {
	es.insertemp(e);
	return "forward:/showEmp";
}
@RequestMapping(value="/getEmpbyname")
public String getEmpbyname(@RequestParam("ename")String info,Map<String, Object> map){
	List<Emp> elist = es.getempbyname(info);
	map.put("elist", elist);
	return "showEmp";
}
@RequestMapping(value="/selectOneEmp/{eid}")
public String selectOneProduct(@PathVariable("eid")int eid,Model m) {
	Emp e = es.selectOneEmp(eid);
	m.addAttribute("e",e);
	return "editEmp";
}
@RequestMapping(value="/updateEmp",method=RequestMethod.POST)
public String updateEmp(Emp e) {
	es.upemp(e);
	return "forward:showEmp";
}

}
