package com.jxapq.service.util;

import java.io.File;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CreateFileURL {

	/**
	 * 给要下载的文件创建一个唯一的文件名，用于精确定位
	 * @return
	 */
	public static String createSignURL(){
		Date d = new Date();
		Format format = new SimpleDateFormat("yyyyWWddHHmmssS");
		String SignURL = format.format(d);
		return SignURL+randomURL();
	}
	
	/**
	 * 随机产生4为随机数字
	 * @return
	 */
	private static String randomURL() {
		String random = (int)(Math.random()*10000)+"";
		return random;
	}
	
	/**
	 * 根据路径创建一个文件出来，用于保存要下载的信息
	 * @param url
	 * @return
	 */
	public static String createFile(String url){
		File file = new File(url);
		if(!file.exists()) {
			file.mkdirs();
		}
		return url;
	}
}
