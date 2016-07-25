package com.jxapq.vo;

//子区系类型
public class SubreginalType {
	private int subreginal_id;			//子区系类型iD
	private String subreginal_name;		//子区系类型名称
	private int subreginal_type;		//辨别类型
	private int reginal_id_fk;			//区系类型ID
	
	public int getSubreginal_id() {
		return subreginal_id;
	}
	public void setSubreginal_id(int subreginal_id) {
		this.subreginal_id = subreginal_id;
	}
	public String getSubreginal_name() {
		return subreginal_name;
	}
	public void setSubreginal_name(String subreginal_name) {
		this.subreginal_name = subreginal_name;
	}
	public int getReginal_id_fk() {
		return reginal_id_fk;
	}
	public void setReginal_id_fk(int reginal_id_fk) {
		this.reginal_id_fk = reginal_id_fk;
	}
	public int getSubreginal_type() {
		return subreginal_type;
	}
	public void setSubreginal_type(int subreginal_type) {
		this.subreginal_type = subreginal_type;
	}
	
	
	
}
