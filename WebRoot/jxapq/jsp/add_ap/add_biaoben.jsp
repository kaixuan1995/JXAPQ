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
	}
	
</script>
</head>
<style type="text/css">
    tr:hover{ background-color:#A9C3DD}
</style>
<body>
<input type="hidden" name="fyID" value="14458625716623" id="fyID"/>
<div id="container">
  <div id="nav_links"> 当前位置：动植物数据管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">新增标本</span>
    <div id="page_close"> <a href="javascript:parent.$.fancybox.close();"> <img src="${pageContext.request.contextPath}/jxapq/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/> </a> </div>
  </div>
  <p>
  <div id="box_top">新增标本</div>
  </p>
  <div class="ui_content">
    <form id="submitForm" name="submitForm" onsubmit="return getConf()" action="${pageContext.request.contextPath}/UpdateServlet?method=add&view=addBiaobenView" method="post">
	
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
            <select name="class_3id =" id = "clazz" class="ui_select01">
              <option selected="selected">请选择所属纲</option>
            </select>
            <select name="order_3id =" id = "order" class="ui_select01">
              <option selected="selected">请选择所属目</option>
            </select>
			 <select name="family_3id =" id="family" class="ui_select01">
           		<option selected="selected">请选择所属科</option>
          </select>
		   <select name="fucus_3id =" id="fucus" class="ui_select01">
            <option selected="selected">请选择所属的属</option>
          </select>
		  <select name="species_id_fk =" id="species" class="ui_select01">
             <option selected="selected">请选择所属种</option>
          </select>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">采集地点：</td>
		  <td height="42" colspan="2"><input type="text" placeholder="详细地址" id="" name="sample_place =" value="" class="ui_input_txt04"/>
          
          </td>
         
        </tr>
		  <tr>
          <td class="ui_text_rt">采集时间：</td>
          <td class="ui_text_lt"><input type="text" id="fyFh" placeholder="XXXX-XX-XX"id="sample_time" name="sample_time ="  value="" class="ui_input_txt04"  onKeyUp="checkFyFh();"/>
          <label id="sample_timeError"></label>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt" width="80">采集人：</td>
          <td class="ui_text_lt"><input type="text" id="fyZldz" id="sample_discover"name="sample_discover =" value="" class="ui_input_txt04"/>
           <label id="sample_discoverError"></label>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">鉴定人：</td>
          <td class="ui_text_lt"><input type="text" id="fyCh" id="sample_identifier"name="sample_identifier =" value=""  class="ui_input_txt04"/>
          <label id="sample_identifierError"></label>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">鉴定时间：</td>
          <td class="ui_text_lt"><input type="text" placeholder="XXXX-XX-XX" id="fyFh"id="sample_identime" name="sample_identime ="  value="" class="ui_input_txt04" onKeyUp="checkFyFh();"/>
           <label id="sample_identimeError"></label>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">海拔：</td>
          <td class="ui_text_lt"><input type="text" id="fyFh" name="sample_altitude ="  value="" class="ui_input_txt04"  onKeyUp="checkFyFh();"/></td>
        </tr>
        <tr>
          <td class="ui_text_rt">描述：</td>
          <td class="ui_text_lt"><textarea name="sample_summarize =" class="ui_tb_h30" style="width: 483px; height: 153px;"></textarea>
          </td>
        </tr>
		 <tr>
          <td class="ui_text_rt">备注：</td>
          <td class="ui_text_lt"><textarea name="sample_comment =" class="ui_tb_h30" style="width: 483px; height: 153px;"></textarea>
          </td>
        </tr>
    
       
        
        <tr>
          <td>&nbsp;</td>
          <td class="ui_text_lt">&nbsp;
            <input id="submitbutton" type="submit" value="提交" class="ui_input_btn01"/>
            &nbsp;
            <input id="cancelbutton" type="reset" value="取消" class="ui_input_btn01"/>
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
<div style="display:none">
  <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
</div>
</body>
</html>
