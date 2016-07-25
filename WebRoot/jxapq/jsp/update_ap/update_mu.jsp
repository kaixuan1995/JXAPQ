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
    tr:hover{ background-color:#A9C3DD}
</style>
<body>
<input type="hidden" name="fyID" value="14458625716623" id="fyID"/>
<div id="container">
  <div id="nav_links"> 当前位置：动植物数据管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">修改目资料</span>
    <div id="page_close"> <a href="javascript:parent.$.fancybox.close();"> <img src="${pageContext.request.contextPath }/jxapq/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/> </a> </div>
  </div>
  <p>
  <div id="box_top">修改目资料</div>
  <div class="ui_content">
    <form id="submitForm" name="submitForm" onsubmit="return getConf()"  action="${pageContext.request.contextPath }/UpdateServlet?method=update&view=updateMuView" method="post">
      <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
        <tr>
          <td class="ui_text_rt">学名：</td>
          <td class="ui_text_lt"><input type="text" id="sname" name="#s#order_sname =" value="${list.get(0).order_sname}"  class="ui_input_txt02"/>
          <input type="text" hidden="" name="#w#order_id =" value="${list.get(0).order_id}" class="ui_input_txt02"/>
           <label id="snameError"></label>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt" width="80">中文名：</td>
          <td class="ui_text_lt"> <input type="text" id="cname" name="#s#order_cname =" value="${list.get(0).order_cname}" class="ui_input_txt02"/>
         <label id="cnameError"></label>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">英文名：</td>
          <td class="ui_text_lt"><input type="text" id="ename" name="#s#order_ename =" value="${list.get(0).order_ename}" class="ui_input_txt02"/>
          <label id="enameError"></label>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">中文拼音：</td>
          <td class="ui_text_lt"> <input type="text" id="spelling" name="#s#order_spelling =" value="${list.get(0).order_spelling}" class="ui_input_txt02"/>
          <label id="spellingError"></label>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">概述：</td>
          <td class="ui_text_lt">&nbsp;
            <textarea name="#s#order_summarize =" id="summarize" class="ui_tb_h30" style="width: 483px; height: 153px;">${list.get(0).order_summarize }</textarea>
         <label id="summarizeError"></label>
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
