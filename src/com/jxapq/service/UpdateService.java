package com.jxapq.service;

import com.jxapq.dao.impl.BaseDAOImpl;
import com.jxapq.exception.DBException;
import com.jxapq.log.LogService;


public class UpdateService{
	BaseDAOImpl base = new BaseDAOImpl();
	LogService logservice = new LogService();
	public boolean action(String voName, String params, String method,String user_id) throws DBException {
		if("update".equals(method)) {
			return update(voName,params,user_id);
		}else if("delete".equals(method)) {
			return delete(voName,params,user_id);
		}else if("add".equals(method)) {
			return add(voName,params, user_id);
		}else {
			throw new DBException("没有该操作类型");
		}
			
	}

	/**
	 * 用户数据的添加
	 * @param voName
	 * @param params
	 * @return
	 * @throws DBException 
	 */
	private boolean add(String voName, String params,String user_id) throws DBException {
		// 记录日志------------------------------------
	    logservice.addLog(voName, "save", user_id);
		return base.save(params, voName, "save");
		
		// TODO Auto-generated method stub
		
	}

	/**
	 * 用户数据的删除
	 * @param voName
	 * @param params
	 * @return
	 * @throws DBException 
	 */
	private boolean delete(String voName, String params,String user_id) throws DBException {
		// 记录日志------------------------------------
		logservice.addLog(voName, "delete", user_id);
		return base.delete(params, voName, "delete");
		
	}

	/**
	 * 用于数据的修改
	 * @param voName
	 * @param params
	 * @return
	 * @throws DBException 
	 */
	private boolean update(String voName, String params,String user_id) throws DBException {
		// 记录日志------------------------------------
		logservice.addLog(voName, "update", user_id);
		return base.update(params, voName, "update");
		// TODO Auto-generated method stub
		
	}
	
	public int addSpecies(String voName, String params,String user_id) throws DBException{
		logservice.addLog(voName, "save", user_id);
		return base.saveReturnID(params, voName, "save");
	}
}
