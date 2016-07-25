<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>江西省动植物信息检索系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="${pageContext.request.contextPath }/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
<link href="${pageContext.request.contextPath }/jxapq/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/jxapq/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/jxapq/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jxapq/scripts/jquery/jquery-1.4.4.min.js"></script>
<script src="${pageContext.request.contextPath }/jxapq/scripts/My97DatePicker/WdatePicker.js" type="text/javascript" defer></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jxapq/scripts/artDialog/artDialog.js?skin=default"></script>
<body>
<script type="text/javascript">
function delele(sample_id) {
	var url = "${pageContext.request.contextPath}/UpdateServlet?method=delete&view=deleteBiaobenView&sample_id %3D="+sample_id;
	$.getJSON(url,function(data){
		if(data == "删除信息成功") {
			alert(data);
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
    tr:hover{ background-color:#FF9}
</style>
<c:forEach var="Simple" items="${list }" varStatus="status">
<div align="center">
  <div id="box_top">
    <h3>标本${status.count }</h3>
  </div>
</div>
<table width="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td >标本号:</td>
    <td >${Simple.sample_id }</td>
	<td><img src="101205065944.jpg" height="200" width="290"><br/>
      <a href="">下载原图</a></td>
  </tr>
  <tr>
    <td >采集地点:</td>
    <td colspan="3">${Simple.sample_place }</td>
  </tr>
  <tr>
    <td>采集时间:</td>
    <td colspan="3">${Simple.sample_time }</td>
  </tr>
  <tr>
    <td>采集人:</td>
    <td colspan="3">${Simple.sample_discover }</td>
  </tr>
  <tr>
    <td >鉴定人:</td>
    <td colspan="3">${Simple.sample_identifier }</td>
  </tr>
  <tr>
    <td >鉴定时间:</td>
    <td colspan="3">${Simple.sample_identime }</td>
  </tr>
  <tr>
    <td >海拔:</td>
    <td colspan="3">${Simple.sample_altitude }</td>
  </tr>
  <tr>
    <td >描述:</td>
    <td colspan="3">${Simple.sample_summarize }</td>
  </tr>
  <tr>
    <td>备注:</td>
    <td colspan="3">${Simple.sample_comment }</td>
  </tr>
</table>
<div align="center">
<a href="${pageContext.request.contextPath }/QueryServlet?method=querySelf&view=queryBiaobenSelf&value=${Simple.sample_id}">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="#" onclick="delele(${Simple.sample_id })">删除</a></div>
</c:forEach>
</body>
</html>
