package com.jxapq.vo;

import com.jxapq.annotation.AnnoTableName;
import com.jxapq.annotation.FieldAnnotation;


@AnnoTableName(tableName="t_phylum",length=7)
public class Phylum {
	
	@FieldAnnotation(fname="phylum_id",cname="*门编号")
	private String phylum_id;
	
	@FieldAnnotation(fname="phylum_sname",cname="*学名")
	private String phylum_sname;
	
	@FieldAnnotation(fname="phylum_cname",cname="*中文名")
	private String phylum_cname;
	
	@FieldAnnotation(fname="phylum_ename",cname="*英文名")
	private String phylum_ename;
	
	@FieldAnnotation(fname="phylum_spelling",cname="*中文拼音")
	private String phylum_spelling;
	
	@FieldAnnotation(fname="phylum_summarize",cname="*概述")
	private String phylum_summarize;
	
	@FieldAnnotation(fname="kingdom_id_fk",cname="*界外键")
	private String kingdom_id_fk;
	public Phylum() {
	}
	public Phylum(String phylum_sname, String phylum_cname,
			String phylum_ename, String phylum_summarize, String phylum_spelling, String kingdom_id_fk) {
		this.phylum_sname = phylum_sname;
		this.phylum_cname = phylum_cname;
		this.phylum_ename = phylum_ename;
		this.phylum_summarize = phylum_summarize;
		this.phylum_spelling = phylum_spelling;
		this.kingdom_id_fk = kingdom_id_fk;
	}
	public String getPhylum_id() {
		return phylum_id;
	}
	public void setPhylum_id(String phylum_id) {
		this.phylum_id = phylum_id;
	}
	public String getPhylum_sname() {
		return phylum_sname;
	}
	public void setPhylum_sname(String phylum_sname) {
		this.phylum_sname = phylum_sname;
	}
	public String getPhylum_cname() {
		return phylum_cname;
	}
	public void setPhylum_cname(String phylum_cname) {
		this.phylum_cname = phylum_cname;
	}
	public String getPhylum_ename() {
		return phylum_ename;
	}
	public void setPhylum_ename(String phylum_ename) {
		this.phylum_ename = phylum_ename;
	}
	public String getPhylum_summarize() {
		return phylum_summarize;
	}
	public void setPhylum_summarize(String phylum_summarize) {
		this.phylum_summarize = phylum_summarize;
	}
	public String getPhylum_spelling() {
		return phylum_spelling;
	}
	public void setPhylum_spelling(String phylum_spelling) {
		this.phylum_spelling = phylum_spelling;
	}
	public String getKingdom_id_fk() {
		return kingdom_id_fk;
	}
	public void setKingdom_id_fk(String kingdom_id_fk) {
		this.kingdom_id_fk = kingdom_id_fk;
	}
	
	
}
