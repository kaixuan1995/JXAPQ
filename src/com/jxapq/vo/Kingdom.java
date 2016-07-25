package com.jxapq.vo;

import com.jxapq.annotation.AnnoTableName;
import com.jxapq.annotation.FieldAnnotation;

@AnnoTableName(tableName = "t_kingdom",length=6)
public class Kingdom {
	@FieldAnnotation(cname="界ID",fname="kingdom_id")
	private String kingdom_id;
	@FieldAnnotation(cname="界学名",fname="kingdom_sname")
	private String kingdom_sname; 
	@FieldAnnotation(cname="界中文名",fname="kingdom_cname")
	private String kingdom_cname;
	@FieldAnnotation(cname="界英文名",fname="kingdom_ename")
	private String kingdom_ename;
	@FieldAnnotation(cname="界拼音",fname="kingdom_spelling")
	private String kingdom_spelling;
	@FieldAnnotation(cname="界概述",fname="kingdom_summarize")
	private String kingdom_summarize;
	
	public Kingdom() {
	}
	
	public Kingdom(String kingdom_id, String kingdom_sname,
			String kingdom_cname, String kingdom_ename, String kingdom_spelling, String kingdom_summarize) {
		this.kingdom_id = kingdom_id;
		this.kingdom_sname = kingdom_sname;
		this.kingdom_cname = kingdom_cname;
		this.kingdom_ename = kingdom_ename;
		this.kingdom_spelling = kingdom_spelling;
		this.kingdom_summarize = kingdom_summarize;
	}

	public String getKingdom_id() {
		return kingdom_id;
	}
	public void setKingdom_id(String kingdom_id) {
		this.kingdom_id = kingdom_id;
	}
	public String getKingdom_sname() {
		return kingdom_sname;
	}
	public void setKingdom_sname(String kingdom_sname) {
		this.kingdom_sname = kingdom_sname;
	}
	public String getKingdom_cname() {
		return kingdom_cname;
	}
	public void setKingdom_cname(String kingdom_cname) {
		this.kingdom_cname = kingdom_cname;
	}
	public String getKingdom_ename() {
		return kingdom_ename;
	}
	public void setKingdom_ename(String kingdom_ename) {
		this.kingdom_ename = kingdom_ename;
	}
	
	public String getKingdom_spelling() {
		return kingdom_spelling;
	}

	public void setKingdom_spelling(String kingdom_spelling) {
		this.kingdom_spelling = kingdom_spelling;
	}

	public String getKingdom_summarize() {
		return kingdom_summarize;
	}
	public void setKingdom_summarize(String kingdom_summarize) {
		this.kingdom_summarize = kingdom_summarize;
	}

	@Override
	public String toString() {
		return "Kingdom [kingdom_id=" + kingdom_id + ", kingdom_sname="
				+ kingdom_sname + ", kingdom_cname=" + kingdom_cname
				+ ", kingdom_ename=" + kingdom_ename + ", kingdom_spelling="
				+ kingdom_spelling + ", kingdom_summarize=" + kingdom_summarize
				+ "]";
	}
	
	
	
}
