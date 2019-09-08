package com.product.utils;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyTag extends TagSupport{
@Override
public int doStartTag() throws JspException {
	// TODO Auto-generated method stub
	JspWriter out=super.pageContext.getOut();
	try {
		out.print("<span>这是自定义输出标签的内容<span>");
		out.print("<h1>这是自定义输出的大标题<h1>");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return super.doStartTag();
}
}
