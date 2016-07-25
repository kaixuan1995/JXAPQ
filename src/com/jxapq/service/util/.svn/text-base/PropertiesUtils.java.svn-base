package com.jxapq.service.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.jxapq.exception.UtilException;


/**
 * 对properties文件的解析工具，用于导出中得到统计资料的中文明
 * 如种：中文名、种学名  配置文件中的字段要与vo属性一一对应
 * @author Administrator
 *
 */
public class PropertiesUtils {
	
	public static String[] getValue(String PropertiesName) {
		// 生成输入流  
	    InputStream ins=PropertiesUtils.class.getResourceAsStream("/com/jxapq/service/properties/"+PropertiesName+".properties");
	    List<String> list = new ArrayList<String>();
	    try {
	    	BufferedReader br = new BufferedReader(new InputStreamReader(ins));
			String str;
			while((str = br.readLine()) != null) {
				list.add(str.replace("=", ""));	
			}
			System.out.println();
	    } catch (IOException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	    }
	    
	    String []s = new String[list.size()];
	    for(int i = 0;i<list.size();i++) {
	    	s[i] = list.get(i);
	    }
	    return s;    
	}
	
	
	
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws UtilException 
	 */
	public static String[][] getTableByid() throws UtilException{
		//存放id长度对应VoName的properties的文件
		InputStream ins=PropertiesUtils.class.getResourceAsStream("/com/jxapq/service/properties/TableName.properties");
		// 生成properties对象  
		List<String> listid = new ArrayList<String>();
		List<String> listValue = new ArrayList<String>();
		String[] strs = new String[2];
		try {
	    	BufferedReader br = new BufferedReader(new InputStreamReader(ins));
			String str;
			while((str = br.readLine()) != null) {
				strs = str.split("=");
				listid.add(strs[0]);
				listValue.add(strs[1]);
			}
			System.out.println();
		    } catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
	    }
		String [][] array = new String[2][listid.size()];
		for(int i = 0;i<listid.size();i++) {
			array[0][i] = listid.get(i);
			array[1][i] = listValue.get(i);
		}
        return array; 
	}
	
	/**
	 * 
	 * @param PropertiesName：propesties的名字
	 * @param key：propesties文件的key
	 * @return
	 * @throws UtilException
	 */
	public static String getVoNameByid(String PropertiesName,String key) throws UtilException {
		InputStream ins=PropertiesUtils.class.getResourceAsStream("/com/jxapq/service/properties/"+PropertiesName+".properties");
		Properties p = new Properties();
		try {
			p.load(ins);
		} catch (IOException e) {
			throw new UtilException("没有找到"+PropertiesName+".propesties文件");
		}
		return (String) p.get(key);
	}
}
