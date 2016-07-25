<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
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
	$(document)
			.ready(
					function() {
						//新邮箱
						$("#email")
								.change(
										function() {
											var email = $(this).val();
											var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
											if (!reg.test(email)) {
												$("#msgemail").show();
												$("#msgemail")
														.html(
																"<b>邮箱格式错误&nbsp&nbsp&nbsp</b>")
														.css(
																{
																	"border" : "1px solid red"
																});
											} else {
												$("#msgemail").hide();
											}
										});
						$("#code")
								.change(
										function() {
											var code = $(this).val();
											var reg = /^(\d{6}$)+/;
											if (!reg.test(code)) {
												$("#msgcode").show();
												$("#msgcode")
														.html(
																"<b>验证码必须是6位数字&nbsp&nbsp&nbsp</b>")
														.css(
																{
																	"border" : "1px solid red"
																});
											} else {
												$("#msgcode").hide();
											}
										});

						$("#yzmbutton")
								.click(
										function() {
											var user_email = $.trim($("#email")
													.val());
											if (user_email == "") {
												alert("请输入正确的邮箱！");
											} else {
												//计时器开始
												sendMessage();
												var url = "/JXAPQ/UserServlet?method=alterCode&view=alterCodeView";
												var user_id = $("#user_id")
														.val();
												var args = {
													"user_email =" : user_email,
													"user_id =" : user_id,
													"time" : new Date()
												};
												$.post(url, args,
														function(data) {
															if (data == 1) {
																alert("发送成功");
															} else {
																alert("发送失败");
															}
														});
											}
										});

						function sendMessage() {
							curCount = 60;
							// 设置button效果，开始计时
							$("#yzmbutton").attr("disabled", "true");
							$("#yzmbutton").val(curCount + "秒后可重发");
							InterValObj = window.setInterval(SetRemainTimeh,
									1000); // 启动计时器，1秒执行一次
						}

						function SetRemainTimeh() {
							if (curCount == 0) {
								window.clearInterval(InterValObj);// 停止计时器
								$("#yzmbutton").removeAttr("disabled");// 启用按钮
								$("#yzmbutton").val("重新发送");
							} else {
								curCount--;
								$("#yzmbutton").val(curCount + "秒后可重发");
							}
						}
						function checkemail() {
							var email = $("#email").val();
							var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
							if (!reg.test(email)) {
								return false;
							} else {
								return true;
							}
						}
						function checkcode() {
							var code = $("#code").val();
							var reg = /^(\d{6}$)+/;
							if (!reg.test(code)) {
								return false;
							} else {
								return true;
							}
						}
						//提交
						$("#submitbutton").click(function() {
							var email = $("#email").val();
							var code = $("#code").val();
							if (!checkemail()) {
								art.dialog({
									icon : 'error',
									title : '友情提示',
									drag : false,
									resize : false,
									content : '邮箱格式错误',
									ok : true,
								});
								return false;
							}
							if (!checkcode()) {
								art.dialog({
									icon : 'error',
									title : '友情提示',
									drag : false,
									resize : false,
									content : '请输入含有6位数字的验证码',
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
	<form id="submitForm" name="submitForm" onsubmit="return getConf()"
		action="${pageContext.request.contextPath}/UserServlet?view=queryEmailView&method=queryEmail"
		method="post">
		<div>
			<span id="login_err" class="sty_txt2"><font color="red">${message}</font>
			</span>
		</div>
		<div id="container">
			<div class="ui_content">
				<table class="table" width="43%" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<input type="hidden" id="user_id" name="#w#user_id ="
						value="${userList[0].user_id}" />
					<tr>
						<td width="24%" class="ui_text_rt">新邮箱：</td>
						<td width="40%" class="ui_text_lt"><input type="text"
							id="email" name="#s#user_email =" value="" class="ui_input_txt02" />
							<label id="emailError"></label>
						</td>
						<td width="36%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="msgemail" class="ui_text_lt"></span>
						</td>

					</tr>
					<tr>
						<td class="ui_text_rt">验证码：</td>
						<td class="ui_text_lt"><input type="text" id="code"
							name="#w#user_code =" value="" class="ui_input_txt02" /></td>
						<td><span id="msgcode" class="ui_text_lt"></span>
						</td>
					</tr>
					<tr>
						<td></td>
						<td class="ui_text_lt"><input id="submitbutton" type="submit"
							value="提交" class="ui_input_btn01" /> <input id="cancelbutton"
							type="button" value="取消" class="ui_input_btn01" /></td>
						<td><input id="yzmbutton" type="button" value="获取验证码"
							class="ui_input_btn01" /></td>
					</tr>
				</table>
			</div>
		</div>
	</form>

</body>
</html>