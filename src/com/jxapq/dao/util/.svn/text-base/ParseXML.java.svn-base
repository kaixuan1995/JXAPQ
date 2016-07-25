package com.jxapq.dao.util;

import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class ParseXML {
	String path =this.getClass().getClassLoader().getResource("/").getPath(); 
	public static voClass parsexml(String xmlFileURL, String voName) {
		String fileURL = xmlFileURL;
		//String fileURL = ParseXML.class.getClassLoader().getResource("config/" + xmlFileURL).getPath();
		voClass vo = new voClass();
		// 实例化SAXReader对象
		SAXReader reader = new SAXReader();
		Document document = null;
		try {
			// 获取XML文件对应的XML文档对象
			document = reader.read(fileURL);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		// 获取根节点
		Element palcard = document.getRootElement();
		// 获取指定名称的所有节点
		@SuppressWarnings("unchecked")
		List<Element> voNameElements = palcard.elements("voName");
		for (int i = 0; i < voNameElements.size(); i++) {
			Element ele = voNameElements.get(i);
			String eleAttribute = ele.attributeValue("id");
			if (voName.equals(eleAttribute)) {
				Element voClass = ele.element("voClass");
				vo.setVoname(voClass.getText());
				Element tableName = ele.element("tableName");
				vo.setTableName(tableName.getText());
				Element Connection = ele.element("Connection");
				vo.setConnection(Connection.getText());
				Element ParameterCon = ele.element("ParameterCon");
				vo.setParameterCon(ParameterCon.getText());
			}
		}
		return vo;
	}
}
