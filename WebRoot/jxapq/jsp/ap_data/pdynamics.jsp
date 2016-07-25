<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/jxapq/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<title>种群动态</title>
</head>
<body>
<style type="text/css">
    table{  line-height:25px;}
    th{ border:1px solid #aaa}
    td{  text-align:center;border:1px solid #aaa} 
    tr:hover{ background-color:#FF9}
</style>
<script type="text/javascript">
	if('${message}' != "") {
		alert('${message}');
	}
	
	function delele() {
		var url = "${pageContext.request.contextPath}/UpdateServlet?method=delete&view=deletePdynamicsView&pdynamics_id %3D=${list[0].pdynamics_id }";
		$.getJSON(url,function(data){
			if(data == "删除信息成功") {
				window.location.reload();
			}else if(data != "" ) {
				alert(data);
			}
		});
	}
</script>
<div align="center">
  <div id="box_top">
    <h3>种群动态</h3>
  </div>
  <div id="box_top">
    <h3><a href=javascript:history.back();>返回种资料</a></h3>
  </div>
</div>
<table width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50%">记录时间:</td>
    <td colspan="3">${list[0].pdynamics_time }</td>
  </tr>
  <tr>
    <td width="50%">种群数量:</td>
    <td colspan="3">${list[0].pdynamics_number }</td>
  </tr>
  <tr>
    <td width="50%">种群地点:</td>
    <td colspan="3">${list[0].pdynamics_place }</td>
  </tr>
  <tr>
    <td width="50%">动态描述:</td>
    <td colspan="3">${list[0].pdynamics_summarize }</td>
  </tr>
  <tr>
    <td width="50%">发展趋势:</td>
    <td colspan="3">${list[0].dictionary_name }</td>
  </tr>
</table>
<div align="center"><a href="#" onclick="delele()">删除</a> </div>
</body>
</html>
