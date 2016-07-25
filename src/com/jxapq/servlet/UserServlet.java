package com.jxapq.servlet;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jxapq.servlet.util.AnaysisXmlTool;
import com.jxapq.servlet.util.DBbackupRecoverUtil;
import com.jxapq.servlet.util.EmailUtil;
import com.jxapq.servlet.util.LinkStringTool;
import com.jxapq.servlet.util.VerifyCode;
import com.jxapq.vo.People;
import com.jxapq.vo.User;

@SuppressWarnings("serial")
public class UserServlet extends HttpServlet {

	String filePath = null;
	AnaysisXmlTool axt = null;
	String value = null;
	String viewName = null;
	String methodName = null;
	String serviceName = null;
	String successName = null;
	String errorName = null;
	String fileRealPath = null;
	String user_id = null;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		filePath = getServletContext().getRealPath(
				"/WEB-INF/classes/com/jxapq/config/Control.xml");
		axt = new AnaysisXmlTool(filePath);// 解析Control.xml工具
		value = LinkStringTool.connectStr(request);
		viewName = request.getParameter("view");// 视图名
		methodName = request.getParameter("method");// 操作名
		serviceName = axt.getViewName(viewName, "serviceName");// 根据viewName判断调用的service名
		successName = axt.getViewName(viewName, "success");// 根据viewName判断调用的要转发页面名
		errorName = axt.getViewName(viewName, "error");// 根据viewName判断调用的要转发页面名
		List<People> loginUser = (ArrayList<People>)request.getSession().getAttribute("userList");
		if (loginUser != null)
			user_id = loginUser.get(0).getUser_id();
		
