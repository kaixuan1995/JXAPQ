<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>江西省动植物信息检索系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
<link href="${pageContext.request.contextPath}/jxapq/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/jxapq/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.4.4.min.js"></script>
<script src="${pageContext.request.contextPath}/jxapq/scripts/My97DatePicker/WdatePicker.js" type="text/javascript" defer></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
	$(document).ready(function() {
 		/*
		 * 提交
		 */
/* 		$("#submitbutton").click(function() {
			if(validateForm()){
				checkFyFhSubmit();
			}
		});  */
		
		/*
		 * 取消
		 */
		$("#cancelbutton").click(function() {
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		});
		var result = 'null';
		if(result =='success'){
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		}
	});	
	
	if('${message}' != "") {
		alert('${message}');
	}

</script>
</head>
<style type="text/css">
    tr:hover{ background-color:#A9C3DD}
</style>
<body>

	<input type="hidden" name="fyID" value="14458625716623" id="fyID"/>
	<div id="container">
		<p><div id="box_top">新增门     <a href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=importMen&sign=false">导入门模板</a></div>
		<div class="ui_content">
		<form id="submitForm" onsubmit="return getConf()" name="submitForm" action="${pageContext.request.contextPath}/UpdateServlet?method=add&view=addMenView" method="post">
			<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
				<tr>
					<td class="ui_text_rt">所属界：</td>
					<td class="ui_text_lt">
						<select name="kingdom_id_fk =" class="ui_select01">
							<option value="null">请选择...</option>
							<c:forEach items="${list }" var="Linkage">
								<option value="${Linkage.id }">${Linkage.name }</option>	
							</c:forEach>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt">学名：</td>
					<td class="ui_text_lt">
						<input type="text" id="sname" name="phylum_sname =" value="" class="ui_input_txt02"/>
					 <label id="snameError"></label>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt" width="80">中文名：</td>
					<td class="ui_text_lt">
						<input type="text" id="cname" name="phylum_cname =" value="" class="ui_input_txt02"/>
					 <label id="cnameError"></label>
					</td>
				</tr>
				
				<tr>
					<td class="ui_text_rt">英文名：</td>
					<td class="ui_text_lt">
						<input type="text" id="ename" name="phylum_ename =" value=""  class="ui_input_txt02"/>
					 <label id="enameError"></label>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">中文拼音：</td>
					<td class="ui_text_lt">
						<input type="text" id="spelling" name="phylum_spelling ="  value="" class="ui_input_txt02" onkeyup="checkFyFh();"/>
						<label id="spellingError"></label>
					</td>
				</tr>
				<tr>
					<td class="ui_text_rt">概述：</td>
					<td class="ui_text_lt">&nbsp;<textarea id="summarize" name="phylum_summarize =" class="ui_tb_h30" style="width: 483px; height: 153px;"></textarea> 
					<label id="summarizeError"></label>
				  	</td>
				</tr>	
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">
						&nbsp;<input id="submitbutton" type="submit" value="提交" class="ui_input_btn01"/>
						&nbsp;<input id="cancelbutton" type="reset" value="取消" class="ui_input_btn01"/>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>