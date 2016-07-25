package com.jxapq.service;

import java.util.ArrayList;
import java.util.List;

import com.jxapq.dao.impl.BaseDAOImpl;
import com.jxapq.exception.DBException;
import com.jxapq.exception.UserException;
import com.jxapq.log.LogService;
import com.jxapq.vo.People;
import com.jxapq.vo.User;

public class UserService {
	BaseDAOImpl base = new BaseDAOImpl();
	LogService logservice = new LogService();

	@SuppressWarnings({ "rawtypes" })
	public List action(String voName, String params, String method,
			String user_id) throws UserException, DBException {
		if ("login".equals(method) || "queryPassword".equals(method)
				|| "check".equals(method)) {
			return login(voName, params, user_id);
		} else if ("register".equals(method)) {
			return register(voName, params, user_id);
		} else if ("activeEmail".equals(method) || "alterInfo".equals(method)
				|| "agreeVip".equals(method) || "alterCode".equals(method)
				|| "alterEmail".equals(method)
				|| "alterPassword".equals(method)
				|| "notAgreeVip".equals(method) || "forgetpass3".equals(method)) {
			return update(voName, params, user_id);
		} else if ("queryUserInfo".equals(method)
				|| "forgetpass1".equals(method) || "forgetpass2".equals(method)
				|| "queryEmail".equals(method)) {
			return queryInfor(voName, params);
		} else if ("queryVip".equals(method) || "queryWorker".equals(method)
				|| "queryAllWorker".equals(method)) {
			return queryVip(voName, params);
		} else if ("addWorker".equals(method)) {
			return addWorker(voName, params, user_id);
		} else if ("addNotice".equals(method)) {
			return addNotice(voName, params, user_id);
		} else if ("queryNotice".equals(method)) {
			return queryNotice(voName, params);
		} else if ("delNotice".equals(method) || "delWorker".equals(method)) {
			return delete(voName, params, user_id);
		} else {
			throw new UserException("没有该操作类型");
		}
	}

	/**
	 * 删除信息功能
	 * 
	 * @param voName
	 * @param params
	 * @return
	 * @throws DBException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private List delete(String voName, String params, String user_id)
			throws DBException {
		List list = new ArrayList();
		boolean bo = base.delete(params, voName, "delete");
		list.add(bo);
		// 记录日志------------------------------------
		logservice.addLog(voName, "delete", user_id);
		return list;
	}

	/**
	 * 查找用户信息功能
	 * 
	 * @param voName
	 * @param params
	 * @return
	 * @throws DBException
	 */
	private <T> List<T> queryInfor(String voName, String params)
			throws DBException {
		return base.query(params, voName, "query", 0, 0);
	}

	/**
	 * 更新用户信息功能
	 * 
	 * @param voName
	 * @param params
	 * @return
	 * @throws DBException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private List update(String voName, String params, String user_id)
			throws DBException {
		List list = new ArrayList();
		boolean bo = base.update(params, voName, "update");
		list.add(bo);
		// 记录日志------------------------------------
		logservice.addLog(voName, "update", user_id);
		return list;
	}

	/**
	 * 注册用户功能
	 * 
	 * @param voName
	 * @param params
	 * @return
	 * @throws DBException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private <T> List<T> register(String voName, String params, String user_id)
			throws DBException {
		boolean bo = base.save(params, voName, "save");
		List list = new ArrayList();
		list.add(bo);
		// 记录日志------------------------------------
		logservice.addLog(voName, "save", user_id);
		return list;

	}

	// 系统管理员发布公告
	@SuppressWarnings({ "rawtypes", "unchecked", "unused" })
	private <T> List<T> addNotice(String voName, String params, String user_id)
			throws DBException {
		boolean bo = base.save(params, voName, "save");
		List list = new ArrayList();
		list.add(bo);
		// 记录日志------------------------------------
		logservice.addLog(voName, "save", user_id);
		return list;

	}// 系统管理员添加工作人员

	@SuppressWarnings({ "rawtypes", "unchecked", "unused" })
	private <T> List<T> addWorker(String voName, String params, String user_id)
			throws DBException {
		boolean bo = base.save(params, voName, "save");
		List list = new ArrayList();
		list.add(bo);
		// 记录日志------------------------------------
		logservice.addLog(voName, "save", user_id);
		return list;

	}

	/**
	 * 登入用户功能
	 * 
	 * @param voName
	 * @param params
	 * @return
	 * @throws DBException
	 */
	private List login(String voName, String params, String user_id)
			throws DBException {
		List list = base.query(params, voName, "query", 0, 0);
		if(!list.isEmpty()){
			People user=(People)list.get(0);
			user_id=user.getUser_id();
			// 记录日志------------------------------------
			logservice.addLog(voName, "query", user_id);
		}
		return list;
	}

	private <T> List<T> queryVip(String voName, String params)
			throws DBException {
		return base.query(params, voName, "query", 0, 0);
	}

	// 查询公告
	@SuppressWarnings("unused")
	private <T> List<T> queryNotice(String voName, String params)
			throws DBException {
		return base.query(params, voName, "query", 0, 0);
	}

	//添加图片
	public void addPicture(int zhongId,List<String>imgParams,String user_id) throws DBException{
		// 记录日志------------------------------------
		logservice.addLog("addSpecies_PicView", "save", user_id);
		
		new BaseDAOImpl().insertPic(zhongId,imgParams);
	}
}
