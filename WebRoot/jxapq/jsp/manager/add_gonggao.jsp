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
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.4.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/jxapq/scripts/My97DatePicker/WdatePicker.js"
	type="text/javascript" defer></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/*
		 * 提交
		 */
		$("#submitbutton").click(function() {
			if (validateForm()) {
				checkFyFhSubmit();
			}
		});

		/*
		 * 取消
		 */
		$("#cancelbutton").click(function() {
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		});

		var result = 'null';
		if (result == 'success') {
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		}
	});
</script>
</head>
<style type="text/css">
tr:hover {
	background-color: #A9C3DD
}
</style>
<body>
	<input type="hidden" name="fyID" value="14458625716623" id="fyID" />
	<div>
		<span id="login_err" class="sty_txt2"><font color="red">${message}</font>
		</span>
	</div>
	<div id="container">
		<div id="nav_links">
			当前位置：系统管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">发布公告</span>
			<div id="page_close">
				<a href="javascript:parent.$.fancybox.close();"> <img
					src="${pageContext.request.contextPath}/jxapq/images/common/page_close.png"
					width="20" height="20" style="vertical-align: text-top;" /> </a>
			</div>
		</div>
		<p>
		<div id="box_top">发布公告</div>
		</p>
		<div class="ui_content">
			<form id="submitForm" name="submitForm"
				action="${pageContext.request.contextPath}/UserServlet?view=addNoticeView&method=addNotice"
				method="post">
				<table cellspacing="0" cellpadding="0" width="100%" align="left"
					border="0">
					<tr>
						<td class="ui_text_rt">发布时间：</td>
						<td class="ui_text_lt"><input name="notice_time ="
							class="ui_input_txt04" data-ideal="date" type="text"
							onClick="WdatePicker()" /></td>
					</tr>
					<tr>
						<td class="ui_text_rt">标题：</td>
						<td class="ui_text_lt"><input type="text" id="fyFh"
							name="notice_title =" value="" class="ui_input_txt04"
							onKeyUp="checkFyFh();" />
						</td>
					</tr>
					<tr>
						<td class="ui_text_rt">公告内容：</td>
						<td class="ui_text_lt"><textarea class="ui_tb_h30"
								name="notice_content =" style="width: 300px; height: 100px;"></textarea>
						</td>
					</tr>
					<tr>
						<td class="ui_text_rt">公告可见：</td>
						<td class="ui_text_lt"><select name="notice_onlyworksee =">
								<option value="1">仅工作人员可见</option>
								<option value="2">都可见</option>
						</select></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td class="ui_text_lt">&nbsp; <input id="submitbutton"
							type="submit" value="发布公告" name="submit" class="ui_input_btn01" />
							&nbsp; <input id="cancelbutton" type="reset" name="reset"
							value="取消" class="ui_input_btn01" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
