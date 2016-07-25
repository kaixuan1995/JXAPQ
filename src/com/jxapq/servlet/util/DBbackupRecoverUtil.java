package com.jxapq.servlet.util;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

public class DBbackupRecoverUtil {

	/** 访问MySQL数据库服务器所在的url */
	private  String serverUrl;
	/** 访问MySQL数据库的用户名 */
	private  String userName;
	/** 访问MySQL数据库的密码 */
	private  String password;
	/** 备份的数据库名 */
	private  String backdbName;
	/** 要恢复的数据库名 */
	private  String restoredbName;
	/** 备份的数据库sql根目录 */
	private  String backupPath;
	
	static Properties pro = new Properties();

	static {
		InputStream inputstream = DBbackupRecoverUtil.class
				.getResourceAsStream("/com/jxapq/service/properties/DBUtil.properties");
		try {
			pro.load(inputstream);
		} catch (IOException e) {
			System.out.println("资源加载出错！！");
			e.printStackTrace();
		}
		
	}

	public String backup() throws IOException {
		backdbName = pro.getProperty("backdbName");
		backupPath = pro.getProperty("backupPath");
		userName = pro.getProperty("userName");
		password = pro.getProperty("password");
		serverUrl = pro.getProperty("serverUrl");
		String backupFile = backupPath
				+ backdbName
				+ new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss")
						.format(new Date()) + ".sql";

		String mysql = "mysqldump " + "--host=" + serverUrl + " --user="
				+ userName + " --password=" + password + " --opt " + backdbName
				+ "> " + backupFile;
		Process process = java.lang.Runtime.getRuntime()
				.exec("cmd /c " + mysql);
		try {
			process.waitFor();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println("备份成功!");

		return backupFile;

	}

	public void restore(String restoreFile) throws Exception {
		restoredbName = pro.getProperty("restoredbName");//要恢复的数据库名字
		userName = pro.getProperty("userName");
		password = pro.getProperty("password");
		serverUrl = pro.getProperty("serverUrl");
		
		String mysql = "mysql " + "-h" + serverUrl + " -u" + userName + " -p"
				+ password + " " + restoredbName + " < " + restoreFile;

		System.out.println(mysql);

		java.lang.Runtime.getRuntime().exec("cmd /c " + mysql);

		System.out.println("还原成功!");
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
////		DBbackupRecoverUtil backup = new DBbackupRecoverUtil(serverUrl,
////				userName, pwd);
//
//		try {
//			// backup.restore("e://demo.sql", "jxapq");
//			backup.backup("e://", "jxapq");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

}
