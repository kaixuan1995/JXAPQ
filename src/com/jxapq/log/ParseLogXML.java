package com.jxapq.log;

import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.jxapq.vo.Log;

public class ParseLogXML {
	String path = this.getClass().getClassLoader().getResource("/").getPath()
			+ "com/jxapq/config/log.xml";
	
	public static Log parseLogXml(String xmlFileURL, String voName,String type) {
		String fileURL = xmlFileURL;
		Log log = new Log();
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
		Element rootElement = document.getRootElement();
		// 获取指定名称的所有节点
		@SuppressWarnings("unchecked")
		List<Element> voNameElements = rootElement.elements("voName");
		for (int i = 0; i < voNameElements.size(); i++) {
			Element ele = voNameElements.get(i);
			String eleAttribute = ele.attributeValue("id");
			if (voName.equals(eleAttribute)) {
				Element logType = ele.element(type);
				if(logType!=null){
					log.setLog_content(logType.getText());
					log.setLog_Type(Integer.parseInt(logType.attributeValue("id")));
				}
			}
		}
		return log;
	}
	
	
//	public static void main(String[] args) {
//		
//		Log log=ParseLogXML.parseLogXml("E:\\Log.xml","userLoginView","query");
//		System.out.println(log);
//	}
}
