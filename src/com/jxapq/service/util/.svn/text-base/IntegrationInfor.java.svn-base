package com.jxapq.service.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.jxapq.exception.UtilException;

public class IntegrationInfor {

	/**
	 * 得到一个List集合中的所有分类登记
	 * @param list
	 * @return
	 * @throws UtilException
	 */
	@SuppressWarnings("rawtypes")
	public static List getInfor(List list) throws UtilException {
		String [] ids = new IntegrationInfor().getId(list);
		for(int i = 0;i<ids.length;i++) {
			String voName = PropertiesUtils.getVoNameByid("VoName", ids[i]);
			Field[] fields = voName.getClass().getDeclaredFields();
			for(int j = 0;j<fields.length;j++) {
				if("classify".equals(fields[i].toString())) {
					String value = new IntegrationInfor().getAllClassicInfo(ids[i]);
					try {
						BeanUtils.setProperty(voName, fields[i].toString(), value);
					} catch (Exception e) {
						throw new UtilException("插入分类等级信息失败");
					} 
				}
			}
		}
		return list;
	}
	
	
	/**
	 * 得到所有要解析的ID
	 * @param list
	 * @return
	 * @throws UtilException
	 */
	@SuppressWarnings("rawtypes")
	private String[] getId(List list) throws UtilException {
		return Reflex.reflexId(list);
	}
	
	/**
	 * 判断参数是否合法,合格返回id
	 * @param id
	 * @return
	 * @throws UtilException
	 */
	private int judgeLength(String id) throws UtilException {
		try{
			Integer.parseInt(id);
		}catch(Exception e) {
			throw new UtilException("参数不合法：为int类型");
		}
		
		if(Integer.parseInt(id)<0&&Integer.parseInt(id)>14) {
			throw new UtilException("参数不合法：1--14位");
		}else{
			return Integer.parseInt(id);
		}
	}
	
	
	/**
	 * 通过id拼接字符串，查找数据库
	 * @param id
	 * @return
	 * @throws UtilException
	 */
	private String getSingleClassicInfo(String id) throws UtilException{
		
		new IntegrationInfor().judgeLength(id);
		
		String[][] sValue= PropertiesUtils.getTableByid();
		
		String[] EveryLayerIdNum=sValue[0];
		String[] tablename = sValue[1];
		
		List<Integer> list=new ArrayList<Integer>();
		for(int i = 0;i<EveryLayerIdNum.length;i++) {
			new IntegrationInfor().judgeLength(EveryLayerIdNum[i]);
			list.add(Integer.parseInt(EveryLayerIdNum[i]));
		}

		int length=id.length();//计算出通过id计算的长度。
		int index=list.indexOf(length);//通过长度，获得该长度将对应的查询的表的index。
		String[] everyTable=tablename[index].split(",");//通过index，获得该长度将对应的查询的
		String queryResult=null;
		//各个表
		for(int i=0;i<everyTable.length;i++){
			String tableName=everyTable[i];
			String tableIdName=tableName.replace("t_", "")+"_id";
			String tableCName=tableName.replace("t_", "")+"_sname";
			String tableSName=tableName.replace("t_", "")+"_came";
			String sql="select CONCAT_WS(':','"+tableSName+"','"+tableCName+"') from "+tableName+" where "+tableIdName+"="+id;
			System.out.println(sql);
			//执行sql查询语句。
			/**
			 * QueryRunner runner=new QueryRunner(ds.getConnection);
			 * String queryResult=runner.query(sql);
			 */
			//此情况应用于当用于查询种表时，当一查询到，立即断开查询。
		}
		return queryResult;
	}
	
	/**
	 * 通过id得到所有的分类登记信息
	 * @param id
	 * @return
	 * @throws UtilException
	 */
	private String getAllClassicInfo(String id) throws UtilException{
		Integer[] EveryLayerIdNum={1,2,3,4,6,8,11};
		int idLength=id.length();
		int flag=0;
		//取得该目录需要获得及级目录。
		for(int i=0;i<EveryLayerIdNum.length;i++){
			if(idLength<=EveryLayerIdNum[i]){
				flag=i;
				break;
			}
		}
		StringBuffer sb=new StringBuffer();
		for(int j=0;j<flag;j++){
			String SingleLayerId=id.substring(0, EveryLayerIdNum[j]);
			String singleClassicInfo=new IntegrationInfor().getSingleClassicInfo(SingleLayerId);
			if(singleClassicInfo==null){
				singleClassicInfo="";
			}
			if(j==flag-1){
				sb.append(singleClassicInfo);
			}else{
				sb.append(singleClassicInfo+" - ");
			}
		}
		return sb.toString();
	}
}
