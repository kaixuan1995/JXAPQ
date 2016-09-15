package com.jxapq.log;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.jxapq.dao.impl.BaseDAOImpl;
import com.jxapq.exception.DBException;
import com.jxapq.vo.Log;

public class LogService {
	
	BaseDAOImpl baseDaoImpl = new BaseDAOImpl();
	String path = this.getClass().getClassLoader().getResource("/").getPath()
			+ "com/jxapq/config/Log.xml";

	//增加日志我是dev
	//123dev
	//234dev
	//public void addLog(String
	public void addLog(String voName, String log_type, String user_id)
			throws DBException {
		Log log = ParseLogXML.parseLogXml(path, voName, log_type);
System.out.println(log.getLog_Type()+"fffffffffffffffffffff");
		String sql = "";
		if (user_id != null) {
			sql = "insert into t_log(log_content,log_date,log_who_fk,log_type)values('"
					+ log.getLog_content() + "','" + getStringDateShort() + "','" + user_id + "',"
					+ log.getLog_Type() + ")";
		}else{
			sql="insert into t_log(log_content,log_date,log_type)values('"
					+ log.getLog_content() + "','" + getStringDateShort() + "',"
					+ log.getLog_Type() + ")";
		}
		System.out.println("sql:"+sql);
		baseDaoImpl.save(sql);
	}
	
	/**
	   * 获取现在时间
	   * 
	   * @return 返回短时间字符串格式yyyy-MM-dd
	   */
	private static String getStringDateShort() {
	   Date currentTime = new Date();
	   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   String dateString = formatter.format(currentTime);
	   return dateString;
	  
	}
	
}
