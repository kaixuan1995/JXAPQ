package com.jxapq.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.jxapq.exception.DBException;
import com.jxapq.service.UpdateService;
import com.jxapq.servlet.util.AnaysisXmlTool;
import com.jxapq.servlet.util.LinkStringTool;
import com.jxapq.vo.People;

public class UpdateServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	String filePath = null;
	AnaysisXmlTool axt = null;
	String value = null;
	String viewName = null;
	String methodName = null;
	String serviceName = null;
	String forwardName = null;
	String user_id=null; 
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 读取xml，得到Control.xml的路径
		filePath = getServletContext().getRealPath(
				"/WEB-INF/classes/com/jxapq/config/Control.xml");
		// new 出工具类的对象引用
		axt = new AnaysisXmlTool(filePath);// 解析Control.xml工具
		// 得到一个属性值字符串，往下传
		value = LinkStringTool.connectStr(request);
		// 得到视图名，可以往下传
		viewName = request.getParameter("view");// 视图名
		// 得到操作方法，往下传
		methodName = request.getParameter("method");// 操作名
		// 根据viewName判断调用的service名
		serviceName = axt.getViewName(viewName, "serviceName");
		forwardName = axt.getViewName(viewName, "forward");// 根据viewName判断调用的要转发页面名
		
		@SuppressWarnings("unchecked")
		List<People> loginUser = (ArrayList<People>)request.getSession().getAttribute("userList");
		if (loginUser != null){
			user_id = loginUser.get(0).getUser_id();
		}
		try {
			Method method = this.getClass().getDeclaredMethod(methodName,
					HttpServletRequest.class, HttpServletResponse.class);
			method.invoke(this, request, response);
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			System.out.println("方法名没找到");
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}

	}
	
	
	@SuppressWarnings("unused")
	private void add(HttpServletRequest request,HttpServletResponse response) {

		boolean boo = false;
		try {
			boo = new UpdateService().action(viewName, value, "add",user_id);
			if(boo) {
				request.setAttribute("message", "添加信息成功");
			}else {
				request.setAttribute("message", "系统正忙，请稍后再试");
			}
			request.getRequestDispatcher(forwardName).forward(request, response);
		} catch (DBException e) {
			request.setAttribute("message", e.getMessage());
			try {
				request.getRequestDispatcher(forwardName).forward(request, response);
			} catch (ServletException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (ServletException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
	
	@SuppressWarnings("unused")
	private void add2(HttpServletRequest request,HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException {
		boolean boo = false;
		ObjectMapper mapper = new ObjectMapper();
		String result = "";
		int species_id =0;
		try {
			
			if("addZhongView".equals(viewName)){
				species_id = new UpdateService().addSpecies(viewName,value,user_id);

				if(species_id !=0) {
					request.getSession().setAttribute("species_id", species_id);
					result = mapper.writeValueAsString("添加信息成功");
				}else {
					result = mapper.writeValueAsString("系统正忙，请稍后再试");
				}
			}else {
				boo = new UpdateService().action(viewName, value, "add",user_id);
				if(boo) {
					result = mapper.writeValueAsString("添加信息成功");
				}else {
					result = mapper.writeValueAsString("系统正忙，请稍后再试");
				}
			}
		} catch (DBException e) {
			result = mapper.writeValueAsString(e.getMessage());
		} 
		response.setContentType("text/javascript;charset=utf-8");
		response.getWriter().print(result);
	}
	
	
	@SuppressWarnings("unused")
	private void delete(HttpServletRequest request,HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException {
		boolean boo = false;
		ObjectMapper mapper = new ObjectMapper();
		String result = "";
		try {
			boo = new UpdateService().action(viewName, value, "delete",user_id);
			if(boo) {
				result = mapper.writeValueAsString("删除信息成功");
			}else {
				result = mapper.writeValueAsString("系统正忙，请稍后再试");
			}
		} catch (DBException e) {
			result = mapper.writeValueAsString(e.getMessage());
		} 
		response.setContentType("text/javascript;charset=utf-8");
		response.getWriter().print(result);
	}
	
	
	@SuppressWarnings("unused")
	private void update(HttpServletRequest request,HttpServletResponse response) {
		boolean boo;
		try {
			boo = new UpdateService().action(viewName, value, "update",user_id);
			if(boo) {
				request.setAttribute("message", "更新信息成功");	
			}else {
				request.setAttribute("message", "系统正忙，请稍后再试");	
			}
			request.getRequestDispatcher(forwardName).forward(request, response);
		} catch (DBException e) {
			request.setAttribute("message", e.getMessage());	
			try {
				request.getRequestDispatcher(forwardName).forward(request, response);
			} catch (ServletException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
	}

}
