package com.jxapq.vo;

import com.jxapq.annotation.AnnoTableName;
import com.jxapq.annotation.FieldAnnotation;


@AnnoTableName(tableName="t_class",length=8)
public class Clazz {

	
	@FieldAnnotation(fname="class_id",cname="*纲id")
	private int class_id;						//纲id
	@FieldAnnotation(fname="class_sname",cname="*学名")
	private String class_sname;					//纲学名
	@FieldAnnotation(fname="class_cname",cname="*纲中文名")
	private String class_cname;					//纲中文名
	@FieldAnnotation(fname="class_ename",cname="*英文名")
	private String class_ename;					//纲英文名
	@FieldAnnotation(fname="class_spelling",cname="*中文拼音")
	private String class_spelling;				//纲拼音
	@FieldAnnotation(fname="class_summarize",cname="*概述")
	private String class_summarize;				//纲概述
	@FieldAnnotation(fname="class_id_fk",cname="*纲外键")
	private int class_id_fk;					//纲外键
	@FieldAnnotation(fname="phylum_id_fk",cname="*门外键")
	private int phylum_id_fk;					//门id
	@FieldAnnotation(fname="flag",cname="*是否是亚纲")
	private int flag;
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public String getClass_sname() {
		return class_sname;
	}
	public void setClass_sname(String class_sname) {
		this.class_sname = class_sname;
	}
	public String getClass_cname() {
		return class_cname;
	}
	public void setClass_cname(String class_cname) {
		this.class_cname = class_cname;
	}
	public String getClass_ename() {
		return class_ename;
	}
	public void setClass_ename(String class_ename) {
		this.class_ename = class_ename;
	}
	public String getClass_spelling() {
		return class_spelling;
	}
	public void setClass_spelling(String class_spelling) {
		this.class_spelling = class_spelling;
	}
	public String getClass_summarize() {
		return class_summarize;
	}
	public void setClass_summarize(String class_summarize) {
		this.class_summarize = class_summarize;
	}
	public int getClass_id_fk() {
		return class_id_fk;
	}
	public void setClass_id_fk(int class_id_fk) {
		this.class_id_fk = class_id_fk;
	}
	public int getPhylum_id_fk() {
		return phylum_id_fk;
	}
	public void setPhylum_id_fk(int phylum_id_fk) {
		this.phylum_id_fk = phylum_id_fk;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	
}
