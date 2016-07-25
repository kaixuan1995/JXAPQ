<%@ page language="java" import="java.util.* " pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
  </head>
 <script type="text/javascript">
 	$(function(){
 		
 	if(false) {
 		var url = "${pageContext.request.contextPath }/UtilServlet";
 		var args = {"method":"getStatisticsInfor", voName:"webStatisticsView"};
 		$.post(url, args, function(data) {
 			
 		})
 	}
 	})
 	
 </script>
  
  <body>
   	<ul id="notice">
   		
   	</ul>
   	<form action="<c:url value='/UtilServlet?method=exportData&view=webStatisticsView'/>" method="post">
   		<input type="submit" value="提交" />
   	</form>
 	<form action="<c:url value='/UtilServlet?method=statistics&view=webStatisticsView'/>" method="post">
 		<input type="submit" value="提交" />
 		
 	</form>
 	<img src="${pageContext.request.contextPath }/statistics/201504211720026179144/T120_mXgdfXXaGP9rV-164-164.jpg" />
 	
 	<c:forEach items="${requestScope.list }" var="entry">
 	${pageContext.request.contextPath }/${entry}
 		<img src="${pageContext.request.contextPath }/${entry}" />
 	</c:forEach>
  </body>
</html>
