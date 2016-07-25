package com.jxapq.service.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

public class WebStatisticsAnalyze {

	public String analyzeParames(HttpServletRequest req) throws ServletException, IOException {
		StringBuffer finsql = new StringBuffer("select species_id, species_cname, species_addword, species_discover from v_tongji where ");
		List<String> parameter = new ArrayList<String>();
		Enumeration<String> names = req.getParameterNames();
		while(names.hasMoreElements()) {
			String name = names.nextElement();
			if(!name.equals("provces") && 
					!name.equals("method") && 
					!name.equals("protectedGrage") &&
					!name.equals("city") &&
					!name.equals("county")) {
				if(name.equals("protectedType")) {     //
					String left = req.getParameter(name);
					String right = req.getParameter("protectedGrage");
					String str = left + " = '" + right + "'";
					parameter.add(str);
				} else if(name.equals("protection_name")){
					String val = req.getParameter(name);
					if(!val.equals("0")) {
						String str = name + " like '%" + val + "%'";
						parameter.add(str);
					}
				} else {
					String val = req.getParameter(name);
					if(!val.equals("0")) {
						String str = name + " = " + val;
						parameter.add(str);
 					}
				}
			}
		}
		String val = req.getParameter("city");
		if(!val.equals("0")) {
			String pra = "distribute_name like '%" + val;
			String val1 = req.getParameter("county");
			if(!val1.equals("0")) {
				pra = pra + val1 + "%'";
				parameter.add(pra);
			} else {
				pra = pra + "%'";
				parameter.add(pra);
			}
		}
		for(int i=0; i<parameter.size(); i++) {
			finsql.append(parameter.get(i));
			if(i != parameter.size()-1 ) {
				finsql.append(" and ");
			}
		}
		return finsql.toString();
	}	
}
