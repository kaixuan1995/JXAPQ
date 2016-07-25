package com.jxapq.vo;

import com.jxapq.annotation.AnnoTableName;
import com.jxapq.annotation.FieldAnnotation;


@AnnoTableName(tableName="v_family",length=14)
public class Family {
	@FieldAnnotation(fname = "family_id", cname = "*科id")
	private String family_id;
	@FieldAnnotation(fname = "family_sname", cname = "*学名")
	private String family_sname;
	@FieldAnnotation(fname = "family_cname", cname = "*中文名")
	private String family_cname;
	@FieldAnnotation(fname = "family_cnamee", cname = "*中文名(E)")
	private String family_cnamee;
	@FieldAnnotation(fname = "family_ename", cname = "*英文名")
	private String family_ename;
	@FieldAnnotation(fname = "family_enamee", cname = "*学名(E)")
	private String family_enamee;
	@FieldAnnotation(fname = "family_spelling", cname = "*中文拼音")
	private String family_spelling;
	@FieldAnnotation(fname = "family_commonInfo", cname = "俗名信息")
	private String family_commonInfo;
	@FieldAnnotation(fname = "family_summarize", cname = "*概述(形态特征)")
	private String family_summarize;
	@FieldAnnotation(fname = "family_notes", cname = "备注")
	private String family_notes;
	@FieldAnnotation(fname = "family_literature", cname = "参考文献")
	private String family_literature;
	@FieldAnnotation(fname = "sortedLevel", cname = "分类等级")
	private String family_level;
	@FieldAnnotation(fname = "order_id_fk", cname = "目外键")
	private String order_id_fk;
	@FieldAnnotation(fname = "subreginal_id_fk", cname = "子区系类型(id)")
	private int subreginal_id_fk;
	
	private String subreginal_name;
	
	public String getSubreginal_name() {
		return subreginal_name;
	}

	public void setSubreginal_name(String subreginal_name) {
		this.subreginal_name = subreginal_name;
	}

	public String getFamily_cnamee() {
		return family_cnamee;
	}

	public void setFamily_cnamee(String family_cnamee) {
		this.family_cnamee = family_cnamee;
	}

	public Family() {
	}

	public Family(String family_sname, String family_cname,
			String family_ename, String family_enamee, String family_cnamee,
			String family_spelling, String family_summarize,
			String family_notes, String family_literature,
			String family_commonInfo, String family_level, String order_id_fk,
			int subreginal_id_fk) {
		super();
		this.family_sname = family_sname;
		this.family_cname = family_cname;
		this.family_ename = family_ename;
		this.family_enamee = family_enamee;
		this.family_cnamee = family_cnamee;
		this.family_spelling = family_spelling;
		this.family_summarize = family_summarize;
		this.family_notes = family_notes;
		this.family_literature = family_literature;
		this.family_commonInfo = family_commonInfo;
		this.family_level = family_level;
		this.order_id_fk = order_id_fk;
		this.subreginal_id_fk = subreginal_id_fk;
	}

	public String getFamily_id() {
		return family_id;
	}

	public void setFamily_id(String family_id) {
		this.family_id = family_id;
	}

	public String getFamily_sname() {
		return family_sname;
	}

	public void setFamily_sname(String family_sname) {
		this.family_sname = family_sname;
	}

	public String getFamily_cname() {
		return family_cname;
	}

	public void setFamily_cname(String family_cname) {
		this.family_cname = family_cname;
	}

	public String getFamily_ename() {
		return family_ename;
	}

	public void setFamily_ename(String family_ename) {
		this.family_ename = family_ename;
	}

	public String getFamily_enamee() {
		return family_enamee;
	}

	public void setFamily_enamee(String family_enamee) {
		this.family_enamee = family_enamee;
	}

	public String getFamily_spelling() {
		return family_spelling;
	}

	public void setFamily_spelling(String family_spelling) {
		this.family_spelling = family_spelling;
	}

	public String getFamily_summarize() {
		return family_summarize;
	}

	public void setFamily_summarize(String family_summarize) {
		this.family_summarize = family_summarize;
	}

	public String getFamily_notes() {
		return family_notes;
	}

	public void setFamily_notes(String family_notes) {
		this.family_notes = family_notes;
	}

	public String getFamily_literature() {
		return family_literature;
	}

	public void setFamily_literature(String family_literature) {
		this.family_literature = family_literature;
	}

	public String getFamily_commonInfo() {
		return family_commonInfo;
	}

	public void setFamily_commonInfo(String family_commonInfo) {
		this.family_commonInfo = family_commonInfo;
	}


	public String getFamily_level() {
		return family_level;
	}

	public void setFamily_level(String family_level) {
		this.family_level = family_level;
	}

	public String getOrder_id_fk() {
		return order_id_fk;
	}

	public void setOrder_id_fk(String order_id_fk) {
		this.order_id_fk = order_id_fk;
	}

	public int getSubreginal_id_fk() {
		return subreginal_id_fk;
	}

	public void setSubreginal_id_fk(int subreginal_id_fk) {
		this.subreginal_id_fk = subreginal_id_fk;
	}

}
