package com.jxapq.dao.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

public class ConvertString {
	/*
	 * 1.传入参数：用户请求servlet的request 2.返 回 值：请求参数和值的键值对字符串组合，
	 * 格式要求：参数名和参数值之间用#%$#连接，参数名与参数之间用%+%连接
	 * 例如：参数名1#%$#参数值%+%参数名2#%$#参数值%+%参数名3#%$#参数值1#%$#参数值2
	 */
	public static String packageString(HttpServlet request) {

		return null;
	}

	/*
	 * 1.传入参数parameterString： 请求参数和值的键值对字符串组合，
	 * 格式要求：参数名和参数值之间用#%$#连接，参数名与参数之间用%+%连接
	 * 例如：参数名1#%$#参数值%+%参数名2#%$#参数值%+%参数名3#%$#参数值1#%$#参数值2 2.传入参数voName：请求视图的视图名
	 * 3.返 回 值：符合条件的SQL语句
	 */
	public static String parseString(String xmlFileName,String parameterString, String voName,
			String Operation) {
		String sql = "";
		if ("save".equals(Operation.toLowerCase())) {
			sql = insert_sql(xmlFileName,parameterString, voName);
		} else if ("update".equals(Operation.toLowerCase())) {
			sql = update_sql(xmlFileName,parameterString, voName);
		} else if ("delete".equals(Operation.toLowerCase())) {
			sql = delete_sql(xmlFileName,parameterString, voName);
		} else if ("query".equals(Operation.toLowerCase())) {
			sql = query_sql(xmlFileName,parameterString, voName);
		} else {
			System.out.println("该操作类型未定义！");
		}
		return sql;
	}

	public static String delete_sql(String xmlFileName,String parameterString, String voName) {
		// "参数名1=? 参数名2=? 参数名3=? 参数名3=?%+%参数值1_1#%$#参数值2_1#%$#参数值3_1#%$#参数值3_2"
		// delete from User where user_id=?
		voClass vo = ParseXML.parsexml(xmlFileName, voName);
		String sql = "delete from " + vo.getTableName() + " where ";

		String[] str = parameterString.trim().split("%\\+%");
		String[] parameter = str[0].split("=\\?|like\\?");
		for (int i = 0; i < parameter.length; i++) {
			sql = sql + parameter[i];
			if (i != parameter.length) {
				sql = sql + "=?";
				if (i < parameter.length - 1) {
					sql = sql + " or ";
				}
			}
		}
		return sql;
	}

	/*
	 * 1.方法作用：构建为更新的SQL语句
	 */
	public static String update_sql(String xmlFileName,String parameterString, String voName) {
		if (parameterString.indexOf("#s#") != -1) {
			return specialUpdateSQL(xmlFileName,parameterString, voName);
		} else {
			return generalUpdateSQL(xmlFileName,parameterString, voName);
		}
	}

	// 构建多条件约束的update语句
	private static String specialUpdateSQL(String xmlFileName,String parameterString, String voName) {
		voClass vo = ParseXML.parsexml(xmlFileName, voName);
		String sql = "update " + vo.getTableName() + " set ";

		String[] str = parameterString.trim().split("%\\+%");
		String[] parameters = str[0].split("=\\?|like \\?");
		List<String> setParameters = new ArrayList<String>();
		List<String> whereParameters = new ArrayList<String>();
		for (int i = 0; i < parameters.length; i++) {
			if (parameters[i].indexOf("#s#") != -1) {
				setParameters.add(parameters[i].substring(3,
						parameters[i].length()));
			} else if (parameters[i].indexOf("#w#") != -1) {
				whereParameters.add(parameters[i].substring(3,
						parameters[i].length()));
			} else {
				System.out.println("参数格式有误！");
			}
		}
		for (int i = 0; i < setParameters.size(); i++) {
			sql = sql + setParameters.get(i) + "=?";
			if (i != setParameters.size() - 1) {
				sql = sql + ",";
			}
		}
		sql = sql + " where ";
		for (int i = 0; i < whereParameters.size(); i++) {
			sql = sql + whereParameters.get(i) + "=?";
			if (i != whereParameters.size() - 1) {
				sql = sql + " and ";
			}
		}
		return sql;
	}

