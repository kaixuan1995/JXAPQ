<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>江西省动植物信息检索系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
<link
	href="${pageContext.request.contextPath}/jxapq/style/authority/basic_layout.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/jxapq/style/authority/common_style.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/authority/commonAll.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/Linkage.js"></script>

<link href="${pageContext.request.contextPath}/uploadify/uploadify.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/uploadify/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/uploadify/swfobject.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<style type="text/css">
tr:hover {
	background-color: #A9C3DD
}
</style>
<body>
	<input type="hidden" name="fyID" value="14458625716623" id="fyID" />
	<div id="container">
		<div id="nav_links">
		
		
			当前位置：动植物数据管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">新增图片</span>
			<div id="page_close">
				<a href="javascript:parent.$.fancybox.close();"> <img
					src="${pageContext.request.contextPath}/jxapq/images/common/page_close.png"
					width="20" height="20" style="vertical-align: text-top;" /> </a>
			</div>
		</div>
		</div>
		<p>
		<div id="box_top">批量上传物种图片(每次最多都不能超过十张,大小不能超过5M,格式为png,jpg,gif,jpeg)
				新增种 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
					href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=importZhong&sign=false">导入种模板</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_species_protection&sign=protection">完善保护区信息</a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_species_dynamic&sign=dynamic">完善种群动态</a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_species_distribute&sign=town">完善省内分布</a>
				&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="${pageContext.request.contextPath}/jxapq/jsp/add_ap/add_tupian.jsp">完善物种图片</a>
		</div>
		<br>
		<div>${message}</div>
		<fieldset>
		<legend style="color:#4E4E4E"> <font size="5">上传物种图片</font></legend>
		<br>
		<div style="margin-left: 20px;">
			<div id="fileQueue"></div>
				<input type="file" name="uploadify" id="uploadify" />
			<p>
				<br>
				<a href="javascript: jQuery('#uploadify').uploadifyUpload()" style="color:#4E4E4E">开始上传</a>&nbsp;
				<a href="javascript:jQuery('#uploadify').uploadifyClearQueue()"style="color:#4E4E4E">取消所有上传</a>
			</p>
				<div>
				<h4 style="clolr:#1E82E9">下面图片已上传成功</h4>
				</div>
			<div id="result1"></div>
		</div>
		</fieldset>
<script type="text/javascript">
//官方网址：http://www.uploadify.com/

$(document).ready(function(){
	//$("#uploadify").uploadifySettings('scriptData',	{'name':'liudong','age':22});
	$("#uploadify").uploadify({
		'uploader'	:	"<%=basePath%>uploadify/uploadify.swf",
		'script'    :	"${pageContext.request.contextPath}/UploadifyServlet",
		'cancelImg' :	"<%=basePath%>uploadify/cancel.png",
		'folder' : "uploads",//上传文件存放的路径,请保持与uploadFile.jsp中PATH的值相同
		'queueId' : "fileQueue",
		'queueSizeLimit' : 10,//限制上传文件的数量
		'fileExt':'*.gif;*.jpg;*.jpeg;*.png',//允许上传的文件类型，使用分号(”;)”分割 例如:*.jpg;*.gif,默认为null(所有文件类型)
        'fileDesc':'不超过5M的图片 (*.gif;*.jpg;*.png)',
        'sizeLimit': 2048000,  //允许上传的文件大小(kb)  此为2M
		'auto' : false,
		'multi' : true,//是否允许多文件上传
		'simUploadLimit' : 10,//同时运行上传的进程数量
		'buttonText' : "picture",
		'scriptData' : {
			'zhongId':'<%=request.getSession().getAttribute("species_id")%>'
		},//这个参数用于传递用户自己的参数，此时'method' 必须设置为GET, 后台可以用request.getParameter('name')获取名字的值
		'method' : "GET",
		'onError': function(event, queueID, fileObj) {//当单个文件上传出错时触发
               alert("文件:" + fileObj.name + " 上传失败！");
         },
		'onComplete' : function(event, ID, fileObj, response, data) {
				//alert(response);
				var result = $("#result1");
				var $image = "<img style='width: 180px; height: 200px;'src = '<%=basePath%>uploads/"+response+"'>&nbsp;&nbsp;";
				result.append($image);
			},
		});
		//$("#uploadify").uploadifySettings();
	});
</script>

</body>
</html>
