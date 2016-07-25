<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

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
	$(document).ready(
			function() {
				//原密码
				$("#password").change(
						function() {
							//	alert("111");
							var password = $(this).val();
							var reg = /^[\u4E00-\u9FA5\uF900-\uFA2D\w]{1,16}$/; // 正则判断是否为中文、数字、字母
							if (!reg.test(password)) {
								$("#msgpassword").show();
								$("#msgpassword").html(
										"<b>密码格式错误&nbsp&nbsp&nbsp</b>").css({
									"border" : "1px solid red"
								});
							} else {
								$("#msgpassword").hide();
							}
						});
				//新密码
				$("#newpassword").change(
						function() {
							var newpassword = $(this).val();
							var reg = /^[\u4E00-\u9FA5\uF900-\uFA2D\w]{1,16}$/; // 正则判断是否为中文、数字、字母
							if (!reg.test(newpassword)) {
								$("#msgnewpassword").show();
								$("#msgnewpassword").html(
										"<b>密码格式错误&nbsp&nbsp&nbsp</b>").css({
									"border" : "1px solid red"
								});
							} else {
								$("#msgnewpassword").hide();
							}
						});
				//确认密码
				$("#repassword").change(
						function() {
							var repassword = $(this).val();
							var newpassword = $("#newpassword").val();
							if (newpassword == repassword) {
								$("#msgrepassword").html(
										"<b>两次密码输入一致&nbsp&nbsp&nbsp</b>").css({
									"border" : "1px solid green"
								});
							} else {
								$("#msgrepassword").html(
										"<b>两次密码输入不一致&nbsp&nbsp&nbsp</b>").css(
										{
											"border" : "1px solid red"
										});
							}
						});

				function checkpassword() {
					var password = $("#password").val();
					var newpassword = $("#newpassword").val();
					var reg = /^[\u4E00-\u9FA5\uF900-\uFA2D\w]{1,16}$/; // 正则判断是否为中文、数字、字母
					if (!reg.test(password) || !reg.test(newpassword)) {
						return false;
					} else {
						return true;
					}
				}
				function checkrepassword() {
					var newpassword = $("#newpassword").val();
					var repassword = $("#repassword").val();
					if (newpassword == repassword) {
						return true;
					} else {
						return false;
					}
				}
				//提交
				$("#submitbutton").click(function() {
					if (!checkpassword()) {
						art.dialog({
							icon : 'error',
							title : '友情提示',
							drag : false,
							resize : false,
							content : '密码格式错误',
							ok : true,
						});
						return false;
					}
					if (!checkrepassword()) {
						art.dialog({
							icon : 'error',
							title : '友情提示',
							drag : false,
							resize : false,
							content : '两次密码输入不一致，请重新输入',
							ok : true,
						});
						return false;
					}
					return true;
				});

			});
</script>
</head>
<body>
	<form id="submitForm" name="submitForm"
		action="${pageContext.request.contextPath}/UserServlet?view=queryPasswordView&method=queryPassword"
		method="post" onsubmit="return getConf()">
		<div>
			<span id="login_err" class="sty_txt2"><font color="red">${message}</font>
			</span>
		</div>
		<div id="container">
			<div class="ui_content">
				<input type="hidden" id="user_id" name="#w#user_id ="
					value="${userList[0].user_id}" />
				<table class="table" width="43%" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tr>
						<td width="24%" class="ui_text_rt">原密码：</td>
						<td width="40%" class="ui_text_lt"><input type="password"
							id="pwd" name="#w#user_password =" value=""
							class="ui_input_txt02" />
							<label id="pwdError"></label>
							</td>
						<td width="36%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="msgpassword" class="ui_text_lt"></span>
						</td>

					</tr>
					<tr>
						<td class="ui_text_rt">新密码：</td>
						<td class="ui_text_lt"><input type="password"
							id="pwd" name="#s#user_alter_password =" value=""
							class="ui_input_txt02" />
							<label id="pwdError"></label>
						</td>
						<td align="left" nowrap class="ui_text_lt"><span
							id="msgnewpassword"></span></td>

					</tr>
					<tr>
						<td class="ui_text_rt">确认密码：</td>
						<td class="ui_text_lt"><input type="password" id="pwd"
							name="#s#user_alter_password =" value="" class="ui_input_txt02" />
							<label id="pwdError"></label>
						</td>
						<td align="left" nowrap class="ui_text_lt"><span
							id="msgrepassword"></span></td>

					</tr>
					<tr>
						<td></td>
						<td class="ui_text_lt"><input id="submitbutton" type="submit"
							value="提交" class="ui_input_btn01" /> <input id="" type="reset"
							value="重置" class="ui_input_btn01" />
						</td>
						<td></td>
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