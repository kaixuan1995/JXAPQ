package com.jxapq.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.codehaus.jackson.map.ObjectMapper;

import com.jxapq.dao.BaseDao;
import com.jxapq.dao.impl.BaseDAOImpl;
import com.jxapq.exception.DBException;
import com.jxapq.exception.UtilException;
import com.jxapq.po.Species;
import com.jxapq.service.UtilService;
import com.jxapq.service.util.FileUtils;
import com.jxapq.service.util.OutputUtil;
import com.jxapq.service.util.SimpleDocument;
import com.jxapq.service.util.UploadUtils;
import com.jxapq.service.util.WebResources;
import com.jxapq.service.util.WebStatisticsAnalyze;
import com.jxapq.servlet.util.LinkStringTool;
import com.jxapq.vo.Clazz;
import com.jxapq.vo.CountSpecies;
import com.jxapq.vo.Family;
import com.jxapq.vo.Fucus;
import com.jxapq.vo.ImportCondition;
import com.jxapq.vo.Kingdom;
import com.jxapq.vo.Linkage;
import com.jxapq.vo.Notice;
import com.jxapq.vo.Order;
import com.jxapq.vo.Phylum;
import com.jxapq.vo.Resources;


public class UtilServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String methodName = req.getParameter("method");				//获取方法名
		if(methodName == null || methodName.trim().isEmpty()) {
			throw new RuntimeException("没有传递操作方法");
		}
		Method method = null;
		try {
			method = UtilServlet.class.getDeclaredMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
		} catch (Exception e) {
			throw new RuntimeException("没有该方法");
		}
		try{
			String result = (String) method.invoke(this, req, resp);
			/*
			 * 返回值为空时，不做任何操作。
			 */
			if(result == null || result.trim().isEmpty()) {
				return ;
			}
			/*查看返回字符串是否包含冒号，没有表示转发。
			 * 如果有，切割前后字符串。
			 * 前缀如果是f，表示转发，如果是r表示重定向，后缀表示路径
			 */
			if(result.contains(":")) {
				int index = result.indexOf(":");  //冒号位置
				String qian = result.substring(0, index);
				String path = result.substring(index+1);
				if(qian.equalsIgnoreCase("f")) {
					req.getRequestDispatcher(path).forward(req, resp);
				} else if(qian.equalsIgnoreCase("r")) {
					resp.sendRedirect(req.getContextPath()+path);
				} else {
					throw new RuntimeException("暂不支持该操作");
				}
			} else {
				req.getRequestDispatcher(result).forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	private String Test(HttpServletRequest request, HttpServletResponse response) 
				throws IOException,ServletException {
		List list = new ArrayList();
		BaseDao baseDao = new BaseDAOImpl();
		String id = request.getParameter("value");			
		String sql = "select * from v_species2 a, v_tree_species b where a.species_id = " + id + " and a.species_id = b.id";
		System.out.println(sql+"2311111111");
		try {
			list = baseDao.queryBySQL(sql, Species.class, 0, 0);
		} catch (DBException e) {
			e.printStackTrace();
		}
System.out.println(list);
		
		String url = getServletContext().getRealPath("");
		try {
			new SimpleDocument().getSpeciesDoc(list, url, response);
		} catch (UtilException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	@SuppressWarnings("unused")
	private String output(HttpServletRequest request, HttpServletResponse response) throws DBException, UtilException, ClassNotFoundException, UnsupportedEncodingException {
		//得到视图VOName
		String voName = request.getParameter("voName");
		//属性Name
		String fieldName = request.getParameter("fieldName");
		// 得到一个属性值字符串，往下传
		String value = request.getParameter("value"); 
		//设置Content-Disposition
		//得到项目路径
		String url = getServletContext().getRealPath("");
		//通过voName生成excel文件，让别人下载
		String fileUrl = new UtilService().output(voName, fieldName,value, url);
		response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fileUrl, "UTF-8"));
        //读取文件  
		FileUtils.Output(fileUrl, response);
		return null;
	}

	//查询公告
	public String showNotices(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();		
		BaseDao baseDao = new BaseDAOImpl();
		String sql = "select * from t_notice";
		List<Notice> noticeList = null;
		try {
			noticeList = baseDao.queryBySQL(sql, Notice.class, 0, 0);
		} catch (DBException e) {
			e.printStackTrace();
		}
		String result = objectMapper.writeValueAsString(noticeList);
		resp.setContentType("text/script");
		resp.getWriter().print(result);
		return "";	
	}

	//显示站内资源
	public String showResource(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();	
		List<Resources> resourceList = null;
		try {
			resourceList =  WebResources.getResourcesInfor();
		} catch (UtilException e) {
			e.printStackTrace();
		}
		String result = objectMapper.writeValueAsString(resourceList);
		resp.setContentType("text/script");
		resp.getWriter().print(result);
		return "";	
	}
	
	//联动
		public String query(HttpServletRequest req, HttpServletResponse resp) 
				throws ServletException, IOException {
			String sql = "";
			ObjectMapper objectMapper = new ObjectMapper();	
			BaseDAOImpl base = new BaseDAOImpl();
			List<Linkage> list = null;
			String type = req.getParameter("type");
			if(type.equals("area")) {   //保护区
				sql = "select protection_id, protection_name from t_protection";
			} else if(type.equals("city")) { //市
				sql = "select town_id, town_name from t_town";
			} else if(type.equals("xian")) { //县
				String id = req.getParameter("id");
				sql = "select country_id, country_name from t_country, t_town where town_id_fk = town_id and town_name = '" + id + "'";
			} else if(type.equals("grage")) {
				String id = req.getParameter("id");
				String name = toPareme(id);
				sql = "select dictionary_id, dictionary_name from t_dictionary where category = '" + name + "' and type = 3";
			} else if(type.equals("men")) {  
				String id = req.getParameter("id");
				sql = "select phylum_id, phylum_cname from t_phylum where  kingdom_id_fk = " + id;
			} else if(type.equals("gang")) { 
				String id = req.getParameter("id");
				sql = "select class_id, class_cname from t_class where  phylum_id_fk = " + id;
			} else if(type.equals("mu")) {
				String id = req.getParameter("id");
				sql = "select order_id, order_cname from t_order where  class_id_fk = " + id;
			} else if(type.equals("ke")) {
				String id = req.getParameter("id");
				sql = "select family_id, family_cname from t_family where  order_id_fk = " + id;
			} else if(type.equals("shu")) {
				String id = req.getParameter("id");
				sql = "select fucus_id, fucus_cname from t_fucus where family_id_fk = " + id;
			}
			try {
				list = base.queryLinkage(sql);
			} catch (DBException e) {
				e.printStackTrace();
			}
			String result = objectMapper.writeValueAsString(list);
			resp.setContentType("text/script");
			resp.getWriter().print(result);
			
			return "";
		}
		
		private String toPareme(String str) {
			if(str.equals("species_coupro")) return "国家保护级别";
			else if(str.equals("species_iucn"))return "IUCN红色名录等级";
			else if(str.equals("species_credpro"))return "中国红色名录等级";
			else if(str.equals("species_provpro"))return "省保护级别";
			else if(str.equals("species_cites"))return "CITES保护等级";
			else if(str.equals("species_three"))return "三有物种";
			else if(str.equals("species_onlychina"))return "中国特有";
			else if(str.equals("species_resitype"))return "居留型";
			else return null;
		}
	
	//重新设置站内资源
	public String resetResources(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		WebResources webResource = new WebResources();
//		boolean flag = false;
		try {
			webResource.setResourcesInfor();
		} catch (UtilException e) {
			e.printStackTrace();
//			flag = false;
		}
//		resp.setContentType("text/script");
//		resp.getWriter().print("flag");
		return "";
	}
	
	//数据统计：
	public String statistics(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		WebStatisticsAnalyze webStatisAnalyze = new WebStatisticsAnalyze();
		String sql = webStatisAnalyze.analyzeParames(req);
System.out.println(sql);
		List<CountSpecies> list = null;			//物种信息
		try {
			list = new BaseDAOImpl().queryBySQL(sql, CountSpecies.class, 0, 0);
		} catch (DBException e) {
			req.setAttribute("message", "查询出错");
			req.getRequestDispatcher("/jsp/message.jsp").forward(req, resp);
		}
		req.setAttribute("list", list);
		List<String> idList = new ArrayList<String>();
		for(int i=0; i<list.size(); i++) {
			String id = list.get(i).getSpecies_id();
			idList.add(id);
		}
		req.getSession().setAttribute("idList", idList);
		return "f:jxapq/jsp/ap_data/tongji-result.jsp";
	}

	//统计结果导出excel， 查询结果导出world文档
	public String exportData(HttpServletRequest req, HttpServletResponse resp) 
			throws IOException, ServletException {
		//获取参数和试图名
		String parame = LinkStringTool.connectStr(req);
		String voName = req.getParameter("view");
		String value = req.getParameter("value");
		String path = null; 								//初始化文件路径
		/*
		 * value值为excel时，将结果导出excel，
		 * value为world时，将结果导出为world文档
		 */
		if(value.equals("excel")) {
			BaseDao baseDao = new BaseDAOImpl();
			List<Object> list = null;
			try {
				list = baseDao.query(parame, voName, "query", 0, 0);
			} catch (DBException e1) {
				req.setAttribute("message", "查询失败");
				req.getRequestDispatcher("/jsp/message.jsp").forward(req, resp);	
			}
			try {
				path = OutputUtil.output(list, "CountSpecies", req.getServletContext().getRealPath("/Outdoc"));
			} catch (UtilException e) {
				e.printStackTrace();
			}	
		} else if(value.equals("world")) {
			/*
			 * 
			 */
		}
		/*
		 * 将保存到服务器端的文件下载到客户端。
		 */
		String contentType = getServletContext().getMimeType(path);
		String contentDisposition = "attachment; filename=species.doc";
		resp.setHeader("content-Type", contentType);
		resp.setHeader("content-Disposition", contentDisposition);
		FileInputStream input = new FileInputStream(path);
		ServletOutputStream output = resp.getOutputStream();
		IOUtils.copy(input, output);
		/*
		 * 将已经下载到客户端的文件删除
		 */
		new File(path).delete();
		return null;
	}

	//导入Excel数据
	public String importData(HttpServletRequest  req, HttpServletResponse resp) {
		ImportCondition form=null;
		try{
			//在这里的form并没有使用标准的写法，这里而是采用了图方便的写法。
			form=UploadUtils.doUpload(req, req.getServletContext().getRealPath("/temp"));
			UtilService service=new UtilService();
			 form.toString();
			List<Integer> list=service.action(form.getVoName(), form.toString(), "inputdata");
			int hasInsertNum=list.get(0)-Integer.parseInt(form.getExcelBlankNum())-1;
			req.setAttribute("message", "成功插入"+hasInsertNum+"条数据");
			return "/QueryServlet?method=linkage&view=Linkage&forward="+form.getForward()+"&sign=false";
			//return "f:"+"/jxapq/jsp/add_ap/"+form.getForward()+".jsp";
		}catch(Exception e){
			req.setAttribute("message", e.getMessage());
			return "/QueryServlet?method=linkage&view=Linkage&forward="+form.getForward()+"&sign=false";
			/*return "f:"+"/jxapq/jsp/add_ap/"+form.getForward()+".jsp";*/
		}finally{
			File file=new File(form.getFile());
			file.delete();
		}
	}

	//下载模板
	public String downloadTemplate(HttpServletRequest  req, HttpServletResponse resp) {
		try{
			//得到要下载的文件名  uuid
			String filename = req.getParameter("filename");
			//filename = new String(filename.getBytes("iso8859-1"),"UTF-8");
			//找出这个文件  url    c:\\
			String path = this.getServletContext().getRealPath("/template");
			File file = new File(path + File.separator + filename);
			if(!file.exists()){
				req.setAttribute("message", "对不起，您要下载的资源已被删除");
				//req.getRequestDispatcher("/message.jsp").forward(req, resp);
				return "f:jxapq/template/message.jsp";
			}
			//得到文件的原始文件名
			String oldname = file.getName().substring(file.getName().indexOf("_")+1);
			
			String agent = req.getHeader("user-agent");
			resp.setContentType("application/x-download");
			if(agent.contains("Firefox"))
			    resp.addHeader("Content-Disposition","attachment;filename="+ new String(oldname.getBytes("UTF-8"),"ISO-8859-1"));
			else 
			    resp.addHeader("Content-Disposition","attachment;filename=" + URLEncoder.encode(oldname, "UTF-8"));
			//通知浏览器以下载方式打开下面发送的数据
			FileInputStream in = new FileInputStream(file);
			int len = 0;
			byte buffer[] = new byte[1024];
			OutputStream out = resp.getOutputStream();
			while((len=in.read(buffer))>0){
				out.write(buffer, 0, len);
			}
			in.close();
			return null;
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
	
	public String fenglei(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			String name = req.getParameter("name");
			String forword = null;
			String sql = null;
			List list = null;
			Class c = null;
			if(name.endsWith("属")) {
				forword = "f:/jxapq/jsp/ap_data/06-shu.jsp";
				sql = "select * from v_fucus where fucus_cname = '" + name + "'";
				c = Fucus.class;
			}
			else if(name.endsWith("科")) {
				forword = "f:/jxapq/jsp/ap_data/05-ke.jsp";
				sql = "select * from v_family where family_cname = '" + name + "'";
				c = Family.class;
			}
			else if(name.endsWith("目")) {
				forword = "f:/jxapq/jsp/ap_data/04-mu.jsp";
				sql = "select * from t_order where order_cname = '" + name + "'";
				c = Order.class;
			}
			else if(name.endsWith("纲")) {
				forword = "f:/jxapq/jsp/ap_data/03-gang.jsp";
				sql = "select * from t_class where class_cname = '" + name + "'";
				c = Clazz.class;
			}
			else if(name.endsWith("门")) {
				forword = "f:/jxapq/jsp/ap_data/02-men.jsp";
				sql = "select * from t_phylum where phylum_cname = '" + name + "'";
				c = Phylum.class;
			}
			else if(name.endsWith("界")) {
				forword = "f:/jxapq/jsp/ap_data/01-jie.jsp";
				sql = "select * from t_kingdom where kingdom_cname = '" + name + "'";
				c = Kingdom.class;
			}
			try {
				list = new BaseDAOImpl().queryBySQL(sql, c, 0, 0);
			} catch (DBException e) {	
				e.printStackTrace();
			}
			req.setAttribute("list", list);
			return forword;
}

}