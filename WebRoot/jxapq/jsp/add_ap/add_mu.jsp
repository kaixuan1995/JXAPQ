<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>江西省动植物信息检索系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery.js"></script>
<link href="${pageContext.request.contextPath}/jxapq/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/jxapq/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/Linkage.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.4.4.min.js"></script>
<script src="${pageContext.request.contextPath}/jxapq/scripts/My97DatePicker/WdatePicker.js" type="text/javascript" defer></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
	
	function submit() {
		if(!getConf()){//在校验表单时不符合的字段，不能提交
			return;
		}
		getLevel();
		var class_id_fk = document.getElementById("clazz").value;
	    $.ajax({
	        url: "${pageContext.request.contextPath }/UpdateServlet?method=add2&view=addMuView&class_id_fk %3D="+class_id_fk, type: "POST",
	        data: $('#submitDiv :text,textarea'),
	        success: function(data){
	        	if("\"添加信息成功\"" == data) {
	        		removeText();
	        		alert(data);
	        	}else {
	        		alert("添加信息失败");
	        	}
	        },
	    });
	    return false;
	  
	};
	
	function removeText(){
		document.getElementById("order_sname").value = "";
		document.getElementById("order_cname").value = "";
		document.getElementById("order_ename").value = "";
		document.getElementById("order_spelling").value = "";
		document.getElementById("order_summarize").value = "";
	}
	
	if('${message}' != "") {
		alert('${message}');
	}
	
	
	function getLevel() {
		var kingdomIndex = document.getElementById("kingdom").selectedIndex;
		var kingdom = document.getElementById("kingdom").options[kingdomIndex].text;

		var phylumIndex = document.getElementById("phylum").selectedIndex;
		var phylum = document.getElementById("phylum").options[phylumIndex].text;
		
		var clazzIndex = document.getElementById("clazz").selectedIndex;
		var clazz = document.getElementById("clazz").options[clazzIndex].text;
		document.getElementById("order_level").value=kingdom+"--"+phylum+"--"+clazz;
	};
	
</script>
</head>
<style type="text/css">
    tr:hover{ background-color:#A9C3DD}
</style>
<body>
<input type="hidden" name="fyID" value="14458625716623" id="fyID"/>
<div id="container">
  <div id="nav_links"> 当前位置：动植物数据管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">新增目</span>
    <div id="page_close"> <a href="javascript:parent.$.fancybox.close();"> <img src="${pageContext.request.contextPath}/jxapq/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/> </a> </div>
  </div>
  <div id="box_top">新增目     <a href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=importMu&sign=false">导入目模板</a></div>
  <div>
  	<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
        <tr>
          <td class="ui_text_rt">所属分类：</td>
          <td height="42" colspan="2">
          	<select name="kingdom_3id =" id="kingdom" class="ui_select01">
             	<option value="null">请选择...</option>
				<c:forEach items="${list }" var="Linkage">
					<option value="${Linkage.id }">${Linkage.name }</option>	
				</c:forEach>
            </select>
            <select name="phylum_3id =" id="phylum" class="ui_select01">
              <option selected="selected">请选择所属门</option>
            </select>
            <select name="class_id_fk =" id="clazz" class="ui_select01">
              <option selected="selected">请选择所属纲</option>
            </select>
          </td>
        </tr>
      </table>
  </div>
  <div class="ui_content" id="submitDiv">
      <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
        <tr>
        <td class="ui_text_lt"><input  type="text" hidden="" id="order_level" name="order_level =" class="ui_input_txt04"/>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">学名：</td>
          <td class="ui_text_lt">
          <input type="text" id="order_sname"  name="order_sname =" value="" class="ui_input_txt02"/>
          <input type="hidden" id="class_id_fk1" name="class_id_fk =" value="" class="ui_input_txt02"/>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt" width="80">中文名：</td>
          <td class="ui_text_lt"><input type="text" id="order_cname" name="order_cname =" value="" class="ui_input_txt02"/>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">英文名：</td>
          <td class="ui_text_lt"><input type="text" id="order_ename" name="order_ename =" value=""  class="ui_input_txt02"/>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">中文拼音：</td>
          <td class="ui_text_lt"><input type="text" id="order_spelling" name="order_spelling ="  value="" class="ui_input_txt02" onKeyUp="checkFyFh();"/></td>
        </tr>
        <tr>
          <td class="ui_text_rt">概述：</td>
          <td class="ui_text_lt">&nbsp;
            <textarea id="order_summarize" name="order_summarize =" class="ui_tb_h30" style="width: 483px; height: 153px;"></textarea>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td class="ui_text_lt">&nbsp;
            <input type="button" onclick="submit()" value="提交" class="ui_input_btn01"/>
            &nbsp;
            <input type="reset" value="取消" class="ui_input_btn01"/>
          </td>
        </tr>
      </table>
  </div>
</div>
<div style="display:none">
  <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
</div>
</body>
</html>