		// 调用不同的方法
		try {
			Method method = getClass().getDeclaredMethod(methodName,
					HttpServletRequest.class, HttpServletResponse.class);
			method.invoke(this, request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 登入
		public void login(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String vcode = request.getParameter("vcode");
			String validateCode = (String) request.getSession().getAttribute("validateCode");
			if(!vcode.equalsIgnoreCase(validateCode)){
				request.setAttribute("message", "验证码错误");
				System.out.println("登陆失败"+vcode+"+++"+validateCode);
				request.getRequestDispatcher("/jxapq/jsp/login.jsp").forward(request, response);
				return;
			}
			List list = invokeService();
			if(list==null||list.isEmpty()){
				request.setAttribute("message", "用户名或密码错误");
				System.out.println("登陆失败");
				request.getRequestDispatcher(errorName).forward(request, response);
				return;
			}
			
			if((list.get(0)) instanceof User){
				User user = (User) list.get(0);
				if(user.getUser_type()==0){
					request.setAttribute("message", "你还不是vip,请注册！");
					request.getRequestDispatcher(errorName).forward(request, response);
					return;
				}
				request.getSession().setAttribute("type", user.getUser_type());
			}
			
			request.getSession().setAttribute("userList", list);
			request.getRequestDispatcher(successName).forward(request, response);
		}
	// 注册
	public void register(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		value = emailCodeCheck(request, value, 0);// 0代表发送激活链接
		if(value.equals("false")){
			request.setAttribute("message", "激活码发送失败，系统异常");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		List list = invokeService();
		if(!(Boolean) list.get(0)){
			request.setAttribute("message", "注册失败，系统异常");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.getRequestDispatcher(successName).forward(request, response);
		
	}

	// 激活邮箱
	public void activeEmail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List list = invokeService();
		if(!(Boolean) list.get(0)){
			request.setAttribute("message", "激活失败，系统异常");
			System.out.println("激活失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.getRequestDispatcher(successName).forward(request, response);
	}

	// 查询个人信息
	public void queryUserInfo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<User> list = invokeService();//如果异常肯定是session过期，由拦截器处理
		request.getSession().setAttribute("userList", list);
		request.getRequestDispatcher(successName).forward(request, response);
	}

	// 修改个人信息
	public void alterInfo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List list = invokeService();
		if(!(Boolean) list.get(0)){
			request.setAttribute("message", "查询失败，系统异常");
			System.out.println("查询失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		List<User> user = (List<User>) request.getSession().getAttribute(
				"userList");
		request.setAttribute("user_id", user.get(0).getUser_id());
		request.getRequestDispatcher(successName).forward(request, response);
	}

	// 修改邮箱验证吗
	public void alterCode(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("发送邮箱验证码中~~~");
		value = emailCodeCheck(request, value, 1);// 1代表验证码
		if (value.equals("false")) {
			response.getWriter().print("0");// 失败
			return;
		} else {
			response.getWriter().print("1");// 验证码发送成功
		}
		List list = invokeService();
		if(!(Boolean) list.get(0)){
			request.setAttribute("message", "邮件发送失败，系统异常");
			System.out.println("邮件发送失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
	}
	// 修改邮箱
	public void queryEmail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("#w#user_id =");
		String user_email = request.getParameter("#s#user_email =");
		String user_code = request.getParameter("#w#user_code =");
		value = "user_code =?user_id =?%+%"+user_code + "#%$#" + user_id;
		System.out.println("替换后的字符串：" + value);
		List<User> list = invokeService();
		if (list.toString().equals("[]")) {
			System.out.println("邮箱错误！");
			request.getRequestDispatcher(errorName).forward(request, response);
		} else {
			alterEmail(request, response, user_email, user_id,user_code);
		}
	}

	//这个还有问题，应该是先根据邮箱和验证码查询出来然后再修改邮箱，不能根据邮箱和验证码直接修改邮箱
	public void alterEmail(HttpServletRequest request,
			HttpServletResponse response, String user_email,
			String user_id, String user_code) throws ServletException, IOException {
		value = "#s#user_email =?#w#user_id =?#w#user_code =?%+%" + user_email + "#%$#"
				+ user_id+"#%$#"+user_code;
		methodName = "alterEmail";
		System.out.println("视图名" + viewName);
		List list = invokeService();
		if(list==null||!(Boolean) list.get(0)){
			request.setAttribute("message", "修改失败，系统异常");
			System.out.println("修改失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		List<User> user = (List<User>) request.getSession().getAttribute(
				"userList");
		request.setAttribute("user_id", user.get(0).getUser_id());
		request.getRequestDispatcher(successName).forward(request, response);
	}

	// 修改密码第一步，查询密码
	public void queryPassword(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("#w#user_id =");
		String oldPassword = request.getParameter("#w#user_password =");
		String newpassword = request.getParameter("#s#user_alter_password =");
		value = "user_password =?user_id =?%+%" + oldPassword + "#%$#"
				+ user_id;
		System.out.println("替换后的字符串：" + value+"   viewName:"+viewName);
		List<User> list = invokeService();
		if (list==null||list.toString().equals("[]")) {
			System.out.println("密码错误！");
			request.getRequestDispatcher(errorName).forward(request, response);
		} else {
			alterPassword(request, response, newpassword, user_id);
		}
	}

	// 修改密码
	public void alterPassword(HttpServletRequest request,
			HttpServletResponse response, String newpassword, String user_id)
			throws ServletException, IOException {
		value = "#s#user_password =?#w#user_id =?%+%" + newpassword + "#%$#"
				+ user_id;
		methodName = "alterPassword";
		System.out.println("视图名" + viewName);
		List list = invokeService();
		if(!(Boolean) list.get(0)){
			request.setAttribute("message", "查询无结果");
			System.out.println("修改失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		@SuppressWarnings("unchecked")
		List<User> user = (List<User>) request.getSession().getAttribute(
				"userList");
		request.setAttribute("user_id", user.get(0).getUser_id());
		request.getRequestDispatcher(successName).forward(request, response);
	}

	// 工作人员查询信息
	public void queryVip(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
//		System.out.println(value);
//		if(value.contains("all")){
//			System.out.println(value.contains("all"));
//			value=(value.replace("all", "0#%$#1")).replace("user_type =?", "user_type =?user_type =?");
//			System.out.println(value+"选择了全部的vip的情况");
//		}
		List<User> list = invokeService();
		if(list.toString().equals("[]")){
			request.setAttribute("message", "查询无结果");
			System.out.println("查询失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.setAttribute("vipList", list);
		request.getRequestDispatcher(successName).forward(request, response);
	}

	// 系统管理员查询信息
	public void queryWorker(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<User> list = invokeService();
		if(list.toString().equals("[]")){
			request.setAttribute("message", "查询无结果");
			System.out.println("查询失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.setAttribute("workerList", list);
		request.getRequestDispatcher(successName).forward(request, response);
	}
	// 系统管理员查询所有工作人员信息（另开一个函数是为了在voSql.xml文件的连接or）
		public void queryAllWorker(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			List<User> list = invokeService();
			if(list.toString().equals("[]")){
				request.setAttribute("message", "查询无结果");
				System.out.println("查询失败，系统异常！");
				request.getRequestDispatcher(errorName).forward(request, response);
				return;
			}
			request.setAttribute("workerList", list);
			request.getRequestDispatcher(successName).forward(request, response);
		}
		
	

	// 审核vip
	public void agreeVip(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("审核通过" + value);
		List list = invokeService();
		if(!(Boolean) list.get(0)){
			request.setAttribute("message", "操作失败");
			System.out.println("审核失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.setAttribute("message", "操作成功");
		methodName = "queryVip";
		viewName = "queryVipView";
		value = "user_type =?%+%0";
		queryVip(request, response);
	}

	// 管理员添加公告
	public void addNotice(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List list = invokeService();
		if(!(Boolean) list.get(0)){
			request.setAttribute("message", "添加失败");
			System.out.println("激活失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.setAttribute("message", "添加公告成功");
		methodName = "queryNotice";
		viewName = "queryNoticeView";
		value = "1 =?%+%1";
		queryNotice(request, response);
	}

	// 显示公告
	public void queryNotice(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List list = invokeService();
		if(list.toString().equals("[]")){
			request.setAttribute("message", "查询无结果");
			System.out.println("查询失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.setAttribute("noticeList", list);
		request.getRequestDispatcher(successName).forward(request, response);
	}

	// 删除公告
	public void delNotice(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List list = invokeService();
		if(list==null||!(Boolean) list.get(0)){
			request.setAttribute("message", "删除失败，系统异常");
			System.out.println("删除失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.setAttribute("message", "删除公告成功");
		methodName = "queryNotice";
		viewName = "queryNoticeView";
		value = "1 =?%+%1";
		queryNotice(request, response);
	}

	// 添加工作人员
	public void addWorker(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List list = invokeService();
		if(!(Boolean) list.get(0)){
			request.setAttribute("message", "添加失败");
			System.out.println("添加失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.setAttribute("message", "添加工作人员成功");
		request.getRequestDispatcher(successName).forward(request, response);
	}

	// 删除工作人员
	public void delWorker(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List list = invokeService();
		if(!(Boolean) list.get(0)){
			request.setAttribute("message", "删除失败");
			System.out.println("删除失败，系统异常！");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.setAttribute("message", "删除工作人员成功");
		methodName = "queryWorker";
		viewName = "queryWorkerView";
		value = "1 =?%+%1";
		queryWorker(request, response);
		request.getRequestDispatcher(successName).forward(request, response);
	}
	// 数据库备份
	public void backupDB(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		DBbackupRecoverUtil backup = new DBbackupRecoverUtil();
		String dbFileName = null;
		dbFileName = backup.backup();//数据库备份，并返回备份的到的地址

		response.setHeader("content-disposition", "attachment;filename="
				+ URLEncoder.encode(dbFileName, "UTF-8"));
		// 读取要下载的文件，保存到文件输入流
		FileInputStream in = new FileInputStream(dbFileName);
		// 创建输出流
		OutputStream out = response.getOutputStream();
		// 创建缓冲区
		byte buffer[] = new byte[1024];
		int len = 0;
		// 循环将输入流中的内容读取到缓冲区当中
		while ((len = in.read(buffer)) > 0) {
			// 输出缓冲区的内容到浏览器，实现文件下载
			out.write(buffer, 0, len);
		}
		// 关闭文件输入流
		in.close();
		// 关闭输出流
		out.close();
	}

	/**
	 * 上传sql到服务器，为数据的还原做准备
	 */
	public void uploadSqlFile(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// if(!fileRealPath.equals("")){
		 fileRealPath = null;
		// // }
		// FileUploadUtil fileupload = new FileUploadUtil();
		// fileRealPath = fileupload.fileUpload(request, response);
		// request.setAttribute("message","上传成功，请开始备份" );
		// request.getRequestDispatcher(successName).forward(request, response);

		// // 得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
		String savePath = this.getServletContext().getRealPath(
				"/WEB-INF/upload");
		// String savePath = request.getContextPath()+"/WEB-INF/upload";
		File file = new File(savePath);
		// 判断上传文件的保存目录是否存在
		if (!file.exists() && !file.isDirectory()) {
			System.out.println(savePath + "目录不存在，需要创建");
			// 创建目录
			file.mkdir();
		}
		// 消息提示
		String message = "";
		try {
			// 使用Apache文件上传组件处理文件上传步骤：
			// 1、创建一个DiskFileItemFactory工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 2、创建一个文件上传解析器
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 解决上传文件名的中文乱码
			upload.setHeaderEncoding("UTF-8");
			// 3、判断提交上来的数据是否是上传表单的数据
			if (!ServletFileUpload.isMultipartContent(request)) {
				// 按照传统方式获取数据
				return;
			}
			// 4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem item : list) {
				// 如果fileitem中封装的是普通输入项的数据
				if (item.isFormField()) {
					String name = item.getFieldName();
					// 解决普通输入项的数据的中文乱码问题
					String value = item.getString("UTF-8");
					// value = new String(value.getBytes("iso8859-1"),"UTF-8");
				} else {// 如果fileitem中封装的是上传文件
						// 得到上传的文件名称，
					String filename = item.getName();
					System.out.println(filename);
					if (filename == null || filename.trim().equals("")) {
						continue;
					}
					// 注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：
					// c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
					// 处理获取到的上传文件的文件名的路径部分，只保留文件名部分
					filename = filename
							.substring(filename.lastIndexOf("\\") + 1);
					// 获取item中的上传文件的输入流
					fileRealPath = savePath +"\\"+ filename;// 这是文件的保存的真实路径
					System.out.println(fileRealPath + "[真实的路径]");
					InputStream in = item.getInputStream();
					// 创建一个文件输出流
					FileOutputStream out = new FileOutputStream(savePath + "\\"
							+ filename);
					// 创建一个缓冲区
					byte buffer[] = new byte[1024];
					// 判断输入流中的数据是否已经读完的标识
					int len = 0;
					// 循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
					while ((len = in.read(buffer)) > 0) {
						// 使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\"
						// + filename)当中
						out.write(buffer, 0, len);
						System.out.println(len);
					}
					// 关闭输入流
					in.close();
					// 关闭输出流
					out.close();
					// 删除处理文件上传时生成的临时文件
//					item.delete();
					message = "文件上传成功！";
					request.setAttribute("message", message);
					request.getRequestDispatcher(successName).forward(request, response);
				}
			}
		} catch (Exception e) {
			message = "文件上传失败！";
			request.setAttribute("message", message);
			request.getRequestDispatcher(successName).forward(request, response);
		}
	}

	/**
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void recover(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if (fileRealPath==null) {
			request.setAttribute("message", "请你先上传你要还原的sql文件");
			request.getRequestDispatcher(successName)
					.forward(request, response);
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
//		fileRealPath ="D:\\tomcat\\apache-tomcat-7.0.42\\apache-tomcat-7.0.42\\webapps\\JXAPQ\\WEB-INF\\upload\\newdatabase.sql";
		DBbackupRecoverUtil backup = new DBbackupRecoverUtil();
		backup.restore(fileRealPath);
		request.setAttribute("message", "数据库还原成功");
		request.getRequestDispatcher(successName).forward(request, response);
		return;
	}

	// 忘记密码第一步，输入用户名
	public void forgetpass1(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String vcode = request.getParameter("vcode");
		String validateCode = (String) request.getSession().getAttribute("validateCode");
		if(!vcode.equalsIgnoreCase(validateCode)){
			request.setAttribute("message", "验证码错误");
			System.out.println("登陆失败"+vcode+"+++"+validateCode);
			request.getRequestDispatcher("/jxapq/jsp/wangjimima01.jsp").forward(request, response);
			return;
		}
		System.out.println("忘记密码第一步:" + value);
		List<User> list = invokeService();
		if(list.toString().equals("[]")){
			request.setAttribute("message", "该用户不存在");
			System.out.println("没有该用户");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.setAttribute("user_id", list.get(0).getUser_id());
		request.setAttribute("user_email", list.get(0).getUser_email());
		request.getRequestDispatcher(successName).forward(request, response);
	}

	// 忘记密码第二步，获取验证码，校验验证码
	public void forgetpass2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("忘记密码第二步:" + value);
		String code = request.getParameter("user_code =");
		List<User> list = invokeService();
		if("".equals(code)||list.toString().equals("[]")){
			request.setAttribute("message", "验证码错误");
			System.out.println("验证码错误");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.setAttribute("user_id", list.get(0).getUser_id());
		request.setAttribute("user_email", list.get(0).getUser_email());
		request.setAttribute("user_code", list.get(0).getUser_code());
		request.getRequestDispatcher(successName).forward(request, response);
	}

	// 忘记密码第三步
	public void forgetpass3(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("忘记密码第三步:" + value);
		String code = request.getParameter("#s#user_password =");
		if("".equals(code)){
			request.setAttribute("message", "修改失败，请重试");
			System.out.println("修改失败，请重试");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		List list = invokeService();
		if(!(Boolean)list.get(0)){
			request.setAttribute("message", "修改失败，请重试");
			System.out.println("修改失败，请重试");
			request.getRequestDispatcher(errorName).forward(request, response);
			return;
		}
		request.setAttribute("message", "修改成功");
		request.getRequestDispatcher(successName).forward(request, response);
	}

	// 服务器异步校验
	public void check(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		System.out.println(value+"[][][][][][]");
		List list = invokeService();
		if(!list.toString().equals("[]")){
			response.getWriter().print(1);//已经存在
		}else{
			response.getWriter().print(0);//不存在
		}
	}

	// 退出
	public void exit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		request.getRequestDispatcher(successName).forward(request, response);
	}
	//登陆忘记密码验证码
	public void validateCode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VerifyCode vc = new VerifyCode();
		BufferedImage image = vc.getImage();
		request.getSession().setAttribute("validateCode", vc.getText());
		VerifyCode.output(image, response.getOutputStream());
		System.out.println("验证码："+vc.getText());
	}
	// 反射调用service方法
	private List invokeService() {
		Class<?> clazz;
		try {
			clazz = Class.forName(serviceName);
			
			System.out.println("serviceName:"+serviceName);
			Method actionMethod = clazz.getMethod("action", String.class,
					String.class, String.class, String.class);
			
			System.out.println("actionMethod:"+actionMethod.getName()+"   userid:"+user_id);
			
			List list = (List) actionMethod.invoke(clazz.newInstance(),
					viewName, value, methodName, user_id);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 邮箱发送验证码
	private String emailCodeCheck(HttpServletRequest request, String value,
			int type) {
		String user_id = request.getParameter("user_id =");
		String user_email = request.getParameter("user_email =");
		String code = (int) ((Math.random() * 9 + 1) * 100000) + "";
		EmailUtil emailUtil = new EmailUtil(user_id, user_email, code);
		if (type == 0) {// 0代表发送激活链接
			if (emailUtil.send(type) == true) {
				value = "user_code =?" + value;
				value = value.replace("%+%", "%+%" + code + "#%$#");
				// System.out.println("处理之后的字符串："+value);
				return value;
			} else {
				return "false";
			}
		} else if (type == 1) {// 1代表验证码
			if (emailUtil.send(type) == true) {
				value = "#s#user_code =?" + value;
				value = value.replace("%+%", "%+%" + code + "#%$#");
				value = value.replace("user_id", "#w#user_id");
				value = value.replace("user_email =?", "");
				value = value.replace("#%$#" + user_email, "");
				System.out.println("处理之后的字符串：" + value);
				return value;
			} else {
				return "false";
			}
		} else {
			return "false";
		}
	}

}