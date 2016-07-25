package com.jxapq.dao.impl;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.jxapq.dao.BaseDao;
import com.jxapq.dao.util.ConvertString;
import com.jxapq.dao.util.DBUtil;
import com.jxapq.dao.util.ParseXML;
import com.jxapq.dao.util.voClass;
import com.jxapq.exception.DBException;
import com.jxapq.vo.Linkage;

public class BaseDAOImpl implements BaseDao {

	String path = this.getClass().getClassLoader().getResource("/").getPath()
			+ "com/jxapq/config/SqlVO.xml";

	@Override
	public int saveReturnID(String ParametersString, String voName,
			String Operation) throws DBException {
		// 构建SQL语句
		String sql = ConvertString.parseString(path, ParametersString, voName,
				Operation);
		String[] str = ParametersString.trim().split("%\\+%");
		String[] value = str[1].trim().split("#%\\$#");
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		int saveID=0;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			for (int i = 0; i < value.length; i++) {
				ps.setString((i + 1), value[i]);
			}
			ps.executeUpdate();
			rs=ps.getGeneratedKeys();
			while(rs.next()){
				saveID=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.release();
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return saveID;
	}
	
	@Override
	public int saveReturnID(String ParametersString, String voName,
			String Operation,Connection conn) throws DBException {
		// 构建SQL语句
		String sql = ConvertString.parseString(path, ParametersString, voName,
				Operation);
System.out.println(sql);
		String[] str = ParametersString.trim().split("%\\+%");
		String[] value = str[1].trim().split("#%\\$#");
		PreparedStatement ps = null;
		ResultSet rs=null;
		int saveID=0;
		try {
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			for (int i = 0; i < value.length; i++) {
				ps.setString((i + 1), value[i]);
			}
			ps.executeUpdate();
			rs=ps.getGeneratedKeys();
			while(rs.next()){
				saveID=rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new DBException(e);
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				 throw new DBException(e);
			}
		}
		System.out.println("saveID:" + saveID);
		return saveID;
	}
	
	@Override
	public Boolean save(String sql) throws DBException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			int i = ps.executeUpdate();
			if (i == 0) {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release();
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	@Override
	public Boolean save(String ParametersString, String voName, String Operation)
			throws DBException {
        // 构建SQL语句
		String sql = ConvertString.parseString(path, ParametersString, voName,
				Operation);
		String[] str = ParametersString.trim().split("%\\+%");
		String[] value = str[1].trim().split("#%\\$#");
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			for (int i = 0; i < value.length; i++) {
				ps.setString((i + 1), value[i]);
			}
			int re = ps.executeUpdate();
			
		} catch (SQLException e) {
			throw new DBException(e);
		} finally {
			DBUtil.release();
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	@Override
	public Boolean update(String ParametersString, String voName,
			String Operation) throws DBException {
		if (ParametersString.indexOf("#s#") != -1) {
			return specialUpdate(ParametersString, voName, Operation);
		} else {
			return generalUpdate(ParametersString, voName, Operation);
		}
	}

	private Boolean specialUpdate(String ParametersString, String voName,
			String Operation) {
		// 构建SQL语句
		String sql = ConvertString.parseString(path,ParametersString, voName,
				Operation);
		String[] str = ParametersString.trim().split("%\\+%");
		String[] parameters = str[0].split("=\\?|like \\?");
		String[] values = str[1].split("#%\\$#");
		List<Integer> setParameterIndex = new ArrayList<Integer>();
		List<Integer> whereParameterIndex = new ArrayList<Integer>();
		for (int i = 0; i < parameters.length; i++) {
			if (parameters[i].indexOf("#s#") != -1) {
				setParameterIndex.add(i);
			} else if (parameters[i].indexOf("#w#") != -1) {
				whereParameterIndex.add(i);
			} else {
			}
		}
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			int index = 1;
			for (int i = 0; i < setParameterIndex.size(); i++) {
				ps.setString(index, values[setParameterIndex.get(i)]);
				index++;
			}
			for (int i = 0; i < whereParameterIndex.size(); i++) {
				ps.setString(index, values[whereParameterIndex.get(i)]);
				index++;
			}
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DBUtil.release();
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	private Boolean generalUpdate(String ParametersString, String voName,
			String Operation) {
		// 构建SQL语句
		String sql = ConvertString.parseString(path, ParametersString, voName,
				Operation);
		String[] str = ParametersString.trim().split("%\\+%");
		int id_num = 0;
		String[] parame = str[0].split("=\\?");
		for (int a = 0; a < parame.length; a++) {
			if (parame[a].indexOf("id") != -1) {
				id_num = a;
			}
		}
		String[] value = str[1].trim().split("#%\\$#");
		String[] new_value = new String[value.length];
		int new_index = 0;
		for (int i = 0; i < id_num; i++) {
			new_value[new_index] = value[i];
			new_index++;
		}
		for (int i = id_num + 1; i < value.length; i++) {
			new_value[new_index] = value[i];
			new_index++;
		}
		new_value[value.length - 1] = value[id_num];
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			for (int i = 0; i < value.length; i++) {
				ps.setString(i + 1, new_value[i]);
			}
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DBUtil.release();
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	@Override
	public <T> Boolean delete(String ParametersString, String voName,
			String Operation) throws DBException {
		String sql = ConvertString.parseString(path, ParametersString, voName,
				Operation);
		String[] str = ParametersString.trim().split("%\\+%");
		String[] value = str[1].split("#%\\$#");
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			for (int i = 0; i < value.length; i++) {
				ps.setString(i + 1, value[i]);
			}
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			DBUtil.release();
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public <T> List<T> queryBySQL(String sql, Class<T> clazz, int firstIndex,
			int maxResult) throws DBException {
		List result = new ArrayList();

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		Field[] fields = clazz.getDeclaredFields();
		Method[] methods = new Method[fields.length];
		Object obj = null;
		int index = 0;
		try {
			for (Field f : fields) {
				PropertyDescriptor pd = null;

				pd = new PropertyDescriptor(f.getName(), clazz);

				methods[index] = pd.getWriteMethod();// 获得写方法;
				index++;
			}
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			rs = ps.executeQuery();
			while (rs.next()) {
				obj = clazz.newInstance();
				for (int i = 0; i < fields.length; i++) {
					if ("int".equals(fields[i].getType().toString())) {
						if(rs.getString((i + 1))!=null) {
							methods[i].invoke(obj,
									Integer.parseInt(rs.getString((i + 1))));
						}
					} else if ("class java.lang.String".equals(fields[i]
							.getType().toString())) {
						if(rs.getString((i + 1))!=null) {
							methods[i].invoke(obj,
									(rs.getString((i + 1))));
						}
					} else if ("class java.util.Date".equals(fields[i]
							.getType().toString())) {
						if(rs.getString((i + 1))!=null) {
							SimpleDateFormat sdf = new SimpleDateFormat(
									"yyyy-MM-dd");
							sdf.setLenient(false);
							Date ddate = sdf
									.parse(rs.getString((i + 1)).toString());
							methods[i].invoke(obj, ddate);
						}
					}
				}
				result.add(clazz.cast(obj));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release();
		}
		return result;
	}

	@Override
	public int queryBySQL(String sql) throws DBException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			rs = ps.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release();
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> query(String ParametersString, String voName,
			String Operation, int firstIndex, int maxResult) throws DBException {
		@SuppressWarnings("rawtypes")
		List result = new ArrayList();
		String sql = ConvertString.parseString(path, ParametersString, voName,
				Operation);
		

		voClass vo = ParseXML.parsexml(path, voName);
		String voClassName = vo.getVoname();// vo类名
		String[] filedNames = ConvertString.getFieldNames(voClassName);
		String[] str = ParametersString.trim().split("%\\+%");
		String[] value = str[1].split("#%\\$#");
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		@SuppressWarnings("rawtypes")
		Class clazz = null;
		Object obj = null;
		Field[] fields = null;
		Method[] methods = null;
		try {
			clazz = Class.forName(voClassName);
			fields = clazz.getDeclaredFields();
			methods = new Method[fields.length];
			int index = 0;
			for (Field f : fields) {
				PropertyDescriptor pd = new PropertyDescriptor(f.getName(),
						clazz);
				methods[index] = pd.getWriteMethod();// 获得写方法;
				index++;
			}
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			for (int i = 0; i < value.length; i++) {
				ps.setString(i + 1, value[i]);
			}
			rs = ps.executeQuery();
			while (rs.next()) {
				obj = clazz.newInstance();
				for (int i = 0; i < filedNames.length; i++) {
					if ("int".equals(fields[i].getType().toString())) {
						if (rs.getString((i + 1)) != null) {
							methods[i].invoke(obj,
									Integer.parseInt(rs.getString((i + 1))));
						}
					} else if ("class java.lang.String".equals(fields[i]
							.getType().toString())) {
						if (rs.getString((i + 1)) != null) {
							methods[i].invoke(obj,
									(rs.getString((i + 1)).toString()));
						}
					} else if ("class java.util.Date".equals(fields[i]
							.getType().toString())) {
						if (rs.getString((i + 1)) != null) {
							SimpleDateFormat sdf = new SimpleDateFormat(
									"yyyy-MM-dd");
							sdf.setLenient(false);
							Date ddate = sdf.parse(rs.getString((i + 1))
									.toString());
							methods[i].invoke(obj, ddate);
						}
					}
				}
				result.add(clazz.cast(obj));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release();
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public List<Linkage> queryLinkage(String sql) throws DBException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Linkage linkage = null;
		List<Linkage> list = new ArrayList<Linkage>();
		try {
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			rs = ps.executeQuery();
			while (rs.next()) {
				linkage = new Linkage();
				linkage.setId(rs.getInt(1));
				linkage.setName(rs.getString(2));
				list.add(linkage);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release();
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/*获取插入时间*/
	public String getDate(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		return df.format(new Date());
	}

	
	/*查询当前要插入的种图片是否已经有主图片*/
	private synchronized boolean isMainPic(int zhongId){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			String sql ="select picture_mainpicture from t_picture where picture_mainpicture = 1 and species_id_fk="+zhongId;
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			rs = ps.executeQuery();
			while(rs.next()){
					return true;
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return false;
	}
	
	/*批量插入图片*/
	public synchronized void insertPic(int picId,List<String> params) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "insert into t_picture (picture_url,picture_time,picture_mainpicture,species_id_fk) values(?,?,?,?)";
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			Iterator<String>it = params.iterator();
			while(it.hasNext()){
				ps.setString(1,it.next());
				ps.setString(2,getDate());
				if(isMainPic(picId))
				{
					ps.setInt(3,0);//如果有主图片就设置为0
				}else{
					ps.setInt(3,1);//如果没有主图片就设置为1
				}
				}
				ps.setInt(4,picId);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.release();
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
