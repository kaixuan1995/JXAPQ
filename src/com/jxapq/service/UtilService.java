package com.jxapq.service;
import java.awt.Image;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Workbook;

import com.jxapq.dao.BaseDao;
import com.jxapq.dao.impl.BaseDAOImpl;
import com.jxapq.dao.util.DBUtil;
import com.jxapq.exception.DBException;
import com.jxapq.exception.UtilException;
import com.jxapq.factory.WorkbookFactory;
import com.jxapq.service.util.ExcelUtils;
import com.jxapq.service.util.FileUtils;
import com.jxapq.service.util.OutputUtil;
import com.jxapq.service.util.Reflex;
import com.jxapq.servlet.util.AnaysisXmlTool;
import com.jxapq.servlet.util.LinkStringTool;
import com.jxapq.vo.Notice;
import com.jxapq.vo.SqlNode;


@SuppressWarnings("all")
public class UtilService{

	public <T> List<T> action(String voName, String params, String method) throws UtilException, DBException{
		if("inputdata".equals(method)) {
			return input(voName,params);
		}else if("statistics".equals(method)) {
			return statistics(voName, params);
		}else if("notice".equals(method)){
			return notice(voName,params);
		}else {
			throw new UtilException("没有该操作类型");
		}
	}
	
	public boolean action(String voName, String params, String method,Image[] image) {
		uploadImage(voName,params,image);
		return false;
	}
	
	private void uploadImage(String voName, String params, Image[] image) {
		// TODO Auto-generated method stub
		
	}


	private <T> List<T> input(String voName, String params) throws UtilException {
		List list=new ArrayList();
		Map<String,String> map =LinkStringTool.stringAccordingToKey(params);
		String uploadPath=map.get("file");
		String viewname=map.get("voName");
		String excelBlankLineNum=map.get("excelBlankNum");
		String sortedLevel=map.get("sortedLevel_value");
		String levelName=map.get("sortedLevel_name");
		String foreignKey=map.get("foreign_key_value");
		String foreignKeyName=map.get("foreign_key_name");
		String mainKeyName=null;
		Connection conn = null;
		int CurrentProcessNum = 0;
		try{
			if(FileUtils.isFileExisted(uploadPath)){
				//得到要解析的数据。
				conn = DBUtil.getConnection();
				conn.setTransactionIsolation(Connection.TRANSACTION_READ_UNCOMMITTED);
				conn.setAutoCommit(false);
				Workbook workbook=WorkbookFactory.getInstance().createWorkBook(uploadPath);
				int allColumnNum=workbook.getSheetAt(0).getLastRowNum()+1;
				//因为有些Excel是由注释的，所以要将这些行数给跳过
				CurrentProcessNum=Integer.parseInt(excelBlankLineNum)+1;
				//如果没有可以解析的数据的话，就可以进行退出了。
				String filePath = this.getClass().getResource("/com/jxapq/config/ImportConditionExcel.xml").getPath();
				// new 出工具类的对象引用
				AnaysisXmlTool axt = new AnaysisXmlTool(filePath);
				List<SqlNode> sqlNodes=axt.getSqlNode(viewname);
				int generatedKeys = 0;
				try{
					//尝试执行多表插入，但是因为某些业务问题，更改执行方式。
					while(CurrentProcessNum<allColumnNum){
						//现在执行主插入语句。
						for(SqlNode node:sqlNodes){
							String transTitle=ExcelUtils.getFieldName(workbook, Integer.parseInt(excelBlankLineNum), node);
							String data=ExcelUtils.getWillExplainedData(workbook, transTitle,node,CurrentProcessNum);
							if(node.getMain().equals("true")){
								if(!levelName.equals("null")){
									data=LinkStringTool.insertString(data, levelName, sortedLevel);
								}
								//因为导入的时候，为了避免他们输入0,1的标志位，对于这种分类系统，结构相对固定，所以直接在这里写死了。
								if(node.getVoName().equals("addGangView")){
									data=LinkStringTool.insertString(data, "flag", "0");
								}
								if(node.getVoName().equals("addYagangView")){
									data=LinkStringTool.insertString(data, "flag", "1");
								}
									data=LinkStringTool.insertString(data, foreignKeyName, foreignKey);
									data=LinkStringTool.clearNullString(data);
									generatedKeys=new BaseDAOImpl().saveReturnID(data, node.getVoName(), "save",conn);
									mainKeyName=node.getMainKey();
									
							}else{
/*								data=LinkStringTool.insertString(data, mainKeyName, generatedKeys+"");		
								System.out.println(data);
								new BaseDAOImpl().saveReturnID(data, node.getVoName(), "save",conn);*/
								if(node.getVoName().equals("addSpecies_distributeView")){
									
								}
								if(node.getVoName().equals("addSpecies_protectionView")){
									
								}else{
									data=LinkStringTool.insertString(data, mainKeyName, generatedKeys+"");
									data=LinkStringTool.clearNullString(data);
									
									new BaseDAOImpl().saveReturnID(data, node.getVoName(), "save",conn);
								}
							}
						}
						CurrentProcessNum++;
					}
				}catch(DBException e){
					try {
						conn.rollback();
					} catch (SQLException e1) {
						throw new RuntimeException("系统出现故障！");
					}
					throw new RuntimeException("在读取到第"+CurrentProcessNum+"行数据时出现错误！");
			}
			}else{
				throw new RuntimeException("文件上传错误！请联系系统管理员！");
			}
		}catch(Exception e){
			throw new UtilException(e);
		}
		try {
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		list.add(CurrentProcessNum);
		return list;
	}
	
	
	
	
	
	
	public String output(String voName, String fieldName,String value,String URL) throws DBException, UtilException, ClassNotFoundException {
		BaseDao base = new BaseDAOImpl();
		//查找出要导出的数据资料
		String tableName = Reflex.getTableName("com.jxapq.vo."+voName);
		String sql = null;
		if(value.equals("false")) {
			sql = "select * from "+tableName;
		}else {
			sql = "select * from "+tableName+" where "+fieldName+" ="+"'"+value+"'";
		}
		List list = base.queryBySQL(sql, Class.forName("com.jxapq.vo."+voName), 0, 0);
		return OutputUtil.output(list, voName, URL);
	}
	
	
	private <T> List<T> notice(String voName,String params) throws DBException {
		BaseDao baseDao = new BaseDAOImpl();
		String sql = "select * from t_notice";
		return (List<T>) baseDao.queryBySQL(sql, Notice.class, 0, 0);
	}
	
	/**
	 * 统计功能
	 * @param voName
	 * @param params
	 * @return
	 */
	private <T> List<T> statistics(String voName,String params){
		return null;
	}	
	
}
