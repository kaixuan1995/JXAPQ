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
	<form id="submitForm" name="submitForm" onsubmit = "return getConf()"
		action="${pageContext.request.contextPath}/UserServlet?method=alterInfo&view=alterInfoView"
		method="post">
		<input type="hidden" name="#w#user_id ="
			value="${userList[0].user_id }" />
		<div>
			<span id="login_err" class="sty_txt2"><font color="red">${message}</font>
			</span>
		</div>
		<div id="container">
			<div class="ui_content">

				<table class="table" width="43%" border="0" align="center"
					cellpadding="0" cellspacing="0">
					<tr>
						<td width="24%" class="ui_text_rt">真实姓名：</td>
						<td width="37%" class="ui_text_lt"><input type="text"
							id="realname" name="#s#user_name =" value="${userList[0].user_name }"
							class="ui_input_txt02" />
							<label id="realnameError"></label>
							</td>
						<td width="39%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="msgname" class="ui_text_lt"><span>
						</td>
					</tr>
					<tr>
						<td width="24%" class="ui_text_rt">出生日期：</td>
						<td width="40%" class="ui_text_lt"><input type="text"
							id="date" name="#s#user_birthday ="
							value="${userList[0].user_birthday }" class="ui_input_txt02"
							onClick="WdatePicker()" />
							</td>
						<td width="36%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="msgdate" class="ui_text_lt"><span>
						</td>
					</tr>
					<tr>
						<td width="24%" class="ui_text_rt">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
						<td><select name="#s#user_called =" class="ui_select01">
								<option value="科研院所研究人员"
									<c:if test="${userList[0].user_called=='科研院所研究人员' }"> SELECTED  </c:if>>科研院所研究人员</option>
								<option value="高校教师"
									<c:if test="${userList[0].user_called=='高校教师' }"> SELECTED  </c:if>>高校教师</option>
								<option value="在校本科生"
									<c:if test="${userList[0].user_called=='在校本科生' }"> SELECTED  </c:if>>在校本科生</option>
								<option value="硕士研究生"
									<c:if test="${userList[0].user_called=='硕士研究生' }"> SELECTED  </c:if>>硕士研究生</option>
								<option value="博士或博士后"
									<c:if test="${userList[0].user_called=='博士或博士后' }"> SELECTED  </c:if>>博士或博士后</option>
								<option value="企业研发人员"
									<c:if test="${userList[0].user_called=='企业研发人员' }"> SELECTED  </c:if>>企业研发人员</option>
								<option value="其他"
									<c:if test="${userList[0].user_called=='其他' }"> SELECTED  </c:if>>其他</option>
						</select></td>
						<td width="39%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="" class="ui_text_lt" /><span>
						</td>
					</tr>
					<tr>
						<td class="name">性别：</td>
						<td class="value"><input type="radio" name="#s#user_sex ="
							value="女"
							<c:if test="${userList[0].user_sex=='女' }">checked = "checked"  </c:if> />
							女 <input type="radio" name="#s#user_sex =" value="男"
							<c:if test="${userList[0].user_sex=='男' }">checked = "checked"   </c:if> />
							男</td>
						<td></td>
					</tr>
					<tr>
						<td width="24%" class="ui_text_rt">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							话：</td>
						<td width="37%" class="ui_text_lt"><input type="text"
							id="tel" name="#s#user_tel =" value="${userList[0].user_tel }"
							class="ui_input_txt02" />
							<label id="telError"></label>
							</td>
						<td width="39%" align="left" valign="middle" nowrap
							class="ui_text_lt"><span id="msgphone" class="ui_text_lt"><span>
						</td>
					</tr>
					<tr>
						<td></td>
						<td class="ui_text_lt"><input id="submitbutton" name="submit"
							type="submit" value="提交" class="ui_input_btn01" /> <input
							id="cancelbutton" name="button" type="button" value="取消"
							class="ui_input_btn01" /></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
</html>