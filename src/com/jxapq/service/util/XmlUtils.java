package com.jxapq.service.util;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URL;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.jxapq.exception.UtilException;

public class XmlUtils {


	
//得到指定xml文件的decument对象
	public static Document getDocument(String filename) throws UtilException{
		
		URL url = XmlUtils.class.getClassLoader().getResource(filename);
		String realpath = url.getPath();
		SAXReader reader = new SAXReader();
		try {
			return reader.read(new File(realpath));
		} catch (DocumentException e) {
			throw new UtilException("没有找到"+filename+".xml文件");
		}
		
	}
	
	//将内存中的document写入xml文件中
	public static void write2Xml(Document document,String filename) throws UtilException{
		
		URL url = XmlUtils.class.getClassLoader().getResource(filename);
		String realpath = url.getPath();
		
		OutputFormat format = OutputFormat.createPrettyPrint();
		XMLWriter writer;
		try {
			writer = new XMLWriter(new FileOutputStream(realpath), format );
			writer.write(document);
	        writer.close();
		} catch (Exception e) {
			throw new UtilException("插入数据到"+filename+".xml文件中失败了");
		}
	}
	
}
