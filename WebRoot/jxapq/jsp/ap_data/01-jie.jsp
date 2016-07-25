<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="textml; charset=utf-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript">
	if('${message}' != "") {
		alert('${message}');
	}
	
	function delele() {
		var url = "${pageContext.request.contextPath}/UpdateServlet?method=delete&view=deleteJieView&kingdom_id %3D=${list[0].kingdom_id }";
		$.getJSON(url,function(data){
			if(data == "删除信息成功") {
				alert(data);
				//location.replace(document.referrer);
			}else if(data != "" ) {
				alert(data);
			}
		});
	}
	
</script>
</head>
<body>
	<style type="text/css">
table {
	line-height: 25px;
}

th {
	border: 1px solid #aaa
}

td {
	text-align: center;
	border: 1px solid #aaa
}

tr:hover {
	background-color: #A9C3DD
}
</style>
	<link href="${pageContext.request.contextPath}/jxapq/style/authority/basic_layout.css" rel="stylesheet" type="text/css"></link>

<c:if test="${not empty userList[0].user_type }"> 

	<div id="box_top" align="center"> 
    <a href="#" onclick="delele()">删除</a>
	<a href="${pageContext.request.contextPath }/QueryServlet?method=querySelf&view=queryJieSelf&value=${list[0].kingdom_id }">修改</a>
	<a href="${pageContext.request.contextPath }/UtilServlet?method=output&voName=Kingdom&fieldName=kingdom_id&value=false">导出全部的界</a>
	<a href="${pageContext.request.contextPath }/UtilServlet?method=output&voName=Phylum&fieldName=kingdom_id_fk&value=${list[0].kingdom_id }">导出该界下的门</a>
</div>
</c:if>
	<table width="100%" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<td width="15%">学名:</td>
				<td>${list[0].kingdom_sname }</td>
			</tr>
			<tr>
				<td width="15%">中文名:</td>
				<td>${list[0].kingdom_cname }</td>
			</tr>
			<tr>
				<td width="15%">英文名:</td>
				<td>${list[0].kingdom_ename }</td>
			</tr>
			<tr>
				<td width="15%">中文拼音:</td>
				<td>${list[0].kingdom_spelling }</td>
			</tr>
			<tr>
				<td width="15%">分类等级:</td>
				<td>界</td>
			</tr>

			<tr>
				<td width="15%">概述:</td>
				<td>${list[0].kingdom_summarize }</td>
			</tr>
		</tbody>
	</table>
</body>
</html>