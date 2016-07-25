package com.jxapq.servlet.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.jxapq.vo.SqlNode;
//解析xml工具类
public class AnaysisXmlTool {
	private String fileName = null;//xml文件名
	private SAXReader saxread = new SAXReader();
	private Document document;
	private String result = null;
	public AnaysisXmlTool(String fileName) {
		this.fileName = fileName;
	}

	// 根据要获取的名得到值
	public String getViewName(String name, String type) {
		try {
			document = saxread.read(new File(fileName));
			Element RootElement = document.getRootElement();
			Element firstElement = RootElement.element(name);
			result = firstElement.attributeValue(type);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//根据要获取的视图获得对应的子节点的内容。
	public String getSubNodeContent(String view,String subNodeName){
		String result="";
		try {
			document = saxread.read(new File(fileName));
			Element RootElement = document.getRootElement();
			Element firstElement = RootElement.element(view);
			result = firstElement.element(subNodeName).getText();
			return result;
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<SqlNode> getSqlNode(String view){
		List<SqlNode> sqlNodes=new ArrayList<SqlNode>();
		try {
			document = saxread.read(new File(fileName));
			Element RootElement = document.getRootElement();
			Element firstElement = RootElement.element(view);
			List<Element> list = firstElement.elements("sql");
			for(Element e:list){
				SqlNode node=new SqlNode();
				String columns=e.elementText("columns");
				String voClass=e.elementText("voClass");
				String main=e.elementText("main");
				String voName=e.elementText("voName");
				String mainKey=e.elementText("mainKey");
				node.setColumns(columns);
				node.setVoClass(voClass);
				node.setVoName(voName);
				node.setMain(main);
				node.setMainKey(mainKey);
				sqlNodes.add(node);
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return sqlNodes;
	}
}
