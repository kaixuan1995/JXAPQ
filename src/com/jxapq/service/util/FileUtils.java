package com.jxapq.service.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileUtils {
	public static boolean isFileExisted(String path) throws IOException{
		 File file= new File(path);
		 boolean flag=file.exists();
		 if(!flag){
			 throw new IOException("文件不存在！");
		 }
		 return flag;
	}
	
	
	public static void Output(String fileUrl, HttpServletResponse response) {
		 //读取文件  
        InputStream in = null;
        OutputStream out = null;
		try {
			in = new FileInputStream(fileUrl);
			out = response.getOutputStream();  
			//写文件  
	        int len;  
	        byte[] b = new byte[1024];
	        while((len=in.read(b)) > 0)  
	        {  
	            out.write(b, 0, len);  
	        }  
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
	        try {
				if(in != null) {
					in.close();
				}
				if(out != null) {
					out.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
	        OutputUtil.deleteFile(fileUrl);
		}
	}
}
