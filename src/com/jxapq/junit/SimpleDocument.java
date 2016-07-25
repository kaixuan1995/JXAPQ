package com.jxapq.junit;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;

public class SimpleDocument {
	  
	   
	  public static void main(String[] args) throws FileNotFoundException, IOException {
	      FileInputStream is = new FileInputStream("temple/SpeciesTemple.doc");  
	      HWPFDocument doc = new HWPFDocument(is);  
	      Range range = doc.getRange();
	      //把range范围内的${reportDate}替换为当前的日
	      range.replaceText("${species_cname}", "300.00");
	      FileOutputStream os = new FileOutputStream("");
	      //把doc输出到输出流中
	      doc.write(os);
	      os.close();
	      is.close();
	     
	   }
	  
	   /**
	    * 关闭输入流
	    * @param is
	    */
	   private void closeStream(InputStream is) {
	      if (is != null) {
	         try {
	            is.close();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	   }
	 
	   /**
	    * 关闭输出流
	    * @param os
	    */
	   private void closeStream(OutputStream os) {
	      if (os != null) {
	         try {
	            os.close();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	   }
	  
	 
	}