package com.jxapq.service.util;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.ss.formula.functions.T;


import com.jxapq.annotation.AnnoTableName;
import com.jxapq.annotation.FieldAnnotation;
import com.jxapq.exception.UtilException;
import com.jxapq.vo.Count;


@SuppressWarnings("all")
public class Reflex {

	/**
	 * 用于对一个VO对象进行反射
	 * @param 
	 * 		list：封装的是一个VO队形
	 * @return
	 * 		String[][]：返回是VO对象中所有的值
	 * @throws UtilException
	 */
	public static String[][] reflexPic(List<T> list) throws UtilException {
		String[][] values = new String[list.size()][];
	
		for(int i = 0;i<list.size();i++) {
			Object obj = list.get(i);
			Field[] fields = obj.getClass().getDeclaredFields();
			values[i] = new String[fields.length];	
			for(int j = 0;j<fields.length;j++) {
				try {
					values[i][j] = BeanUtils.getProperty(obj, fields[j].getName());
				} catch (Exception e) {
					throw new UtilException("没有该VO对象");
				} 
			}
		}
		return values;
	}
	
	
	/**
	 * 用于统计功能，可以得到目、科、属、种的数量
	 * 封装成count对象
	 * @param list
	 * @return
	 * @throws UtilException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static List getStatisInfo(List list) throws UtilException {
		String[][] statisInfos = reflex(list);
		Set<String> mu = new HashSet<String>();
		Set<String> ke = new HashSet<String>();
		Set<String> shu = new HashSet<String>();
		Set<String> zhong = new HashSet<String>();
		for(int i = 0;i<statisInfos.length;i++) {
			mu.add(statisInfos[i][6]);
			ke.add(statisInfos[i][5]);
			shu.add(statisInfos[i][4]);
			zhong.add(statisInfos[i][0]);
		}
		
		List<Count> list1 = new ArrayList<Count>();
		Count zhongCount = new Count(zhong.size(),"种");
		Count keCount = new Count(shu.size(),"属");
		Count shuCount = new Count(ke.size(),"科");
		Count muCount = new Count(mu.size(),"目");
		
		list1.add(keCount);
		list1.add(muCount);
		list1.add(shuCount);
		list1.add(zhongCount);
		return list1;
	}
	
	/**
	 * 用于对一般VO类的反射
	 * 得到一个二维数组，保存的是类的属性名与值
	 * @param list
	 * @return
	 * @throws UtilException
	 */
	public static String[][] reflex(List<T> list) throws UtilException {
		String[][] values = new String[list.size()][];
	
		for(int i = 0;i<list.size();i++) {
			Object obj = list.get(i);
			Field[] fields = obj.getClass().getDeclaredFields();
			values[i] = new String[fields.length];	
			
			for(int j = 0;j<fields.length;j++) {
				try {
					values[i][j] = BeanUtils.getProperty(obj, fields[j].getName());
				} catch (Exception e) {
					throw new UtilException("没有该VO对象");
				} 
			}
		}
		return values;
	}
	
	/**
	 * 通过list集合，找到实例T中的id
	 * @param list
	 * @return
	 * @throws UtilException
	 */
	public static String[] reflexId(List list) throws UtilException {
		String [] strId = new String[list.size()];
		for(int i = 0;i<list.size();i++) {
			Object obj = list.get(i);
			Field[] fields = obj.getClass().getDeclaredFields();
			try {
				strId[i] = BeanUtils.getProperty(obj, fields[0].getName());
			} catch (Exception e) {
				throw new UtilException("没有找到"+obj+"的VO对象");
			} 
		}
		return strId;
	}
	
	/**
	 * 
	 * @param voName
	 * @return
	 * @throws UtilException 
	 * @throws Exception 
	 */
	public static String[] reflexAnnotation(String voName) throws UtilException{
		List list = new ArrayList();
		Class clazz;
		String[] fieldCName;
		try {
			clazz = Class.forName("com.jxapq.vo."+voName);
			Field[] fields = clazz.getDeclaredFields();
			fieldCName = new String[fields.length];
			for(int i = 0;i<fields.length;i++){
				FieldAnnotation annotation=fields[i].getAnnotation(FieldAnnotation.class);
				if(annotation!=null){
					fieldCName[i] = annotation.cname();
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new UtilException("没有找到该VO对象");
		}
		return fieldCName;
		
	}
	
	
	public static String getTableName(String className){
		Class clazz = null;
		try {
			clazz = Class.forName(className);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		AnnoTableName table =  (AnnoTableName) clazz.getAnnotation(AnnoTableName.class);
		return table.tableName();
	}
	
}
