package com.jxapq.servlet.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

public class LinkStringTool {

	public static String connectStr(HttpServletRequest request) {
		String result = "";// 总串
		String front = "";// 前半部分（name）
		String behind = "%+%";// 后半部分（value）
		@SuppressWarnings("unchecked")
		int  j=1;
		Enumeration<String> ParameterNames = request.getParameterNames();// 拿到
		while (ParameterNames.hasMoreElements()) {
			String name = ParameterNames.nextElement();
		
			// System.out.println(name);
			/*
			 * 1、当表单是sumbit,reset,button,还有是视图view时不拼成字符串直接进入下一个
			 * 2、表单hiddin中传视图view，规定要以view结尾
			 * 3、注册时，有新密码和重复密码，但其只需其中新密码的值，规定界面的name一致
			 */
			if (name.equalsIgnoreCase("submit")) {
				if (ParameterNames.hasMoreElements()) {
					name = ParameterNames.nextElement();
				}
			}
			j++;
			String value[] = request.getParameterValues(name);
			// 如果是视图名,和操作类型这跳过
			if (name.endsWith("view") || name.equalsIgnoreCase("method")
					|| name.equalsIgnoreCase("vcode")
					|| name.equalsIgnoreCase("button")||value[0].equals("") || name.contains("3id")) {
				continue;
			}
			// 对于一个name对应多值时，要name-->value1,name-->value2,name-->value3
			
			if (value.length > 1) {
				if (name.equalsIgnoreCase("user_password =")||name.equalsIgnoreCase("#s#user_alter_password =")
						||name.equalsIgnoreCase("#s#user_password =")) {// 如果是密码时，也是一个name对应多个value,但只能传一对
					front = front + name + "?";//
					behind = behind + value[0] + "#%$#";
				} else {
					for (int i = 0; i < value.length; i++) {
						front = front + name + "?";//
						behind = behind + value[i] + "#%$#";
					}
				}
			} else {
				front = front + name + "?";//
				if(name.contains("like")){
					behind = behind + "%"+value[0] +"%"+"#%$#";
				}else{
					behind = behind + value[0] + "#%$#";
				}
			}
			result = front + behind;
			result = result.substring(0, result.length() - "#%$#".length());
		}
		return result;
	}
/*	
	public static String mapToString(Map<String, String> map){
		StringBuilder data=new StringBuilder();
		for(Map.Entry<String, String> entry :map.entrySet()){
			String key=entry.getKey();
			String value=entry.getValue();
			data.append("("+key+"-----"+value+")");
		}
		
		return data.toString();
	}
	该方法是根据mapToString配套的方法值的获取。
	public static Map stringAccordingToKey(String sourceString){
		Map map = new HashMap();
		Matcher m =Pattern.compile("([\\w|_]+=====(([_\\w-\\\\:\\.])|[\u4e00-\u9fa5])+)").matcher(sourceString);
		while(m.find()){
			String matcherString = m.group();
			String[] matchers= matcherString.split("=====");
			map.put(matchers[0], matchers[1]);
		}
		return map;
	}*/
	
	public static Map stringAccordingToKey(String sourceString){
		Map map = new HashMap();
		String[] strs=sourceString.split("\\|\\|");
		for(String temp:strs){
			map.put(temp.split("=====")[0],temp.split("=====")[1] );
		}
		return map;
	}
	
	public static String insertString(String stringSource,String title,String content){
		stringSource=title+"=?"+stringSource;
		return stringSource.replace("%+%", "%+%"+content+"#%$#");
	}
	
	public static String clearNullString(String str){
		
		List<String> list=new ArrayList<String>();
		List<String> list2=new ArrayList<String>();
		String[] div = str.split("%\\+%");
		Matcher matcher=Pattern.compile("[\\w_]+(=\\?)?").matcher(div[0]);
		while(matcher.find()){
			list.add(matcher.group());
		}
		String[] strs=div[1].split("#%\\$#");
		for(int i=0;i<strs.length;i++){
			list2.add(strs[i]);
		}
		
		int flag=0;
		while((flag=list2.indexOf("null"))!=-1){
			list.remove(flag);
			list2.remove(flag);
		}
		StringBuffer data=new StringBuffer();
		for(String temp:list){
			data.append(temp);
		}
		data.append("%+%");
		for(int i=0;i<list2.size();i++){
			if(i==list2.size()-1){
				data.append(list2.get(i));
			}else{
				data.append(list2.get(i)+"#%$#");
			}
		}
		return data.toString();
	}
}
