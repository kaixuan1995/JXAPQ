<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>信息管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="scripts/jquery/jquery-1.7.1.js"></script>
<link rel="stylesheet"type="text/css"
href="${pageContext.request.contextPath}/jxapq/style/authority/basic_layout.css" >
<script type="text/javascript"
src="${pageContext.request.contextPath}/jxapq/style/authority/common_style.css"></script>
<script type="text/javascript"
src="${pageContext.request.contextPath}/jxapq/scripts/authority/commonAll.js"></script>
<script type="text/javascript"
src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
src="${pageContext.request.contextPath}/jxapq/scripts/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
src="${pageContext.request.contextPath}/jxapq/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
$(document).ready(function() {
	function check(){
		var name = $("#name").val();
		var date = $("#date").val();
		if(name==""||data==""){
			return false;
		}else{
			return true;
		}
	}

	//提交
	$("#submitbutton").click(function() {
		if(!check()){
			art.dialog({icon:'error', title:'友情提示', drag:false, resize:false, content:'请输入真实姓名或者出生日期', ok:true,});
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
<form id="submitForm" name="submitForm" action="/xngzf/archives/initFangyuan.action" method="post">
	<div id="container">
		<div class="ui_content">

			<table class="table" width="43%" border="0" align="center" cellpadding="0"  cellspacing="0">
				<tr>
					<td width="24%" class="ui_text_rt">真实姓名：</td>
					<td width="37%" class="ui_text_lt">
						<input type="text" id="name" name=""  value="" class="ui_input_txt02"/>
					</td>
					<td width="39%" align="left" valign="middle" nowrap class="ui_text_lt"><span id="msgname" class="ui_text_lt"><span></td>					
				</tr>
				<tr>
					<td width="24%" class="ui_text_rt">出生日期：</td>
					<td width="37%" class="ui_text_lt">
						<input type="text" id="date" name=""  value="" class="ui_input_txt02" onClick="WdatePicker()"/>
					</td>
					<td width="39%" align="left" valign="middle" nowrap class="ui_text_lt"><span id="msgdate" class="ui_text_lt"><span></td>					
				</tr>
				<tr>
					<td width="24%" class="ui_text_rt">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
					<td width="37%" class="ui_text_lt">
						<select name=" professional" class="ui_select01">
							<option value="科研院所研究人员">科研院所研究人员</option>
							<option value="高校教师">高校教师</option>
							<option value="在校本科生">在校本科生</option>
							<option value="硕士研究生">硕士研究生</option>
							<option value="博士或博士后">博士或博士后</option>
							<option value="企业研发人员">企业研发人员</option>
							<option value="其他">其他</option>
							//<c:if test="${requestScope.user.degree=='其他' }"> SELECTED  </c:if> 
						</select>
					</td>
					<td width="39%" align="left" valign="middle" nowrap class="ui_text_lt"><span id="" class="ui_text_lt"><span></td>					
				</tr>
				<tr>
					<td width="24%" class="ui_text_rt">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
					<td width="37%" class="ui_text_lt">
						<input type="radio" name="sex" value="男" checked>男
						<input type="radio" name="sex" value="女">女
					</td>
					<td width="39%" align="left" valign="middle" nowrap class="ui_text_lt"><span id="" class="ui_text_lt"><span></td>					
				</tr>
				<tr>
					<td width="24%" class="ui_text_rt">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	话：</td>
					<td width="37%" class="ui_text_lt">
						<input type="text" id="phone" name=""  value="" class="ui_input_txt02"/>
					</td>
					<td width="39%" align="left" valign="middle" nowrap class="ui_text_lt"><span id="msgphone" class="ui_text_lt"><span></td>					
				</tr>
				<tr>
					<td></td>
					<td class="ui_text_lt">
						<input id="submitbutton" type="submit" value="提交" class="ui_input_btn01"/>
						<input id="cancelbutton" type="button" value="取消" class="ui_input_btn01"/>
					</td><td></td>
				</tr>
			</table>
		</div>
	</div>
</form>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>