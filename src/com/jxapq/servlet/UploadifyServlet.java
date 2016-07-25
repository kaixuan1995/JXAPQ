package com.jxapq.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jxapq.exception.DBException;
import com.jxapq.service.UserService;
import com.jxapq.vo.People;
  
public class UploadifyServlet extends HttpServlet  
{  
	private static final long serialVersionUID = -1983586123460031358L;
	String PATH = "/uploads/";
	String SZhongId;
	int zhongId;
  
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  
    {  
        this.doPost(request, response);  
    }  
  
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  
    {  
    	UserService userservice = new UserService();
    	ArrayList<String> imgParams = new ArrayList <String>();//用来装每张图片的url,上传时间,和种id 
		String savePath = this.getServletConfig().getServletContext().getRealPath("");
		savePath = savePath + PATH;
		File f1 = new File(savePath);
		//这里接收了name的值
		String temp= request.getParameter("zhongId");
		if(temp!=null){
			SZhongId = request.getParameter("zhongId");
		}
		if(SZhongId==null){
			request.setAttribute("Error", "没有该种信息，请录入该种！");
			request.getRequestDispatcher("/jxapq/jsp/add_ap/add_tupian.jsp");
			return;
		}else{
			try{
				zhongId = Integer.parseInt(SZhongId);
			}catch(NumberFormatException e){
				request.setAttribute("Error", "没有该种信息，请录入该种！");
				request.getRequestDispatcher("/jxapq/jsp/add_ap/add_tupian.jsp");
			}
			
		}
		if (!f1.exists()) {
			f1.mkdirs();
		}
	
		DiskFileItemFactory fac = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fac);
		upload.setHeaderEncoding("utf-8");
		List fileList = null;
		try {
			fileList = upload.parseRequest(request);
		} catch (FileUploadException ex) {
			return;
		}
		Iterator<FileItem> it = fileList.iterator();
		String name = "";
		String extName = "";
		while (it.hasNext()) {
			FileItem item = it.next();
			if (!item.isFormField()) {
				name = item.getName();
				long size = item.getSize();
				String type = item.getContentType();
				if (name == null || name.trim().equals("")) {
					continue;
				}
	
				// 扩展名格式：
				if (name.lastIndexOf(".") >= 0) {
					extName = name.substring(name.lastIndexOf("."));
				}
	
				File file = null;
				do {
				
					// 生成文件名：
					name = UUID.randomUUID().toString();
					file = new File(savePath + name + extName);
					imgParams.add(name + extName);
				} while (file.exists());
	
				File saveFile = new File(savePath + name + extName);
				try {
					item.write(saveFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		response.getWriter().print(name + extName);
		@SuppressWarnings("unchecked")
		List<People> loginUser = (ArrayList<People>)request.getSession().getAttribute("userList");
		String user_id=null;
		if (loginUser != null)
			user_id = loginUser.get(0).getUser_id();
		try {
			userservice.addPicture(zhongId, imgParams,user_id);
		} catch (DBException e) {
			//e.printStackTrace();
		}
    }  
  
}  