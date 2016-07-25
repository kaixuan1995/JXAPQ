package com.jxapq.servlet;

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.dom4j.Document;
import org.dom4j.Element;

import com.google.gson.Gson;
import com.jxapq.dao.BaseDao;
import com.jxapq.dao.impl.BaseDAOImpl;
import com.jxapq.dao.util.DBUtil;
import com.jxapq.exception.DBException;
import com.jxapq.exception.UtilException;
import com.jxapq.service.util.XmlUtils;
import com.jxapq.servlet.util.LinkStringTool;
import com.jxapq.servlet.util.ServletParseXML;
import com.jxapq.vo.Linkage;
import com.jxapq.vo.Sample;
import com.jxapq.vo.Searcher;
import com.jxapq.vo.SelNode;
import com.jxapq.vo.SimpleInfo;
import com.jxapq.vo.TreeNode;


@SuppressWarnings("all")
public class QueryServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(null == request.getParameter("method") || "".equals(request.getParameter("method"))) {
			search(request, response);
			return;
		}
		try {
			String method = request.getParameter("method");// 操作名
			Method m = QueryServlet.class.getDeclaredMethod(method,HttpServletRequest.class, HttpServletResponse.class);	
			m.invoke(this, request, response);	
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BaseDao base = new BaseDAOImpl();
		String success = "", fail = "";
		String viewName = request.getParameter("view");// 视图名
		Element e = null;
		try {	
			String value = LinkStringTool.connectStr(request);
			Document d = XmlUtils.getDocument("com/jxapq/config/query.xml");
			e = d.getRootElement();
			success = e.element(viewName).attributeValue("success");
			List<Object> list = base.query(value, viewName, "query", 0, 0);
			request.setAttribute("list", list);
			if(viewName.equals("index_generalquery")){
				request.getSession().setAttribute("list", list);
			}
			request.getRequestDispatcher(success).forward(request, response);
		} catch (UtilException e1) {
			fail = e.element(viewName).attributeValue("fail");
			request.setAttribute("message", "查询失败");
			request.getRequestDispatcher(fail).forward(request, response);
		} catch (DBException e2) {
			request.setAttribute("message", "查询失败");
			request.getRequestDispatcher(fail).forward(request, response);
		}
	}
	
	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//((ServletRequest) response).setCharacterEncoding("UTF-8");
			String key = request.getParameter("q");
			//key = new String(key.getBytes("iso8859-1"),"UTF-8");
			List<Searcher> list = new ArrayList();
			//从数据库中得到数据
			Connection conn = DBUtil.getConnection();
			String sql = 
