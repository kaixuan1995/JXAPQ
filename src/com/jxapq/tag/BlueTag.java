package com.jxapq.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.jxapq.vo.SimpleInfo;



public class BlueTag extends SimpleTagSupport {
	private List list;
	
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();
//		String str = "";
//		JSONObject jsonObject = new JSONObject();
//		for(int i = 0; i < list.size(); i++) {
//			SimpleInfo info = (SimpleInfo) list.get(i);
//			str = "<a href='${pageContext.request.contextPath }/QueryServlet?view=${SimpleInfo.view }&method=query&${SimpleInfo.view }_id%20%3d=${SimpleInfo.id}'>"
//					+ info.getCname() + "   " + info.getSname() + "</a>";
//			str = info.getCname() + "   " + info.getSname();
//			JSONObject jobj = new JSONObject();
//			jobj.put("cname", info.getCname());
//			jobj.put("sname", info.getSname());
//			jobj.put("view", info.getView());
//			jobj.put(info.getView() + "_id", info.getId());
//			jsonObject.put(i, jobj);
//		}
//System.out.println(jsonObject);
//		this.getJspContext().setAttribute("jsonObject", jsonObject);
		
		String jsonObject = JSONArray.fromObject(list).toString();
		System.out.println(jsonObject);
		this.getJspContext().setAttribute("jsonObject", jsonObject);
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	

}
