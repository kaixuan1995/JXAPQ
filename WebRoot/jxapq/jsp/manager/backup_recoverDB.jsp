<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	src="${pageContext.request.contextPath}/jxapq/scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jxapq/style/authority/jquery.fancybox-1.3.4.css"
	media="screen"></link>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/artDialog/artDialog.js?skin=default"></script>
<script
	src="${pageContext.request.contextPath}/jxapq/scripts/My97DatePicker/WdatePicker.js"
	type="text/javascript" defer></script>
<title>数据库的恢复与备份管理</title>

<style>
.alt td {
	background: black !important;
}
</style>
</head>
<body>

	<div>
		<span id="login_err" class="sty_txt2"><font color="red">${message}</font>
		</span>
	</div>
	<div id="container">
		<form id="submitForm" name="submitForm"
			action="${pageContext.request.contextPath}
	/UserServlet?view=backupDBView&method=backupDB"
			method="post">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">数据库备份</div>
						<div id="box_center">
							数据库备份： <input type="submit" name="submit" value="开始备份" />
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="container">
		<form id="submitForm" name="submitForm"
			action="${pageContext.request.contextPath}
	/UserServlet?view=uploadSqlFileView&method=uploadSqlFile"
			enctype="multipart/form-data" method="post">
			<div class="ui_content">
				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">数据库恢复（请先上传你要数据库还原的sql文件）</div>
						<div id="box_center">
							选择恢复文件:&nbsp;<input type="file" multiple="multiple"
								name="dbfileName"> &nbsp;&nbsp;&nbsp; <input
								type="submit" name="submit" value="开始上传" />
						</div>
						<div>
							<a
								href="${pageContext.request.contextPath}
	/UserServlet?view=recoverView&method=recover">开始恢复</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
