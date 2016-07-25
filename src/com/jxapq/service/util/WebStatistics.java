package com.jxapq.service.util;


import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;


import com.jxapq.dao.impl.BaseDAOImpl;
import com.jxapq.exception.DBException;
import com.jxapq.exception.UtilException;
import com.jxapq.vo.Statistics;


public class WebStatistics {
	
//	private static String filename = "Statistics.xml";
	
	private static String filename=WebStatistics.class.getClassLoader().getResource("/").getPath()+"Statistics.xml";
	
	
	//设置站统计的资料的XMl文件名，默认为Statistics.xml;
	public static void setFilename(String filename) {
		WebStatistics.filename = filename;
	}
	
	public static String getFilename() {
		return filename;
	}
	/**
	 * 用于工作人员更新站内资源,并写入Statistics.xml文件中
	 * @return
	 * @throws UtilException
	 */
	@SuppressWarnings("unused")
	public static boolean setStatisticsInfor() throws UtilException {
		Document document = XmlUtils.getDocument(filename);					
		int sum;                                                            //查找到的数量
		Element statistics = null;
		String table_name = null;											//要查找的表名
		try {
			statistics = document.getRootElement();        					//获取根节点
			@SuppressWarnings("rawtypes")
			List list_item = statistics.elements("type");
			for(int i = 0;i<list_item.size();i++) {
				Element item =(Element)list_item.get(i);
				table_name = item.element("table_Name").getText();
				sum = new WebStatistics().actionDao(table_name);	
				item.element("sum").setText(sum+"");
				XmlUtils.write2Xml(document, filename);  
				return true;
			}
		}catch(Exception e) {
			throw new UtilException("没有找到"+filename);
		}	
		return false;
	}

	public static List<Statistics> getStatisticsInfor() throws UtilException {
		Document document = XmlUtils.getDocument(filename);
		Element statistics = null;
		List<?> list_item = null;
		List<Statistics> list = new ArrayList<Statistics>();
		Statistics statis;
		try{
			statistics = document.getRootElement();
			list_item = statistics.elements();
			for(int i = 0;i<=list_item.size();i++) {
				statis = new Statistics();
				Element element = (Element) list_item.get(i);
				statis.setName(element.element("name").getText());
				statis.setSum(Integer.getInteger(element.element("sum").getText()));
				list.add(statis);
			}
		}catch(Exception e) {
			
		}
		return list;
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
	

	
	

