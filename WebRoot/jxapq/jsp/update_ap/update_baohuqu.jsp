<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>江西省动植物信息检索系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="${pageContext.request.contextPath }/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
<link href="${pageContext.request.contextPath }/jxapq/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/jxapq/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/jxapq/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jxapq/scripts/jquery/jquery-1.4.4.min.js"></script>
<script src="${pageContext.request.contextPath }/jxapq/scripts/My97DatePicker/WdatePicker.js" type="text/javascript" defer></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/jxapq/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
	$(document).ready(function() {
		/*
		 * 提交
		 */
		$("#submitbutton").click(function() {
			if(validateForm()){
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
		if(result =='success'){
			/**  关闭弹出iframe  **/
			window.parent.$.fancybox.close();
		}
	});
	
	if('${message}' != "") {
		alert('${message}');
	};
</script>
</head>
<style type="text/css">
    table{  line-height:25px;}
    th{ border:1px solid #aaa}
    td{  text-align:center;border:1px solid #aaa} 
    tr:hover{ background-color:#A9C3DD}
</style>
<body>
<input type="hidden" name="fyID" value="14458625716623" id="fyID"/>
<div id="container">
  <div id="nav_links"> 当前位置：系统管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">修改保护区</span>
    <div id="page_close"> <a href="javascript:parent.$.fancybox.close();"> <img src="${pageContext.request.contextPath }/jxapq/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/> </a> </div>
  </div>
  <p>
  <div id="box_top">修改保护区</div>
  <div class="ui_content">
    <form id="submitForm" onsubmit="return getConf()" name="submitForm" action="${pageContext.request.contextPath }/UpdateServlet?method=update&view=updateBaohuquView" method="post">
      <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
        <tr>
          <td class="ui_text_rt">保护区名称：</td>
          <td class="ui_text_lt">
          <input type="text" id="protection_name" name="#s#protection_name ="  value="${list.get(0).protection_name }" class="ui_input_txt04"/>
          <label id="protection_nameError"></label>
          <input type="text" hidden="" name="#w#protection_id ="  value="${list.get(0).protection_id }" class="ui_input_txt04"/>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td class="ui_text_lt">&nbsp;
            <input id="submitbutton" type="submit" value="确认修改" class="ui_input_btn01"/>
            &nbsp;
            <input id="cancelbutton" type="reset" value="取消" class="ui_input_btn01"/>
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
</body>
</html>
