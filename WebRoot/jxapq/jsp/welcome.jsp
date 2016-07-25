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
<title>江西省动植物信息检索系统-欢迎</title>
<link
	href="${pageContext.request.contextPath}/jxapq/style/authority/login_css.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
	<script
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/jxapq/scripts/function.js"
	type="text/javascript"></script>

<link
	href="${pageContext.request.contextPath}/jxapq/style/authority/main_css.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/jxapq/style/style.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/jxapq/style/comm.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/jxapq/style/diy.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/jxapq/style/focus.css"
	type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/suggest/yahoo-dom-event.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/suggest/suggest.js"></script>
<script   
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>		
<script type="text/javascript">
function sub() {
	var q = publicname = document
			.getElementById("q").value;
	document.forms[0].action = document.forms[0].action + q;
	document.forms[0].submit();
}

function dosub() {
	var q = publicname = document
			.getElementById("q").value;
	document.forms[0].action = document.forms[0].action + q;
	document.forms[0].submit();
			
}
</script>
</head>
<body>
	<div id="login_center">
		<div id="login_area">
			<div id="login_box">
				<div id="login_form" style="margin-top:130px">
					<form action="${pageContext.request.contextPath}/jxapq/jsp/second.jsp?${pageContext.request.contextPath}/QueryServlet?method=indexquery&key="
							 method="post" onsubmit="dosub()">
							<input size="25/" maxlength="50" id="q" name="cname like "  class="search-input"
								value="请输入查找动植物的名称"
								onBlur="javascript:if(this.value=='')this.value='请输入查找动植物的名称';"
								onFocus="javascript:if(this.value=='请输入查找动植物的名称')this.value='';"
								style="height:40px;width:300px;float:left;border:2px solid #074177;line-height:40px;border-radius:5px 0 0 5px;margin-left:20px;"
								type="text" /> 
								
								<input style="height:40px;border:0px;width:40px;float:left;background-image:url('${pageContext.request.contextPath}/jxapq/images/ss.jpg');"
								 onclick="sub()" type="button" /> 
		</form>
		</br></br>
		<a href="${pageContext.request.contextPath}/QueryServlet?method=highquery" style="font-size:17px">进入高级检索</a>
				</div>
			</div>
		</div>
	</div>
		
	</div>
</body>
</html>