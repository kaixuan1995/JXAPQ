<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>统计结果</title>
</head>
<style  type="text/css">
	input{
		align:right
	}
</style>
<body>
	<form action="${pageContext.request.contextPath }/UtilServlet?method=excel" method="post">
		<input type="submit" value="导出全部详细信息" />
	</form>			
	-------->所有结果：
	<c:forEach items="${requestScope.list }" var="entry">
		<li>
			<a href="${pageContext.request.contextPath}/QueryServlet?view=species&method=query&species_id%20%3d=${entry.species_id}" >
			${entry.species_cname} &nbsp; ${entry.species_addword} ${entry.species_discover}</a>
		</li>
	</c:forEach>
</body>
</html>
