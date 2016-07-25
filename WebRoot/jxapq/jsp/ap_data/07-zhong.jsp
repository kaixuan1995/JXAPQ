<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/keleyi.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/keleyi.min.js"></script>
<style>img{border:0px}</style>
</head>
<body>
<script type="text/javascript">
	if('${message}' != "") {
		alert('${message}');
	}
	
	function delele() {
		var url = "${pageContext.request.contextPath}/UpdateServlet?method=delete&view=deleteZhongView&species_id %3D=${list[0].species_id }";
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
<c:if test="${not empty userList[0].user_type }"> 
<div id="box_top" align="center">
    <a href="#" onclick="delele()">删除</a>
	<a href="${pageContext.request.contextPath }/QueryServlet?method=querySelf&view=queryZhongSelf&value=${list[0].species_id }">修改</a>
	<a href="${pageContext.request.contextPath }/UtilServlet?method=output&voName=Species&fieldName=species_id&value=false">导出全部的种</a>
	<a href="${pageContext.request.contextPath }/UtilServlet?method=Test&value=${list[0].species_id }">导出word</a>
</div>
</c:if>
<table width="100%" cellpadding="0" cellspacing="0">
  <tbody>
    <tr>
      <td width="15%">分类系统:</td>
      <td>${list[0].species_level }</td>
      <td><%-- <img src="${pageContext.request.contextPath }/upload/${list[0].picture_thumbnail}" height="200" width="290" /><br/>--%>
        <div class="dengxaing-keleyi-com"> 

<a title="2013-8-21" href="${pageContext.request.contextPath }/uploads/${list[0].picture_url}" style="text-align: center;">
 <img height="200" width="290" src="${pageContext.request.contextPath }/uploads/${list[0].picture_url}"></a> 

  <c:forEach var="url" items="${fn:split(list[0].url, ',') }">
  	<a href="${pageContext.request.contextPath}/uploads/${url}" style="visibility:hidden"> 
	<img width="133" height="75" src="${pageContext.request.contextPath}/uploads/${url}"></a>
  </c:forEach>

  </div>
        <c:if test="${not empty userList[0].user_type }"> 
          <a href="D:\\haha1.jpg">下载原图</a></td>
        </c:if>
    </tr>
    <tr>
      <td width="15%">学名:</td>
      <td colspan="3">${list[0].sname }</td>
    </tr>
    <tr>
      <td width="15%">中文名：</td>
      <td colspan="3">${list[0].species_cname }</td>
    </tr>
    <tr>
      <td width="15%">英文名：</td>
      <td colspan="3">${list[0].species_ename }</td>
    </tr>
    <tr>
      <td width="15%">中文拼音:</td>
      <td colspan="3">${list[0].species_spelling }</td>
    </tr>
    <tr>
      <td width="15%">所属等级:</td>
      <td colspan="3">种</td>
    </tr>
    <tr>
      <td width="15%">概述:</td>
      <td colspan="3">${list[0].species_summarize}</td>
 
    </tr>
    <c:if test="${not empty list[0].species_discover}"> <!-- 判断不为空则显示动植物特有信息 -->
	    <tr>
	      <td width="15%">物种命名人:</td>
	      <td colspan="3">${list[0].species_discover}</td>
	    </tr>
    </c:if>
    
    <c:if test="${not empty list[0].species_synonym}"> <!-- 判断不为空则显示动植物特有信息 -->
	    <tr>
	      <td width="15%">异名信息:</td>
	      <td colspan="3">${list[0].species_synonym}</td>
	    </tr>
    </c:if>
    <tr>
      <td width="15%">生境:</td>
      <td colspan="3">${list[0].species_habitat}</td>
    </tr>
<c:if test="${not empty list[0].species_geodist}"> <!-- 判断不为空则显示动植物特有信息 -->
	    <tr>
	      <td width="15%">地理分布型:</td>
	      <td colspan="3">${list[0].species_geodist}</td>
	    </tr>
	 </c:if>
 <c:if test="${not empty list[0].species_resitype}"> <!-- 判断不为空则显示动植物特有信息 -->
	    <tr>
	      <td width="15%">居留型:</td>
	      <td colspan="3">${list[0].species_resitype}</td>
	    </tr>
 	</c:if>
 <c:if test="${not empty list[0].species_intculti}"> <!-- 判断不为空则显示动植物特有信息 -->
	    <tr>
	      <td width="15%">引种栽培:</td>
	      <td colspan="3">${list[0].species_intculti}</td>
	    </tr>
	 </c:if>
 <c:if test="${not empty list[0].species_lifetype }">
    <tr>
      <td width="15%">生活型:</td>
      <td colspan="3">${list[0].species_lifetype}</td>
    </tr>
 </c:if>
 <c:if test="${not empty list[0].species_feedstate}"> <!-- 判断不为空则显示动植物特有信息 -->
	    <tr>
	      <td width="15%">饲养状况:</td>
	      <td colspan="3">${list[0].species_feedstate}</td>
	    </tr>
 	</c:if>
    <tr>
      <td width="15%">国家保护级别:</td>
      <td colspan="3">${list[0].species_coupro }</td>
    </tr>
    <c:if test="${not empty list[0].species_three}"> <!-- 判断不为空则显示动植物特有信息 -->
    <tr>
      <td width="15%">三有物种:</td>
      <td colspan="3">${list[0].species_three }</td>
    </tr>
    </c:if>
    <tr>
      <td width="15%">省保护级别:</td>
      <td colspan="3">${list[0].species_provpro }</td>
    </tr>
    <tr>
      <td width="15%">CITES公约级别:</td>
      <td colspan="3">${list[0].species_cites }</td>

    </tr>
    <tr>
      <td width="15%">IUCN红色名录等级:</td>
      <td colspan="3">${list[0].species_iucn }</td>

    </tr>
    <tr>
      <td width="15%">中国红皮书等级:
      <td colspan="3">${list[0].species_credpro }</td>

    </tr>
  <c:if test="${not empty userList[0].user_type }"> 
    
    <tr>
      <td width="15%">标本:</td>
     <td colspan="3"><a href="${pageContext.request.contextPath }/QueryServlet?view=sample&method=query&species_id_fk%20%3d=${list[0].species_id }">点击这里查询</a></td>
    </tr>
    
    <tr>
      <td width="15%">种群动态:</td>
     <td colspan="3"><a href="${pageContext.request.contextPath }/QueryServlet?view=pdynamics&method=query&species_id_fk%20%3d=${list[0].species_id }">点击这里查询</a></td>
    </tr> 
  </c:if>  
    <tr>
      <td width="15%">中国特有:</td>
      <td colspan="3">${list[0].species_onlychina }</td>
    </tr>
    <tr>
      <td width="15%">俗名信息:</td>
      <td colspan="3">${list[0].species_commonInfo }</td>
    </tr>
    <tr>
      <td width="15%">区系类型:</td>
      <td colspan="3">${list[0].reginal_name }  ${list[0].subreginal_name }</td>
    </tr>
    <tr>
      <td width="15%">保护区:</td>
      <td colspan="3" align="center" style="text-align: left;">
      <c:if test="${fn:length(list[0].protection_name) != 0}">
      <table align="center" >
      <c:forEach var="pro" items="${fn:split(list[0].protection_name, ',') }">
      	
      	<tr>
      		<td>${pro }</td> 
      	 <c:if test="${not empty userList[0].user_type }"> 
      		
      		<td><a>修改</a></td>
      		<td><a>删除</a></td>
      	</c:if>
      	</tr>
      </c:forEach>
      </table>
      </c:if>
      </td>
    </tr>
    <tr>
      <td width="15%">省内分布地:</td>
      <td colspan="3">${list[0].distribute_name }</td>
    </tr>
    <c:if test="${not empty list[0].species_habit}"> <!-- 判断不为空则显示动植物特有信息 -->
	    <tr>
	      <td width="15%">习性:</td>
	      <td colspan="3">${list[0].species_habit }</td>
	    </tr>
    </c:if>
    <tr>
      <td width="15%">用途:</td>
      <td colspan="3">${list[0].species_used }</td>
    </tr>
    <tr>
      <td width="15%">国家分布地:</td>
      <td colspan="3">${list[0].species_nationdist }</td>
    </tr>
    <tr>
      <td width="15%">中国分布:</td>
      <td colspan="3">${list[0].species_chinadist }</td>
    </tr>
    <tr>
      <td width="15%">参考文献:</td>
      <td colspan="3">${list[0].species_literature }</td>
    </tr>
  </tbody>
</table>

  <script type="text/jscript">
$(document).ready(function() {

    $('.dengxaing-ke' + 'leyi-com').magnificPopup({
		delegate: 'a',
		type: 'image',
		tLoading: 'Loading image #%curr%...',
		mainClass: 'mfp-img-mobile',
		gallery: {
			enabled: true,
			navigateByImgClick: true,
			preload: [0,1] // Will preload 0 - before current, and 1 after the current image
		},
		image: {
			tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
			titleSrc: function(item) {
				return  '<small>蓝点工作室</small>';
			}
		}
	});


});

  </script>
</body>
</html>