package com.jxapq.service.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jxapq.exception.UtilException;
import com.jxapq.vo.ImportCondition;

//上传型表单，本来可以写成框架，算了，懒得写了。
public class UploadUtils {
	//上传Excel临时文件
	

	public static ImportCondition doUpload(HttpServletRequest request,String path) throws UtilException{
		return doUpload(request, path,false);
	}
	/**
	 * @param request	接收上传请求。
	 * @param path		指定将上传文件保存在哪个目录下。
	 * @param isCreate	指定要在path目录下生成hash多层目录结构，为true时，生成。
	 * @return
	 * @throws UtilException
	 */
	public static ImportCondition doUpload(HttpServletRequest request,String path,boolean isCreate) throws UtilException{
		boolean flag=false;
		ImportCondition bean=new ImportCondition();
		String realPath = null;
		List<String> types=Arrays.asList("xls","xlsx");
		DiskFileItemFactory factory=new DiskFileItemFactory();
		//设置临时文件目录
		factory.setRepository(new File(request.getServletContext().getRealPath("/temp")));
		ServletFileUpload upload=new ServletFileUpload(factory);
		//解决文件的乱码
		upload.setHeaderEncoding("UTF-8");
		//设置单个文件最大上传大小为500M
		upload.setFileSizeMax(1024*1024*500);
		//限定文件上传的类型
		//解析request请求对象。
		List<FileItem> fileItems;
		try {
			fileItems = upload.parseRequest(request);
		//遍历所有的提交项
			for(FileItem fileItem:fileItems){
				if(!fileItem.isFormField()){
					String name=fileItem.getFieldName();
					//代表当前处理的item里面封装的是上传文件
					//IE6获得的名字将会是绝对路径，现在的都只是单文件名。
					String fileName=fileItem.getName().substring(fileItem.getName().lastIndexOf("\\")+1);
					if(fileName==null||fileName.equals("")){
						throw new UtilException("文件不能为空！");
					}
					String ext=fileName.substring(fileName.lastIndexOf(".")+1);
					if(!types.contains(ext)){
						throw new UtilException("文件格式错误");
					}
					String uuidname=generateUUIDName(fileName);
					//读取表单传过来的文件
					InputStream in=fileItem.getInputStream();
					int len=0;
					byte[] bt=new byte[1024];
					if(isCreate){
						realPath=generateMultiSavePath(path, uuidname);
						realPath=realPath+"\\"+uuidname;
					}else{
						realPath=path+"\\"+uuidname;
					}
					BeanUtils.setProperty(bean, name,realPath);
					FileOutputStream fos=new FileOutputStream(realPath);
					//将读取的数据写出到文件夹中。
					while((len=in.read(bt))>0){
						fos.write(bt, 0, len);
					}
					fos.close();
					in.close();
					fileItem.delete();//删除临时文件。
				}else{
					String name = fileItem.getFieldName();  //username=aaa  description=bbb
					String value = fileItem.getString("UTF-8");
					BeanUtils.setProperty(bean, name, value);
				}
			}
		}catch (Exception e) {
			throw new UtilException(e);
		}
		return bean;
	}
	//生成fileName的UUID名。
	private static String generateUUIDName(String fileName){
		String ext=fileName.substring(fileName.indexOf(".")+1);
		return UUID.randomUUID().toString()+"."+ext;
	}
	private static String generateMultiSavePath(String path,String filename){
		int hashcode = filename.hashCode();  //121221
		int dir1 = hashcode&15;
		int dir2 = (hashcode>>4)&0xf;
		String savepath = path + File.separator + dir1 + File.separator + dir2;
		File file = new File(savepath);
		if(!file.exists()){
			file.mkdirs();
		}
		return savepath;
	}
}

