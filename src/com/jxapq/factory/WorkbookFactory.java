package com.jxapq.factory;

import java.io.File;
import java.io.FileInputStream;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class WorkbookFactory {
	private WorkbookFactory(){
		
	}
	private static final WorkbookFactory factory=new WorkbookFactory();
	public static WorkbookFactory getInstance(){
		return factory;
	}
	public static Workbook createWorkBook(String filePath) throws Exception{
		
/*		
		InputStream in =new FileInputStream(filePath);
	    if (!in.markSupported()) {
            in = new PushbackInputStream(in, 8);
        }
        if (POIFSFileSystem.hasPOIFSHeader(in)) {
            return new HSSFWorkbook(in);
        }
        if (POIXMLDocument.hasOOXMLHeader(in)) {
            return new XSSFWorkbook(OPCPackage.open(in));
        }
        throw new IllegalArgumentException("你的excel版本目前poi解析不了");
		*/
		File file=new File(filePath);
		if(filePath.endsWith(".xls")){
			return new HSSFWorkbook(new FileInputStream(file));
		}else if(filePath.endsWith(".xlsx")){
			return new XSSFWorkbook(new FileInputStream(file));
		}else{
			throw new Exception("文件格式出现错误！");
		}
		
		
	}
}
