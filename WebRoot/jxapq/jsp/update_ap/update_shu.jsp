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
	
	
	$(function(){
		//添加界改变相应函数
		$("#family").change(function(){	
			document.getElementById("family_id").value = document.getElementById("family").value;
		});
	});
	
</script>
</head>
<style type="text/css">
    tr:hover{ background-color:#A9C3DD}
</style>
<body>
 
<div id="container">
  <div id="nav_links"> 当前位置：动植物数据管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">修改属资料</span>
    <div id="page_close"> <a href="javascript:parent.$.fancybox.close();"> <img src="${pageContext.request.contextPath }/jxapq/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/> </a> </div>
  </div>
  <p>
  <div id="box_top">修改属资料</div>
   <div>
  	<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
  		<tr>
          <td class="ui_text_rt">所属分类：</td>
          <td height="42" colspan="2">
          	<select name="kingdom_3id =" id="kingdom" class="ui_select01">
              <option value="null">请选择...</option>
				<c:forEach items="${listKing }" var="Linkage">
					<option value="${Linkage.id }">${Linkage.name }</option>	
				</c:forEach>
            </select>
            <select name="phylum_3id =" id = "phylum" class="ui_select01">
              <option selected="selected">请选择所属门</option>
            </select>
            <select name="class_3id =" id= "clazz" class="ui_select01">
              <option selected="selected">请选择所属纲</option>
            </select>
            <select name="order_3id =" id = "order" class="ui_select01">
              <option selected="selected">请选择所属目</option>
            </select>
			 <select name="family_id_fk =" id = "family" class="ui_select01">
            	<option selected="selected">请选择所属科</option>
          </select>
          </td>
        </tr>
  	</table>
  </div>
  <div class="ui_content">
    <form id="submitForm" name="submitForm" action="${pageContext.request.contextPath }/UpdateServlet?method=update&view=updateShuView" method="post">
      <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
        <tr>
          <td class="ui_text_rt">学名：</td>
          <td class="ui_text_lt"><input type="text" name="#s#fucus_sname =" value="${list.get(0).fucus_sname }" class="ui_input_txt04"/>
          <input type="text" hidden="" name="#w#fucus_id =" value="${list.get(0).fucus_id }" class="ui_input_txt04"/>
          <input type="text" hidden="" id="family_id" name="#s#family_id_fk =" value="${list.get(0).family_id_fk }" class="ui_input_txt04"/>
          </td>
        </tr>  
        <tr>
          <td class="ui_text_rt" width="80">中文名：</td>
          <td class="ui_text_lt"><input type="text" name="#s#fucus_cname =" value="${list.get(0).fucus_cname }" class="ui_input_txt04"/>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">英文名：</td>
          <td class="ui_text_lt"><input type="text" name="#s#fucus_ename =" value="${list.get(0).fucus_ename }" class="ui_input_txt04"/>
          </td>
        </tr>
        <c:if test="${userList[0].user_type==3 }">
		  <tr>
          <td class="ui_text_rt">命名人：</td>
          <td class="ui_text_lt"><input type="text" name="#s#fucus_discover =" value="${list.get(0).fucus_discover }" class="ui_input_txt04"/></td>
        </tr>
        </c:if>
        <tr>
          <td class="ui_text_rt">中文拼音：</td>
          <td class="ui_text_lt"><input type="text" name="#s#fucus_spelling =" value="${list.get(0).fucus_spelling }" class="ui_input_txt04"/></td>
        </tr>
        <tr>
          <td class="ui_text_rt">俗名信息：</td>
          <td class="ui_text_lt"><input type="text" name="#s#fucus_commoninfo =" value="${list.get(0).fucus_commoninfo }" class="ui_input_txt04"/></td>
        </tr>
    <c:if test="${userList[0].user_type==3 }"> <!-- 3代表植物 -->    
        <tr>
          <td class="ui_text_rt">子区系类型：</td>
          <td class="ui_text_lt">
          <select name="#s#subreginal_id_fk =" class="ui_select01">
          <c:forEach items="${listSubr }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).subreginal_id_fk }">
          	  		<option value="${Linkage.id }" selected="selected">${Linkage.name }</option>
          	  	</c:when>
          	  	<c:otherwise>
          	  		<option value="${Linkage.id }">${Linkage.name }</option>
          	  	</c:otherwise>
          	  </c:choose>
			  </c:forEach>
           </select>
        </tr>
        </c:if>
        <tr>
          <td class="ui_text_rt">概述：</td>
          <td class="ui_text_lt"><textarea name="#s#fucus_summarize =" class="ui_tb_h30" style="width: 483px; height: 153px;">${list.get(0).fucus_summarize }</textarea>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">参考文献：</td>
          <td class="ui_text_lt"><textarea name="#s#fucus_literature =" class="ui_tb_h30" style="width: 483px; height: 153px;">${list.get(0).fucus_literature }</textarea>
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
