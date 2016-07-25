package com.jxapq.vo;

import com.jxapq.annotation.AnnoTableName;
import com.jxapq.annotation.FieldAnnotation;


@AnnoTableName(tableName="t_order",length=8)
public class Order {
	@FieldAnnotation(fname="order_id",cname="*目id")
	private String order_id;
	@FieldAnnotation(fname="order_sname",cname="*学名")
	private String order_sname;
	@FieldAnnotation(fname="order_cname",cname="*中文名")
	private String order_cname;
	@FieldAnnotation(fname="order_ename",cname="*英文名")
	private String order_ename;
	@FieldAnnotation(fname="order_spelling",cname="*中文拼音")
	private String order_spelling;
	@FieldAnnotation(fname="order_summarize",cname="*概述")
	private String order_summarize;
	@FieldAnnotation(fname="order_level",cname="*分类等级")
	private String order_level;
	@FieldAnnotation(fname="class_id_fk",cname="*刚外键")
	private String class_id_fk;
	
	public Order() {

	}

	public Order(String order_sname, String order_cname, String order_ename,
			String order_spelling, String order_summarize, String class_id_fk) {
		super();
		this.order_sname = order_sname;
		this.order_cname = order_cname;
		this.order_ename = order_ename;
		this.order_spelling = order_spelling;
		this.order_summarize = order_summarize;
		this.class_id_fk = class_id_fk;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getOrder_sname() {
		return order_sname;
	}

	public void setOrder_sname(String order_sname) {
		this.order_sname = order_sname;
	}

	public String getOrder_cname() {
		return order_cname;
	}

	public void setOrder_cname(String order_cname) {
		this.order_cname = order_cname;
	}

	public String getOrder_ename() {
		return order_ename;
	}

	public void setOrder_ename(String order_ename) {
		this.order_ename = order_ename;
	}

	public String getOrder_spelling() {
		return order_spelling;
	}

	public void setOrder_spelling(String order_spelling) {
		this.order_spelling = order_spelling;
	}

	public String getOrder_summarize() {
		return order_summarize;
	}

	public void setOrder_summarize(String order_summarize) {
		this.order_summarize = order_summarize;
	}


	public String getOrder_level() {
		return order_level;
	}

	public void setOrder_level(String order_level) {
		this.order_level = order_level;
	}

	public String getClass_id_fk() {
		return class_id_fk;
	}

	public void setClass_id_fk(String class_id_fk) {
		this.class_id_fk = class_id_fk;
	}
	
	
}
