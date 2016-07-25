package com.jxapq.dao;

import java.sql.Connection;
import java.util.List;

import com.jxapq.exception.DBException;
import com.jxapq.vo.Linkage;

public interface BaseDao {
	
	// 保存方法
	public Boolean save(String ParametersString, String voName,String Operation)
			throws DBException;
	public int saveReturnID(String ParametersString, String voName,
			String Operation,Connection conn) throws DBException ;
	
	public int saveReturnID(String ParametersString, String voName,String Operation)
			throws DBException;

	public  Boolean save(String sql) throws DBException;
	
	// 更新方法
	public Boolean update(String ParametersString, String voName,String Operation)
			throws DBException;

	// 删除方法
	public <T> Boolean delete(String ParametersString, String voName,String Operation)
			throws DBException;

	
	// 传入定义的SQL语句进行查询
	public <T> List <T> queryBySQL(String SQL, Class<T> className,
			int firstIndex, int maxResult) throws DBException;

	// 视图传入参数查询方法
	public <T> List <T> query(String ParametersString, String voName,String Operation,
			int firstIndex, int maxResult) throws DBException;

	public int queryBySQL(String sql) throws DBException;
	
	public List<Linkage> queryLinkage(String sql) throws DBException; 
}