	// 构建以ID为where条件的update语句
	private static String generalUpdateSQL(String xmlFileName,String parameterString, String voName) {
		voClass vo = ParseXML.parsexml(xmlFileName, voName);
		String sql = "update " + vo.getTableName() + " set ";
		String[] str = parameterString.trim().split("%\\+%");
		String[] parameter = str[0].split("=\\?|like \\?");
		int id_num = 0;
		for (int a = 0; a < parameter.length; a++) {
			if (parameter[a].indexOf("id") != -1) {
				id_num = a;
			}
		}
		String[] new_value = new String[parameter.length];
		int new_index = 0;
		for (int i = 0; i < id_num; i++) {
			new_value[new_index] = parameter[i];
			new_index++;
		}
		for (int i = id_num + 1; i < parameter.length; i++) {
			new_value[new_index] = parameter[i];
			new_index++;
		}
		new_value[parameter.length - 1] = parameter[id_num];

		for (int i = 0; i < new_value.length - 1; i++) {
			sql = sql + new_value[i] + "=?";
			if (i != new_value.length - 2) {
				sql = sql + ",";
			}
		}
		sql = sql + " where " + new_value[new_value.length - 1] + "=?";

		return sql;
	}

	/*
	 * 1.方法作用：构建为插入的SQL语句
	 */
	private static String insert_sql(String xmlFileName,String parameterString, String voName) {
		voClass vo = ParseXML.parsexml(xmlFileName, voName);
		String sql = "insert into " + vo.getTableName() + "(";
		String[] str = parameterString.trim().split("%\\+%");
		String[] parameter = str[0].split("=\\?|like \\?");
		for (int i = 0; i < parameter.length; i++) {
			sql = sql + parameter[i];
			if (i != parameter.length - 1) {
				sql = sql + ",";
			}
		}
		sql = sql + ")value(";
		for (int i = 0; i < parameter.length; i++) {
			sql = sql + "?";
			if (i != parameter.length - 1) {
				sql = sql + ",";
			}
		}
		sql = sql + ")";
		return sql;
	}

	/*
	 * 1.方法作用：构建为查询的SQL语句
	 */
	private static String query_sql(String xmlFileName,String parameterString, String voName) {
		voClass vo = ParseXML.parsexml(xmlFileName, voName);
		String voClass = vo.getVoname();// vo类名
		String[] fieldNames = getFieldNames(voClass);// 类中的所有属性值
		String sql = "select ";
		for (int i = 0; i < fieldNames.length; i++) {
			sql = sql + fieldNames[i];
			if (i != fieldNames.length - 1) {
				sql = sql + ",";
			}
		}
		sql = sql + " from " + vo.getTableName();
		String[] sp = parameterString.trim().split("%\\+%");
		String sql_where = " where " + vo.getConnection() + " ";
		String parameter = sp[0];
		String[] parameters = parameter.split("\\?");
		if ("and".equals(vo.getParameterCon())) {
			for (int i = 0; i < parameters.length; i++) {
				sql_where = sql_where + vo.getParameterCon() + " "
						+ parameters[i] + "? ";
			}
		} else if ("or".equals(vo.getParameterCon())) {
			sql_where = sql_where + "and (";
			for (int i = 0; i < parameters.length; i++) {
				if (i == 0) {
					sql_where = sql_where + " " + parameters[i] + "? ";
				}
				if (i != 0) {
					sql_where = sql_where + vo.getParameterCon() + " "
							+ parameters[i] + "? ";
				}
			}
			sql_where = sql_where + ")";
		}
		sql = sql + sql_where;
		
		return sql;
	}

	/*
	 * 1.方法作用：反射得到对象的所有属性 2.参数：对象的类名
	 */
	public static String[] getFieldNames(String voClass) {
		String[] fieldName = null;// 类中属性名
		try {
			@SuppressWarnings("rawtypes")
			Class cls = Class.forName(voClass);
			Object obj = cls.newInstance();// 对象实例化
			Field[] fields = obj.getClass().getDeclaredFields();// 获得类中所有属性
			fieldName = new String[fields.length];
			Field.setAccessible(fields, true);// 设置私有属性的可见性
			for (int i = 0; i < fieldName.length; i++) {
				fieldName[i] = fields[i].getName();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fieldName;
	}

	public static void main(String[] args) {
		// String parameterString
		// ="参数名1=? 参数名2=? 参数名3=? 参数名3=?%+%参数值1_1#%$#参数值2_1#%$#参数值3_1#%$#参数值3_2";
		String parameterString = "#s#log_content=?#w#log_id=?#s#log_date=?#s#log_reason=?%+%更新测试#%$#1#%$#1992-11-13#%$#3";
		String voName = "log";
		String xmlFileName="";
		// String Operation="save";
		// String Operation="delete";
		// String Operation="query";
		String Operation = "update";
		String sql = parseString(xmlFileName,parameterString, voName, Operation);
	}

}
