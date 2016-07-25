package com.jxapq.service.util;

import java.lang.reflect.Field;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.dom4j.io.SAXReader;

import com.jxapq.annotation.FieldAnnotation;
import com.jxapq.exception.UtilException;
import com.jxapq.vo.SqlNode;

public class ExcelUtils{
	
/*	//返回剩下的没有解析的记录数量。
	public static int findLeftExplainedNum(Workbook workbook,int hasExpalinedNum) {
		Sheet sheet=workbook.getSheetAt(0);
		int lastRowNum=sheet.getLastRowNum();
		return lastRowNum-hasExpalinedNum;
	}*/
	//返回后面即将解析的记录数量
/*	public static int nextExplainedNum(Workbook workbook,int hasExpalinedNum){
		Sheet sheet=workbook.getSheetAt(0);
		int lastRowNum=sheet.getLastRowNum()+1;
		int nextWillExpainedNum=lastRowNum-hasExpalinedNum;
		if(nextWillExpainedNum>=10){
			return 10;
		}else{
			return nextWillExpainedNum;
		}
	}
	*/
	
	
	public static String getFieldName(Workbook workbook,int excelBlankLineNum,SqlNode node) throws UtilException{
		Sheet sheet=workbook.getSheetAt(0);
		Row firstRow=sheet.getRow(excelBlankLineNum);
		String[] column=node.getColumns().split(",");
		String[] transTitle=new String[column.length];
		StringBuffer result=new StringBuffer();
		try {
			SAXReader reader=new SAXReader();
			Class clazz3=Class.forName(node.getVoClass());
			Field[] fields=clazz3.getDeclaredFields();
			for(int j=0;j<column.length;j++){
				String value=readCellValue(firstRow.getCell(Integer.parseInt(column[j])));
				for(Field field:fields){
					FieldAnnotation annotation=field.getAnnotation(FieldAnnotation.class);
					if(annotation!=null){
						if(annotation.cname().equals(value)){
							if(j==transTitle.length-1){
								result.append(annotation.fname()+"%+%");
							}else{
								result.append(annotation.fname()+"=?");
							}
							break;
						}
					}
				}
			}
		}catch(ClassNotFoundException e){
			throw new UtilException(e);
		}
		return result.toString();
	}
	
	public static String getWillExplainedData(Workbook workbook,String title,SqlNode node,int hasExplainedNum) {
		Sheet sheet=workbook.getSheetAt(0);
		StringBuffer resultTitle=new StringBuffer(title);
		String[] column=node.getColumns().split(",");
		Row row=sheet.getRow(hasExplainedNum);
		//String[] data=new String[node.getColumns().length()];
		for(int j=0;j<column.length;j++){
			Cell cell=row.getCell(Integer.parseInt(column[j]));
			String cellValue=readCellValue(cell);
			if(j==column.length-1){
				resultTitle.append(cellValue);
			}else{
				resultTitle.append(cellValue+"#%$#");
			}
		}
		return resultTitle.toString();
	}
	
	
	private static String readCellValue(Cell cell){
		String value = "null";
		if(cell==null){
			return value;
		}
		else if(cell.getCellType()==Cell.CELL_TYPE_BLANK){
			return value;
		}
		else if(cell.getCellType()==Cell.CELL_TYPE_BOOLEAN){
			Boolean bool= cell.getBooleanCellValue();
			if(bool.booleanValue()==true){
				return value= "true";
			}else{
				return value= "false";
			}
		}
		else if(cell.getCellType()==Cell.CELL_TYPE_NUMERIC){
			return value= (int)cell.getNumericCellValue()+"";
		}
		else if(cell.getCellType()==Cell.CELL_TYPE_STRING){
			return value= cell.getStringCellValue().replaceAll("\\s+", " ");
		}
		return value;
	}
	
	
	
/*	public static String getFieldName(Workbook workbook,int excelBlankLineNum,String viewName) throws UtilException{
		Sheet sheet=workbook.getSheetAt(0);
		Row firstRow=sheet.getRow(excelBlankLineNum);
		int firstRowCellNum=firstRow.getPhysicalNumberOfCells();
		String[] transTitle=new String[firstRowCellNum];
		StringBuffer result=new StringBuffer();
		try {
			String path=ExcelUtils.class.getClassLoader().getResource("com/jxapq/config/SqlVO.xml").getPath();
			voClass vo=ParseXML.parsexml(path, viewName);
			SAXReader reader=new SAXReader();
			String className=vo.getVoname();
			Class clazz3=Class.forName(className);
			Field[] fields=clazz3.getDeclaredFields();
			for(int j=0;j<firstRowCellNum;j++){
				String value=readCellValue(firstRow.getCell(j));
				for(Field field:fields){
					FieldAnnotation annotation=field.getAnnotation(FieldAnnotation.class);
					if(annotation!=null){
						if(annotation.cname().equals(value)){
							transTitle[j]=annotation.fname();
							break;
						}
					}
				}
			}
			for(int i=0;i<transTitle.length;i++){
				if(i==transTitle.length-1){
					result.append(transTitle[i]+"%+%");
				}else{
					result.append(transTitle[i]+"=?");
				}
			}
		}catch(ClassNotFoundException e){
			throw new UtilException(e);
		}
		return result.toString();
	}*/
	/*public static String[] getWillExplainedData(Workbook workbook,String title,int hasExplainedNum) {
		int nextWillExpainedNum = nextExplainedNum(workbook,hasExplainedNum);
		String[] datas=new String[nextWillExpainedNum];
		//解析指定的要指定数量的数据
		Sheet sheet=workbook.getSheetAt(0);
		int flag=0;
		for(int i=hasExplainedNum;i<hasExplainedNum+nextWillExpainedNum;i++){
			String titleTemp=title.substring(0);
			StringBuffer resultTitle=new StringBuffer(titleTemp);
			Row row=sheet.getRow(i);
			for(int j=0;j<row.getLastCellNum();j++){
				Cell cell=row.getCell(j);
				String cellValue=readCellValue(cell);
				if(j==row.getLastCellNum()-1){
					resultTitle.append(cellValue);
				}else{
					resultTitle.append(cellValue+"#%$#");
				}
			}
			datas[flag++]=resultTitle.toString();
		}
		return datas;
	}
	private static String readCellValue(Cell cell){
		String value = null;
		if(cell==null){
			return value;
		}
		if(cell.getCellType()==Cell.CELL_TYPE_BLANK){
			return value;
		}
		else if(cell.getCellType()==Cell.CELL_TYPE_BOOLEAN){
			Boolean bool= cell.getBooleanCellValue();
			if(bool.booleanValue()==true){
				return value= "true";
			}else{
				return value= "false";
			}
		}
		else if(cell.getCellType()==Cell.CELL_TYPE_NUMERIC){
			return value= (int)cell.getNumericCellValue()+"";
		}
		else if(cell.getCellType()==Cell.CELL_TYPE_STRING){
			return value= cell.getStringCellValue();
		}
		return value;
	
	}*/
	
	
	
	
	
	
	
}