<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>信息管理系统</title>
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
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.4.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/jxapq/scripts/My97DatePicker/WdatePicker.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
	$(document).ready(function() {
		function check() {
			var name = $("#name").val();
			var date = $("#date").val();
			if (name == "" || data == "") {
				return false;
			} else {
				return true;
			}
		}

		//提交
		$("#submitbutton").click(function() {
			if (!check()) {
				art.dialog({
					icon : 'error',
					title : '友情提示',
					drag : false,
					resize : false,
					content : '请输入真实姓名或者出生日期',
					ok : true,
				});
				return false;
			}
			return true;
		});

		//取消
		$("#cancelbutton").click(function() {
			window.history.back();
		});
	});
</script>
</head>
<body>
	<form id="submitForm" name="submitForm"
		action="/xngzf/archives/initFangyuan.action" method="post">
		<div>
			<span id="login_err" class="sty_txt2"><font color="red">${message}</font>
			</span>
		</div>
		<div id="container">
			<div class="ui_content">

				<table class="table" width="43%" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tr>
						<td width="24%" class="ui_text_rt">用户名：</td>
						<td width="37%" class="ui_text_lt">${userList[0].user_id }</td>
						<td width="39%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="msgname" class="ui_text_lt"><span>
						</td>
					</tr>
					<tr>
						<td width="24%" class="ui_text_rt">真实姓名：</td>
						<td width="37%" class="ui_text_lt">${userList[0].user_name }</td>
						<td width="39%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="msgname" class="ui_text_lt"><span>
						</td>
					</tr>
					<tr>
						<td width="24%" class="ui_text_rt">性别：</td>
						<td width="37%" class="ui_text_lt">${userList[0].user_sex }</td>
						<td width="39%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="msgname" class="ui_text_lt"><span>
						</td>
					</tr>
					<tr>
						<td width="24%" class="ui_text_rt">我的email：</td>
						<td width="37%" class="ui_text_lt">${userList[0].user_email }</td>
						<td width="39%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="msgname" class="ui_text_lt"><span>
						</td>
					</tr>
					<tr>
						<td width="24%" class="ui_text_rt">出生日期：</td>
						<td width="40%" class="ui_text_lt">${userList[0].user_birthday
							}</td>
						<td width="36%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="msgdate" class="ui_text_lt"><span>
						</td>
					</tr>
					<tr>
						<td width="24%" class="ui_text_rt">我的职称：</td>
						<td width="40%" class="ui_text_lt">${userList[0].user_called
							}</td>
						<td width="36%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="msgdate" class="ui_text_lt"><span>
						</td>
					</tr>
					<tr>
						<td width="24%" class="ui_text_rt">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							话：</td>
						<td width="40%" class="ui_text_lt">${userList[0].user_tel }</td>
						<td width="39%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="msgphone" class="ui_text_lt"><span>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<div style="display:none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>