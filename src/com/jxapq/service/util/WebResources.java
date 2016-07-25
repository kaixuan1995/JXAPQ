package com.jxapq.service.util;


import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.jxapq.dao.impl.BaseDAOImpl;
import com.jxapq.exception.DBException;
import com.jxapq.exception.UtilException;
import com.jxapq.vo.Resources;


public class WebResources {
	/*
	 * 工作人员更新Resources配置文件
	 */
	@SuppressWarnings("unchecked")
	public boolean setResourcesInfor() throws UtilException {
		SAXReader saxreader = new SAXReader();
		String filename = WebResources.class.getClassLoader().getResource("Resources.xml").getPath();
		Document document = null;
		try {
			document = saxreader.read(filename);
		} catch (DocumentException e) {
			e.printStackTrace();
		}                                                     
		Element root = document.getRootElement(); 
		List<Element> list = root.elements("type");
		for(Element element : list) {
			int number = 0;
			try {
				number = new WebResources().actionDao(element.element("table_Name").getText());
			} catch (DBException e) {
				e.printStackTrace();
			}
			element.element("sum").setText(number + "");
		}
		OutputFormat format = OutputFormat.createPrettyPrint();
		XMLWriter writer;
		try {
			writer = new XMLWriter(new FileOutputStream(filename), format );
			writer.write(document);
	        writer.close();
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	/*
	 *获取配置文件的信息 
	 */
	@SuppressWarnings("unchecked")
	public static List<Resources> getResourcesInfor() throws UtilException {
		SAXReader saxreader = new SAXReader();
		String filename = WebResources.class.getClassLoader().getResource("Resources.xml").getPath();
		Document document = null;
		try {
			document = saxreader.read(filename);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		List<Resources> resourceList = new ArrayList<Resources>();
		Element root = document.getRootElement();
		List<Element> list = root.elements("type");
		for(Element element : list) {
			Resources resource = new Resources();
			resource.setName(element.element("name").getText());
			resource.setNumber(element.element("sum").getText());
			resourceList.add(resource);
		}
		return resourceList;
	}
	
	/**
	 * 执行操作语句，查找资源数目
	 * @param table_name
	 * @return
	 * @throws DBException
	 */
	private int actionDao(String table_name) throws DBException {
		String sql = "select count(*) from "+table_name;
		BaseDAOImpl base = new BaseDAOImpl();
		return base.queryBySQL(sql);
	}
}
	

	
	

