package com.jxapq.vo;

import com.jxapq.servlet.util.AnaysisXmlTool;

public class ImportCondition {
	private String voName;
	private String file;
	private String sortedLevel_name;
	private String sortedLevel_value;
	private String foreign_key_name;
	private String foreign_key_value;
	private String excelBlankNum;
	private String forward;
	
	
	public String getVoName() {
		return voName;
	}
	public void setVoName(String voName) {
		this.voName = voName;
	}
	public String getExcelBlankNum() {
		return excelBlankNum;
	}
	public void setExcelBlankNum(String excelBlankNum) {
		this.excelBlankNum = excelBlankNum;
	}
	public String getForward() {
		return forward;
	}
	public void setForward(String forward) {
		this.forward = forward;
	}
	public String getForeign_key_name() {
		return foreign_key_name;
	}
	public void setForeign_key_name(String foreign_key_name) {
		this.foreign_key_name = foreign_key_name;
	}
	public String getForeign_key_value() {
		return foreign_key_value;
	}
	public void setForeign_key_value(String foreign_key_value) {
		this.foreign_key_value = foreign_key_value;
	}

	public String getSortedLevel_name() {
		return sortedLevel_name;
	}
	public void setSortedLevel_name(String sortedLevel_name) {
		this.sortedLevel_name = sortedLevel_name;
	}

	public String getSortedLevel_value() {
		return sortedLevel_value;
	}
	public void setSortedLevel_value(String sortedLevel_value) {
		this.sortedLevel_value = sortedLevel_value;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	@Override
	public String toString() {
		String filePath = this.getClass().getResource("/com/jxapq/config/ImportConditionExcel.xml").getPath();
		// new 出工具类的对象引用
		AnaysisXmlTool axt = new AnaysisXmlTool(filePath);// 解析Control.xml工具
		this.foreign_key_name=axt.getSubNodeContent(voName, "foreign_Key_Name");
		this.excelBlankNum=axt.getSubNodeContent(voName, "excelBlankNum");
		this.sortedLevel_name=axt.getSubNodeContent(voName, "sortedLevelName");
		this.forward=axt.getSubNodeContent(voName, "forward");
		String backString;
		if(sortedLevel_name.equals("")||sortedLevel_name==null){
			return backString="voName====="+voName+"||file====="+file+"||foreign_key_value====="+foreign_key_value+"||foreign_key_name====="+foreign_key_name+"||excelBlankNum====="+excelBlankNum+"||forward====="+forward;
		}
		backString = "voName====="+voName+"||file====="+file+"||sortedLevel_value====="+sortedLevel_value+"||sortedLevel_name====="+sortedLevel_name+"||foreign_key_value====="+foreign_key_value+"||foreign_key_name====="+foreign_key_name+"||excelBlankNum====="+excelBlankNum+"||forward====="+forward;
		return backString;
	}
	
}
