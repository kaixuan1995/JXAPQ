<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	}
	
	function delele(value, del) {
		var url = "${pageContext.request.contextPath }/UpdateServlet?method=delete&view=deleteBaohuquView&protection_id %3D="+value;
		$.getJSON(url,function(data){
			if(data == "删除信息成功") {
				var d = del.parentNode.parentNode;
				d.parentNode.removeChild(d);
			}else if(data != "") {
				alert(data);
			}
			
		});	
	}
	
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
  <div id="nav_links"> 当前位置：系统管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">保护区管理</span>
    <div id="page_close"> <a href="javascript:parent.$.fancybox.close();"> <img src="${pageContext.request.contextPath}/jxapq/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/> </a> </div>
  </div>
  <p>
  <div id="box_top">新增保护区</div>
  <div class="ui_content">
    <form id="submitForm" name="submitForm" action="${pageContext.request.contextPath}/UpdateServlet?method=add&view=addPaohuquView" method="post" onsubmit="return getConf()">
      <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
        <tr>
          <td class="ui_text_rt">保护区名称：</td>
          <td class="ui_text_lt"><input type="text" id="fyFh"id="protection_name" name="protection_name ="class="ui_input_txt04" onKeyUp="checkFyFh();"/>
          <label id="protection_nameError"></label>
          </td>
        	
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td class="ui_text_lt">&nbsp;
            <input id="submitbutton" type="submit" value="确认" class="ui_input_btn01"/>
            &nbsp;
            <input id="cancelbutton" type="reset" value="取消" class="ui_input_btn01"/>
          </td>
        </tr>
      </table>
    </form>
  </div>
   <div id="box_top"><a href="${pageContext.request.contextPath }/QueryServlet?method=queryInfor&view=getBaohuquInfor">查看已有保护区</a></div>
  <div class="ui_content">
      <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="1"  >
		<tr>
          <td  width="10%" >编号</td>
          <td  width="80%" >保护区名称</td>
		  <td width="10%" >操作类型</td>
        </tr>
        <c:forEach items="${list }" var="protection">
        <tr>
          <td width="10%" align="center" >${protection.protection_id }</td>
          <td width="80%" align="center" >${protection.protection_name}</td>
		  <td class="ui_text_lt"width="10%" >&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="delele(${protection.protection_id }, this)" >删除</a>&nbsp;&nbsp;
		  <a href="${pageContext.request.contextPath }/QueryServlet?method=querySelf&view=queryBaohuquSelf&value=${protection.protection_id }">修改</a></td>
        </tr>
       </c:forEach>
      </table>
  </div>
</div>
<div style="display:none">
  <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='UTF-8'></script>
</div>
</body>
</html>
