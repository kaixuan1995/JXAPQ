package com.jxapq.vo;

public class SqlNode {
	private String columns;
	private String voClass;
	private String voName;
	private String main;
	private String mainKey;
	
	public String getMainKey() {
		return mainKey;
	}
	public void setMainKey(String mainKey) {
		this.mainKey = mainKey;
	}
	public String getVoName() {
		return voName;
	}
	public void setVoName(String voName) {
		this.voName = voName;
	}
	public String getVoClass() {
		return voClass;
	}
	public void setVoClass(String voClass) {
		this.voClass = voClass;
	}
	public String getColumns() {
		return columns;
	}
	public void setColumns(String columns) {
		this.columns = columns;
	}
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}
	
}
