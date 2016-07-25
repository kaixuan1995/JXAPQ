<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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

		$("#cancelbutton").click(function() {
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		});
	
		$("#submitbutton").click(function(){
			/* $('#foreign_key_value').val($('#species_level').val());  */
			$('#importForm').submit(); 	
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
	
	function downloadTemplate(file){
		self.location="${pageContext.request.contextPath}/UtilServlet?method=downloadTemplate&filename="+file;	
	}
</script>
</head>
<style type="text/css">
    tr:hover{ background-color:#A9C3DD}
</style>
  </head>
  <body>
  <p>
  <div id="box_top">批量导入门
  <input type="button"  value="下载模板" class="ui_input_btn01" onclick='downloadTemplate("门模板.xls")'/> &nbsp;
  </div>
  </p>
 <div class="ui_content">
			<form id="importForm" name="myForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/UtilServlet?method=importData">
				<input type='hidden' name="voName" value="addMenView" />
				<table cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
					<tr>
						<td class="ui_text_rt">所属界：</td>
						<td class="ui_text_lt">
							<select id="foreign_key_value" name="foreign_key_value" class="ui_select01">
									<option value="null">请选择...</option>
									<c:forEach items="${list }" var="Linkage">
									<option value="${Linkage.id }">${Linkage.name }</option>	
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td height="37" class="ui_text_rt">门文件：</td>
						<td class="ui_text_lt">
							<input type="file" name="file" onKeyUp="checkFyFh();" />
						</td>
					</tr>
					<tr>
						<td height="40">&nbsp;</td>
						<td class="ui_text_lt">
							<input id="submitbutton" type="button" value="提交" class="ui_input_btn01" /> &nbsp; 
							<input id="cancelbutton" type="button" value="取消" class="ui_input_btn01" />
						</td>
					</tr>
				</table>
			</form>
		</div>
  </body>
</html>
