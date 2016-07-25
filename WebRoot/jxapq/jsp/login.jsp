<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>江西省动植物信息检索系统-登陆</title>
<link
	href="${pageContext.request.contextPath}/jxapq/style/authority/login_css.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/check.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#login_sub").click(function() {
			$("#submitForm").attr("action", "${pageContext.request.contextPath}/UserServlet?method=login").submit();
		});
	});

	/*回车事件*/
	function EnterPress(e) { //传入 event 
		var e = e || window.event;
		if (e.keyCode == 13) {
			$("#submitForm").attr("action", "${pageContext.request.contextPath}/UserServlet?method=login").submit();
		}
	}

	function change() {
		/*
		1. 获取<img>元素
		 */
		var ele = document.getElementById("vCode");
		ele.src = "${pageContext.request.contextPath}/UserServlet?view=validateCodeView&method=validateCode&a=" + new Date().getTime();
	}
</script>
</head>
<body>
	<div id="login_center">
		<div id="login_area">
			<div id="login_box">
				<div id="login_form">
					<form id="submitForm" action="<c:url value='/UserServlet?method=login'/>" method="post">
						<div id="login_tip">
							<span id="login_err" class="sty_txt2"><font color="red">${message}</font></span>
						</div>
						<div>
							用户名：&nbsp;<input type="text" name="user_id =" class="username"
								id="name">
								<label id="nameError"></label>
						</div>
						<div>
							密&nbsp;&nbsp;&nbsp;&nbsp;码：&nbsp;<input type="password"
								name="user_password =" class="pwd" id="pwd"
								onKeyPress="EnterPress(event)" onKeyDown="EnterPress()">
								<label id="pwdError"></label>
						</div>
						<div>
							验证码：&nbsp;<input type="text" name="vcode" class="yzm"
								id="zym" onKeyPress="EnterPress(event)" onKeyDown="EnterPress()">
							<a href="javascript:change() ">
							<img id="vCode" src="${pageContext.request.contextPath}/UserServlet?view=validateCodeView&method=validateCode" /> </a>
						</div>
						<div>
							<p>&nbsp;</p>
							<p>
								角&nbsp;&nbsp;&nbsp;&nbsp;色：&nbsp; <select name="view"
									class="selected">
									<option value="userLoginView">用户及工作人员</option>
									<option value="adminLoginView">系统管理员</option>
								</select>
								<a href="${pageContext.request.contextPath}/jxapq/jsp/wangjimima01.jsp">忘记密码？</a>
							</p>
						</div>
						<div id="btn_area">
							<input type="submit" class="login_btn" id="login_sub"
								value="登  录"> <input type="reset" class="login_btn"
								id="login_ret" value="重 置">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div style="display:none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>