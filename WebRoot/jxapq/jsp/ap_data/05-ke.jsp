<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script   
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
</head>
<body>
<script type="text/javascript">
	if('${message}' != "") {
		alert('${message}');
	}
	
	function delele() {
		var url = "${pageContext.request.contextPath}/UpdateServlet?method=delete&view=deleteKeView&family_id %3D=${list[0].family_id }";
		$.getJSON(url,function(data){
			if(data == "删除信息成功") {
				window.location.reload();
			}else if(data != "" ) {
				alert(data);
			}
		});
	}
	
</script>
<style type="text/css">
    table{  line-height:25px;}
    th{ border:1px solid #aaa}
    td{  text-align:center;border:1px solid #aaa} 
    tr:hover{ background-color:#A9C3DD}
</style>

<link href="${pageContext.request.contextPath}/jxapq/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
</link>

<c:if test="${not empty userList[0].user_type }"> 
	<div id="box_top" align="center">
    <a href="#" onclick="delele()">删除</a>
	<a href="${pageContext.request.contextPath }/QueryServlet?method=querySelf&view=queryKeSelf&value=${list[0].family_id }">修改</a>
	<a href="${pageContext.request.contextPath }/UtilServlet?method=output&voName=Family&fieldName=family_id&value=false">导出全部的科</a>
	<a href="${pageContext.request.contextPath }/UtilServlet?method=output&voName=Fucus&fieldName=family_id_fk&value=${list[0].family_id }">导出该科下所有的属</a>
</div>
</c:if>

<table width="100%" cellpadding="0" cellspacing="0">
  <tbody>
    <tr>
      <td width="15%">学名:</td>
      <td>${list[0].family_sname }</td>
    </tr>
    <tr>
      <td width="15%">中文名:</td>
      <td>${list[0].family_cname }</td>
    </tr>
    <c:if test="${not empty list[0].family_cnamee}"> <!-- 判断不为空则显示动植物特有信息 -->
	    <tr>
	      <td width="15%">异名（中）:</td>
	      <td>${list[0].family_cnamee }</td>
	    </tr>
	 </c:if>
	 <c:if test="${not empty list[0].family_enamee}"> <!-- 判断不为空则显示动植物特有信息 -->   
	    <tr>
	      <td width="15%">异名（英）:</td>
	      <td>${list[0].family_enamee }</td>
	    </tr>
	</c:if>    
    <tr>
      <td width="15%">英文名:</td>
      <td>${list[0].family_ename }</td>
    </tr>
    <tr>
      <td width="15%">中文拼音:</td>
      <td>${list[0].family_spelling }</td>
    </tr>
    <tr>
      <td width="15%">分类等级:</td>
      <td>${list[0].family_level }</td>
    </tr>
    
    <tr>
      <td width="15%">概述:</td>
      <td>${list[0].family_summarize }</td>
    </tr>
    <tr>
      <td width="15%">备注:</td>
      <td>${list[0].family_notes }</td>
    </tr>
    
    <tr>
      <td width="15%">参考文献:</td>
      <td>${list[0].family_literature }</td>
    </tr>
    <c:if test="${not empty list[0].subreginal_id_fk}"> <!-- 判断不为空则显示动植物特有信息 -->
	    <tr>
	      <td width="15%">区系类型:</td>
	      <td>${list[0].subreginal_name }</td>
	    </tr>
    </c:if>
  </tbody> 
</table>
</body>
</html>