"select cname as name, count(cname) count from v_publicname where cname like ? or cname like ? group by cname union " +
"select sname as name, count(sname) count from v_publicname where sname like ? or sname like ? group by sname union " +
"select ename as name, count(ename) count from v_publicname where ename like ? or ename like ? group by ename union " +
"select spelling as name, count(cname) count from v_publicname where spelling like ? or spelling like ? group by spelling union " +
"select cname as name, count(cname) count from v_publicname where commoninfo like ? or commoninfo like ? group by commoninfo";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, key+"%");
			ps.setString(2, "%"+key+"%");
			ps.setString(3, key+"%");
			ps.setString(4, "%"+key+"%");
			ps.setString(5, key+"%");
			ps.setString(6, "%"+key+"%");
			ps.setString(7, key+"%");
			ps.setString(8, "%"+key+"%");
			ps.setString(9, key+"%");
			ps.setString(10, "%"+key+"%");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Searcher searcher = new Searcher();
				searcher.setName(rs.getString("name"));
				searcher.setCount(rs.getInt("count"));
				list.add(searcher);
			}
			List<String[]> gson = new ArrayList<String[]>();
			
			//把数据组装成一个Json串
			for(Searcher search : list){
				gson.add(new String[]{search.getName(),search.getCount()+""});
			}
			String result = new Gson().toJson(gson);  //google的api，把集合中的数据组装成一个json串
			//写给客户机
			//((ServletRequest) response).setCharacterEncoding("UTF-8");
			response.setContentType("test/html;charset=UTF-8");
			response.getWriter().write("KISSY.Suggest.callback({'result':"+result+"})");  
		
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "出错了");
			request.getRequestDispatcher("/jxapq/jsp/message.jsp").forward(request, response);
			return;
		}
	}
	
	private void indexquery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String key = request.getParameter("key");				
			List<SimpleInfo> list = new ArrayList<SimpleInfo>();
			//从数据库中得到数据
			Connection conn = DBUtil.getConnection();
			String sql = "select * from v_publicname where sname like ? or cname like ? or ename like ? or spelling like ? or commoninfo like ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+key+"%");			
			ps.setString(2, "%"+key+"%");			
			ps.setString(3, "%"+key+"%");			
			ps.setString(4, "%"+key+"%");			
			ps.setString(5, "%"+key+"%");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				SimpleInfo si = new SimpleInfo();
				si.setCname(rs.getString("cname"));
				si.setSname(rs.getString("sname"));
				si.setView(rs.getString("view"));
				si.setId(rs.getString("id"));
				si.setPid(rs.getString("pid"));
				list.add(si);
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("/jxapq/jsp/show.jsp").forward(request, response);
			return;	
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "出错了");
			request.getRequestDispatcher("/jxapq/jsp/message.jsp").forward(request, response);
			return;
		}
	}
	
	
	private void tree(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		BaseDao base = new BaseDAOImpl();
		String value = LinkStringTool.connectStr(request);
		String viewName = request.getParameter("view");// 视图名

		try {
			List<Object> list = base.query(value, viewName, "query", 0, 0);
			if(viewName.equals("treeclass")) {
				list.addAll(base.query(value, viewName + 2, "query", 0, 0));
			}
			List jsonList = new ArrayList();
			for(int i = 0; i < list.size(); i++) {
				SimpleInfo info = (SimpleInfo) list.get(i);
				TreeNode tn = new TreeNode();
				tn.setResourceID(info.getId());
				tn.setResourceName(info.getCname() + " : " + info.getSname());
				tn.setParentID(info.getPid());
				String viewid = info.getView();
				if(info.getView().equals("subclass")) {
					viewid = "class";
				}
				tn.setAccessPath(request.getContextPath() + "/QueryServlet" + "?" 
+ viewid + "_id%20%3d=" + info.getId() + "&view=" + info.getView() + "&method=query");		
				boolean flag = false;
				if(!info.getView().equals("species")) {
					List l = base.query("pid =?%+%" + info.getId() , info.getView() + "childs", "query", 0, 0);
					if(info.getView().equals("class")) {
						l.addAll(base.query("pid =?%+%" + info.getId() , info.getView() + "childs2", "query", 0, 0));
					}
					if(l.size() != 0) {					
						flag = true;
					}
				}		
				tn.setIsParent(flag);
				tn.setView(info.getView());
				tn.setResourceType(1);
				jsonList.add(tn);
			}
			String jsonStr = JSONArray.fromObject(jsonList).toString();
			response.getWriter().print(jsonStr);
		} catch (DBException e) {
			request.setAttribute("message", "出错了");
			request.getRequestDispatcher("/jxapq/jsp/message.jsp").forward(request, response);
		}
	}
	
	
	private void highquery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			String[] sel2 = new String[]{"地理分布型","国家保护级别","IUCN红色名录等级","省保护级别","中国红色名录等级",
					"CITES保护等级","区系类型","居留型","省内分布","中国特有","三有物种","饲养状况"};
			String[] sel3 = new String[]{"国家保护级别","IUCN红色名录等级","省保护级别","中国红色名录等级",
					"CITES保护等级","区系类型","生活型","省内分布","中国特有","引种栽培"};
			hquery(request, "2", sel2);
			hquery(request, "3", sel3);
			request.getRequestDispatcher("/jxapq/jsp/ap_data/gaojijiansuo.jsp").forward(request, response);
			 return;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.release();
		}
	}
	
	private void hquery(HttpServletRequest request, String type, String[] sel)
			throws SQLException {
		Map map = new HashMap();
		Connection conn = DBUtil.getConnection();
		for(int i = 0; i < sel.length; i++) {
			map.put(sel[i], new ArrayList());
		}
		String sql = "select * from t_dictionary where type = " + type;
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.execute();
		ResultSet rs = ps.getResultSet();
		while(rs.next()) {
			String category = rs.getString("category").trim();
			for(int i = 0; i < sel.length; i++) {
				if(category.equalsIgnoreCase(sel[i])) {
					SelNode node = new SelNode();
					node.setId(rs.getInt("dictionary_id"));
					node.setpId(0);
					node.setName(rs.getString("dictionary_name"));
					node.setIsParent("false");
					List list = (List) map.get(sel[i]);
					list.add(node);
				}
			}	
		}
		sql = "select town_id as id, town_name as name, 0 as pId, 'true' as isParent from t_town union select country_id as id, country_name as name, town_id_fk as pid, 'false' as isParent from t_country";
		ps.execute(sql);
		rs = ps.getResultSet();
		while(rs.next()) {
			SelNode node = new SelNode();
			node.setId(rs.getInt("id"));
			node.setpId(rs.getInt("pid"));
			node.setName(rs.getString("name"));
			node.setIsParent(rs.getString("isParent"));
			List list = (List) map.get("省内分布");
			list.add(node);
		}
		if(type.trim().equals("3")) {
			sql = "select reginal_id as id, reginal_name as name, 0 as pId, 'true' as isParent  from t_reginal " +
					" union select subreginal_id as id, subreginal_name as name, reginal_id_fk as pid, 'false' as isParent  from t_subreginal where subreginal_type = " + type;
		} else {
			sql = "select subreginal_id as id, subreginal_name as name, reginal_id_fk as pid, 'false' as isParent  from t_subreginal where subreginal_type = " + type;
		}
		ps.execute(sql);
		rs = ps.getResultSet();
		while(rs.next()) {
			SelNode node = new SelNode();
			node.setId(rs.getInt("id"));
			node.setpId(rs.getInt("pid"));
			node.setName(rs.getString("name"));
			node.setIsParent(rs.getString("isParent"));
			List list = (List) map.get("区系类型");
			list.add(node);
		}
		 Set keys = map.keySet();
		 Iterator it = keys.iterator();
		 while(it.hasNext()) {
			 String key = (String) it.next();
			 List list = (List) map.get(key);
			 String jsonStr = JSONArray.fromObject(list).toString();
			 request.setAttribute(key + type, jsonStr);
		 }
	}

	
	@SuppressWarnings("unused")
	private void linkage(HttpServletRequest request, HttpServletResponse response)
			throws UtilException, ServletException, IOException {

		BaseDao base = null;
		String value = null;
		String viewName = null;
		String methodName = null;
		String sql;
		String forward = null;
		base = new BaseDAOImpl();
		
		value = LinkStringTool.connectStr(request);
		viewName = request.getParameter("view");// 视图名
		methodName = request.getParameter("method");// 操作名
		
		// 为显示界的信息做贮备
		try {
			if ("Linkage".equals(viewName)) {
				String tableName = ServletParseXML.getInfo(viewName, "tableName");
				String id = ServletParseXML.getInfo(viewName, "id");
				String name = ServletParseXML.getInfo(viewName, "name");
				sql = "select " + id + ", " + name + " from " + tableName;
				List<Linkage> list = null;
				try {
					list = base.queryLinkage(sql);
				} catch (DBException e) {
					
				}
				request.setAttribute("list", list);
			}
			// 判断界面是否需要得到区系类型的信息
			if ("true".equals(request.getParameter("sign"))) {
				getReginal(request);
				getSubrReginal(request);
			}else if("protection".equals(request.getParameter("sign"))) {
				getProtection(request);
			}else if("dynamic".equals(request.getParameter("sign"))) {
				String flag = request.getSession().getAttribute("type")+"";
				getDynamic(request,flag);
			}else if("town".equals(request.getParameter("sign"))) {
				town(request);
			}else if("yazhong".equals(request.getParameter("sign"))) {
				getSubspecies_Sign(request);
			}

			forward = request.getParameter("forward");
			// 为添加种做准备
			if ("add_zhong".equals(forward)) {
				String type = request.getSession().getAttribute("type")+"";
				getInfor(request,type);
			}
			request.getRequestDispatcher(
					"/jxapq/jsp/add_ap/" + forward + ".jsp").forward(request,
					response);
		} catch (ServletException e) {
			request.setAttribute("message", "系统正忙，请稍后再试");
			request.getRequestDispatcher(
					"/jxapq/jsp/add_ap/" + forward + ".jsp").forward(request,
					response);
		} catch (IOException e) {
			request.setAttribute("message", "系统正忙，请稍后再试");
			request.getRequestDispatcher(
					"/jxapq/jsp/add_ap/" + forward + ".jsp").forward(request,
					response);
		} catch (DBException e) {
			request.setAttribute("message", e.getMessage());
			request.getRequestDispatcher(
					"/jxapq/jsp/add_ap/" + forward + ".jsp").forward(request,
					response);
		}
	}

	

	@SuppressWarnings("unused")
	private void linkage2(HttpServletRequest request,
			HttpServletResponse response) throws UtilException, DBException {
		//response.setCharacterEncoding("UTF-8");

		BaseDao base = null;
		String value = null;
		String viewName = null;
		String methodName = null;
		base = new BaseDAOImpl();
		
		value = LinkStringTool.connectStr(request);
		viewName = request.getParameter("view");// 视图名
		methodName = request.getParameter("method");// 操作名
		
		String tableName = ServletParseXML.getInfo(viewName, "tableName");
		String id = ServletParseXML.getInfo(viewName, "id");
		String name = ServletParseXML.getInfo(viewName, "name");
		String condition = ServletParseXML.getInfo(viewName, "condition");
		String param = request.getParameter("id");
		String sql = "select " + id + ", " + name + " from " + tableName
				+ " where " + condition + " = " + param;
		List<Linkage> list = base.queryLinkage(sql);
		ObjectMapper mapper = new ObjectMapper();
		try {
			String result = mapper.writeValueAsString(list);
			response.setContentType("text/javascript;charset=utf-8");
			response.getWriter().print(result);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	

	@SuppressWarnings({ "unused", "rawtypes" })
	private void queryInfor(HttpServletRequest request,
			HttpServletResponse response) {
		BaseDao base = null;
		String success = "", fail = "";
		String value = null;
		String viewName = null;
		String methodName = null;
		base = new BaseDAOImpl();
		
		value = LinkStringTool.connectStr(request);
		viewName = request.getParameter("view");// 视图名
		methodName = request.getParameter("method");// 操作名
		
		try {
			String tableName = ServletParseXML.getInfo(viewName, "tableName");
			String forward = ServletParseXML.getInfo(viewName, "forward");
			String voName = ServletParseXML.getInfo(viewName, "voName");
			String sql = "select * from " + tableName ;
			List list = base.queryBySQL(sql, Class.forName(voName), 0, 0);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher(forward).forward(request, response);
		} catch (UtilException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {

		} catch (DBException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@SuppressWarnings({ "unused", "rawtypes" })
	private void querySelf(HttpServletRequest request,
			HttpServletResponse response) {
		BaseDao base = null;
		String success = "", fail = "";
		String value = null;
		String viewName = null;
		String methodName = null;
        base = new BaseDAOImpl();
		
		value = LinkStringTool.connectStr(request);
		viewName = request.getParameter("view");// 视图名
		methodName = request.getParameter("method");// 操作名
		
		try {
			String value01 =  request.getParameter("value");
			String tableName = ServletParseXML.getInfo(viewName, "tableName");
			String forward = ServletParseXML.getInfo(viewName, "forward");
			String voName = ServletParseXML.getInfo(viewName, "voName");
			String condition = ServletParseXML.getInfo(viewName, "condition");
			String sql = "select * from " + tableName +" where "+condition +" = "+ value01;
			if("t_family".equals(tableName)) {
				getSubrReginal(request);
			}else if("t_species".equals(tableName)) {
				getKingdom(request);
				getSubrReginal(request);
				String type = request.getSession().getAttribute("type")+"";
				getInfor(request,type);
			}else if("t_fucus".equals(tableName)) {
				getKingdom(request);
				getSubrReginal(request);
			}
			List list = base.queryBySQL(sql, Class.forName(voName), 0, 0);
			request.setAttribute("list", list);
			//Sample sample = (Sample)list.get(0);
			request.getRequestDispatcher(forward).forward(request, response);
		} catch (UtilException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {

		} catch (DBException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	//查找所有的区系类型
	private static void getReginal(HttpServletRequest request) throws DBException {
		String sql;
		BaseDAOImpl base = new BaseDAOImpl();
		sql = "select reginal_id,reginal_name from t_reginal";
		List<Linkage> list1 = base.queryLinkage(sql);
		request.setAttribute("list1", list1);
	}
	
	//查找所有的变种符号
	private static void getSubspecies_Sign(HttpServletRequest request) throws DBException {
		String sql;
		BaseDAOImpl base = new BaseDAOImpl();
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = '变种符号'";
		List<Linkage> listFeed = base.queryLinkage(sql);
		request.setAttribute("listSubs", listFeed);
	}
	
	
	//查找所有的子区系类型
	private static void getSubrReginal(HttpServletRequest request) throws DBException {
		String sql;
		BaseDAOImpl base = new BaseDAOImpl();
		sql = "select subreginal_id,subreginal_name from t_subreginal where subreginal_type = '"+request.getSession().getAttribute("type")+"'";
		List<Linkage> listSubr = base.queryLinkage(sql);
		request.setAttribute("listSubr", listSubr);
	}
	
	
	//查找所有的保护区
	private static void getProtection(HttpServletRequest request) throws DBException {
		String sql;
		BaseDAOImpl base = new BaseDAOImpl();
		// 保护区
		sql = "select protection_id, protection_name from t_protection";
		List<Linkage> listProt = base.queryLinkage(sql);
		request.setAttribute("listProt", listProt);
	}
	
	//查找所有的发展趋势
	private static void getDynamic(HttpServletRequest request,String flag) throws DBException {
		String sql;
		BaseDAOImpl base = new BaseDAOImpl();
		// 保护区
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = '种群发展趋势'";
		List<Linkage> listDeve = base.queryLinkage(sql);
		request.setAttribute("listDeve", listDeve);
	}
	
	//查找市
	private void town(HttpServletRequest request) throws DBException {
		String sql;
		BaseDAOImpl base = new BaseDAOImpl();
		// 保护区
		sql = "select town_id, town_name from t_town";
		List<Linkage> listTown = base.queryLinkage(sql);
		request.setAttribute("listTown", listTown);
	}
	
	private static void getInfor(HttpServletRequest request,String flag) throws DBException {
		String sql;
		BaseDAOImpl base = new BaseDAOImpl();
		// 地理分布
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = '地理分布型'";
		List<Linkage> listGeod = base.queryLinkage(sql);
		request.setAttribute("listGeod", listGeod);
		
		// 居留型
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = '居留型'";
		List<Linkage> listResi = base.queryLinkage(sql);
		request.setAttribute("listResi", listResi);
		
		// 生活型
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = '生活型'";
		List<Linkage> listLife = base.queryLinkage(sql);
		request.setAttribute("listLife", listLife);
		
		// 饲养状况
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = '饲养状况'";
		List<Linkage> listFeed = base.queryLinkage(sql);
		request.setAttribute("listFeed", listFeed);
		
		// 引种栽培
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = '引种栽培'";
		List<Linkage> listIntc = base.queryLinkage(sql);
		request.setAttribute("listIntc", listIntc);
		
		// 查询到国家保护级别
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = '国家保护级别'";
		List<Linkage> listCoup= base.queryLinkage(sql);
		request.setAttribute("listCoup", listCoup);

		// 查询到IUCN红色名录等级
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = 'IUCN红色名录等级'";
		List<Linkage> listIucn = base.queryLinkage(sql);
		request.setAttribute("listIucn", listIucn);

		// 省保护级别(植)
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = '省保护级别'"+" and type = '"+flag+"'";
		List<Linkage> listProv = base.queryLinkage(sql);
		request.setAttribute("listProv", listProv);

		// CITES保护等级
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = 'CITES保护等级'";
		List<Linkage> listCite = base.queryLinkage(sql);
		request.setAttribute("listCite", listCite);

		// 中国红色名录等级
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = '中国红色名录等级'";
		List<Linkage> listCred = base.queryLinkage(sql);
		request.setAttribute("listCred", listCred);

		// 三有物种
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = '三有物种'";
		List<Linkage> listThre = base.queryLinkage(sql);
		request.setAttribute("listThre", listThre);

		// 中国特有
		sql = "select dictionary_id, dictionary_name from t_dictionary where Category = '三有物种'";
		List<Linkage> listOnly = base.queryLinkage(sql);
		request.setAttribute("listOnly", listOnly);
	}
	
	private static void getKingdom(HttpServletRequest request) throws DBException {
		BaseDAOImpl base = new BaseDAOImpl();
		String sql = "select kingdom_id,kingdom_cname from t_kingdom";
		List<Linkage> listKing = base.queryLinkage(sql);
		request.setAttribute("listKing", listKing);
	}
}
