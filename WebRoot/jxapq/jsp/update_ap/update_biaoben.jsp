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
			
		});
		
		/*
		 * 取消
		 */
		$("#cancelbutton").click(function() {
			
		});
		
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
  <div id="nav_links"> 当前位置：动植物数据管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">修改标本信息</span>
    <div id="page_close"> <a href="javascript:parent.$.fancybox.close();"> <img src="${pageContext.request.contextPath }/jxapq/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/> </a> </div>
  </div>
  <p>
  <div id="box_top">修改标本资料</div>
  ${list[0].sample_summarize }哈哈哈哈哈哈
  <div class="ui_content">
    <form id="submitForm" onsubmit="return getConf()"  name="submitForm" action="${pageContext.request.contextPath }/UpdateServlet?method=update&view=updateBiaobenView" method="post">
     <c:forEach var="Sample" items="${list }" varStatus="status">
      <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
		  <tr>
          <td class="ui_text_rt">采集时间：</td>
          <td class="ui_text_lt">
          <input type="text" id="sample_time" name="#s#sample_time ="  value="${Sample.sample_time }" class="ui_input_txt04"  />
          <input type="text" hidden="hidden" id="sample_id" name="#w#sample_id ="  value="${Sample.sample_id }" class="ui_input_txt04"  />
          <label id="sample_timeError"></label>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt" width="80">采集人：</td>
          <td class="ui_text_lt"><input type="text" id="sample_discover" name="#s#sample_discover =" value="${Sample.sample_discover }" class="ui_input_txt04"/>
          <label id="sample_discoverError"></label>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">鉴定人：</td>
          <td class="ui_text_lt"><input type="text" id="sample_identifier" name="#s#sample_identifier =" value="${Sample.sample_identifier }"  class="ui_input_txt04"/>
          <label id="sample_identifierError"></label>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">鉴定时间：</td>
          <td class="ui_text_lt"><input type="text" id="sample_identime" name="#s#sample_identime ="  value="${Sample.sample_identime }" class="ui_input_txt04" />
          <label id="sample_identimeError"></label>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">海拔：</td>
          <td class="ui_text_lt"><input type="text" id="fyFh" name="#s#sample_altitude ="  value="${Sample.sample_altitude }" class="ui_input_txt04"   /></td>
        </tr>
        <tr>
          <td class="ui_text_rt">概述：</td>
          <td class="ui_text_lt"><textarea name="#s#sample_summarize =" class="ui_tb_h30" style="width: 483px; height: 153px;">${Sample.sample_summarize }</textarea>
          </td>
        </tr>
		 <tr>
          <td class="ui_text_rt">备注：</td>
          <td class="ui_text_lt"><textarea name="#s#sample_comment =" style="width: 483px; height: 153px;">${Sample.sample_comment }</textarea>
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
      </c:forEach>
    </form>
  </div>
</div>
</body>
</html>
