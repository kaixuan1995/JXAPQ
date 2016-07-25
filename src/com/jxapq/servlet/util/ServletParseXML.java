package com.jxapq.servlet.util;

import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;

import com.jxapq.exception.UtilException;
import com.jxapq.service.util.XmlUtils;

public class ServletParseXML {
	private static String filename= "com/jxapq/config/Linkage.xml";
	
	public static String getFilename() {
		return filename;
	}

	public static void setFilename(String filename) {
		ServletParseXML.filename = filename;
	}

	public static String getInfo(String view,String elementName) throws UtilException{
		Document document = XmlUtils.getDocument(filename);
		Element rootElement = document.getRootElement();
		@SuppressWarnings("unchecked")
		List<Element> linkageElements = rootElement.elements("Linkage");
		for(Element element:linkageElements) {
			if(view!=null && view.equals(element.attribute("id").getText())){
				return element.element(elementName).getText();
			}
		}
		return null;	
	}
	
 }
