package com.jxapq.vo;

import com.jxapq.annotation.AnnoTableName;
import com.jxapq.annotation.FieldAnnotation;


@AnnoTableName(tableName="v_fucus",length=13)
public class Fucus {
	
	
	@FieldAnnotation(fname="fucus_id",cname="*属id")
	private int fucus_id;
	@FieldAnnotation(fname="fucus_cname",cname="*中文名")
	private String fucus_cname;
	@FieldAnnotation(fname="fucus_ename",cname="*英文名")
	private String fucus_ename;
	@FieldAnnotation(fname="fucus_sname",cname="*学名")
	private String fucus_sname;
	@FieldAnnotation(fname="fucus_spelling",cname="*中文拼音")
	private String fucus_spelling;
	@FieldAnnotation(fname="fucus_commoninfo",cname="俗名信息")
	private String fucus_commoninfo;
	@FieldAnnotation(fname="fucus_discover",cname="*命名人")
	private String fucus_discover;
	@FieldAnnotation(fname="fucus_summarize",cname="*概述(形态特征)")
	private String fucus_summarize;
	@FieldAnnotation(fname="fucus_literature",cname="参考文献")
	private String fucus_literature;
	@FieldAnnotation(fname="fucus_level",cname="分类等级")
	private String fucus_level;
	@FieldAnnotation(fname="family_id_fk",cname="科外键")
	private String family_id_fk;
	@FieldAnnotation(fname="subreginal_id_fk",cname="子区系类型（id）")
	private String subreginal_id_fk;
	private String subreginal_name;
	
	public String getSubreginal_name() {
		return subreginal_name;
	}
	public void setSubreginal_name(String subreginal_name) {
		this.subreginal_name = subreginal_name;
	}
	public String getFucus_discover() {
		return fucus_discover;
	}
	public void setFucus_discover(String fucus_discover) {
		this.fucus_discover = fucus_discover;
	}
	public int getFucus_id() {
		return fucus_id;
	}
	public void setFucus_id(int fucus_id) {
		this.fucus_id = fucus_id;
	}
	public String getFucus_cname() {
		return fucus_cname;
	}
	public void setFucus_cname(String fucus_cname) {
		this.fucus_cname = fucus_cname;
	}
	public String getFucus_sname() {
		return fucus_sname;
	}
	public void setFucus_sname(String fucus_sname) {
		this.fucus_sname = fucus_sname;
	}
	public String getFucus_ename() {
		return fucus_ename;
	}
	public void setFucus_ename(String fucus_ename) {
		this.fucus_ename = fucus_ename;
	}
	public String getFucus_spelling() {
		return fucus_spelling;
	}
	public void setFucus_spelling(String fucus_spelling) {
		this.fucus_spelling = fucus_spelling;
	}
	public String getFucus_commoninfo() {
		return fucus_commoninfo;
	}
	public void setFucus_commoninfo(String fucus_commoninfo) {
		this.fucus_commoninfo = fucus_commoninfo;
	}
	
	public String getFucus_summarize() {
		return fucus_summarize;
	}
	public void setFucus_summarize(String fucus_summarize) {
		this.fucus_summarize = fucus_summarize;
	}
	public String getFucus_literature() {
		return fucus_literature;
	}
	public void setFucus_literature(String fucus_literature) {
		this.fucus_literature = fucus_literature;
	}
	

	public String getFucus_level() {
		return fucus_level;
	}
	public void setFucus_level(String fucus_level) {
		this.fucus_level = fucus_level;
	}
	public String getFamily_id_fk() {
		return family_id_fk;
	}
	public void setFamily_id_fk(String family_id_fk) {
		this.family_id_fk = family_id_fk;
	}
	public String getSubreginal_id_fk() {
		return subreginal_id_fk;
	}
	public void setSubreginal_id_fk(String subreginal_id_fk) {
		this.subreginal_id_fk = subreginal_id_fk;
	}
	
	
	
	
}
