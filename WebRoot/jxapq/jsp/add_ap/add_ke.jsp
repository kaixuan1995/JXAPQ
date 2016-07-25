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
		var order_id_fk = document.getElementById("order").value;
	    $.ajax({
	        url: "${pageContext.request.contextPath }/UpdateServlet?method=add2&view=addKeView&order_id_fk %3D="+order_id_fk, type: "POST",
	        data: $('#submitDiv :text,textarea'),
	        success: function(data){
	        	if("\"添加信息成功\"" == data) {
	        		alert(data);
	        		removeText();
	        	}else {
	        		alert("添加信息失败");
	        	}
	        },
	    });
	    return false;
	  
	};
	
	function removeText(){
		document.getElementById("family_sname").value = "";
		document.getElementById("family_cname").value = "";
		document.getElementById("family_ename").value = "";
		document.getElementById("family_spelling").value = "";
		document.getElementById("family_commonInfo").value = "";
		document.getElementById("family_summarize").value = "";
		document.getElementById("family_notes").value = "";
		document.getElementById("family_literature").value = "";
		if(document.getElementById("family_enamee").value != null){
			document.getElementById("family_enamee").value ="";
		}
		if(document.getElementById("family_cnamee").value != null){
			document.getElementById("family_cnamee").value ="";
		}
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
		
		var orderIndex = document.getElementById("order").selectedIndex;
		var order = document.getElementById("order").options[orderIndex].text;
		document.getElementById("family_level").value=kingdom+"--"+phylum+"--"+clazz+"--"+order;
	};
</script>
</head>
<style type="text/css">
    tr:hover{ background-color:#A9C3DD}
</style>
<body>
<input type="hidden" name="fyID" value="14458625716623" id="fyID"/>
<div id="container">
  <div id="box_top">新增科    <a href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=importKe&sign=false">导入科模板</a></div>
  <div>
  	<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
  		<tr>
          <td class="ui_text_rt">所属分类：</td>
          <td height="42" colspan="2" >
          	<select name="kingdom_3id =" id="kingdom" class="ui_select01">
              <option value="null">请选择...</option>
				<c:forEach items="${list }" var="Linkage">
					<option value="${Linkage.id }">${Linkage.name }</option>	
				</c:forEach>
            </select>
            <select name="phylum_3id =" id ="phylum" class="ui_select01">
              <option selected="selected">请选择所属门</option>
            </select>
            <select name="class_3id =" id="clazz" class="ui_select01">
            	<option selected="selected">请选择所属纲</option>
            </select>
            <select name="order_id_fk =" id="order" class="ui_select01">
              <option selected="selected">请选择所属目</option>
            </select>
          </td>
        </tr>
     </table>
  </div>
  <div class="ui_content" id="submitDiv">
      <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
        <tr>
        <td class="ui_text_lt"><input type="text" hidden="" id="family_level" name="family_level =" class="ui_input_txt04"/>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">学名：</td>
          <td class="ui_text_lt">
          <input type="text" id="family_sname" name="family_sname =" value="" class="ui_input_txt04"/>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt" width="80">中文名：</td>
          <td class="ui_text_lt"><input type="text" id="family_cname" name="family_cname ="  class="ui_input_txt04"/>
          </td>
        </tr>
        <c:if test="${userList[0].user_type==3 }"><!-- 动植物区分！！9.16会议 -->
	        <tr>
	        <td class="ui_text_rt" width="80">中文名(恩格勒系统)：</td>
	          <td class="ui_text_lt"><input type="text" id="family_cnamee" name="family_cnamee ="  class="ui_input_txt04"/>
	          </td>
	        </tr>
        </c:if>
        <tr>
          <td class="ui_text_rt">英文名：</td>
          <td class="ui_text_lt"><input type="text" id="family_ename" name="family_ename ="  class="ui_input_txt04"/>
          </td>
        </tr>
        <c:if test="${userList[0].user_type==3 }"><!-- 动植物区分！！9.16会议 -->
	        <tr>
	        <td class="ui_text_rt">学名(恩格勒系统)：</td>
	          <td class="ui_text_lt"><input type="text" id="family_enamee" name="family_enamee ="  class="ui_input_txt04"/>
	          </td>
	        </tr>
        </c:if>
        <tr>
          <td class="ui_text_rt">中文拼音：</td>
          <td class="ui_text_lt"><input type="text" id="family_spelling" name="family_spelling ="  class="ui_input_txt04" onKeyUp="checkFyFh();"/></td>
        </tr>
        <tr>
          <td class="ui_text_rt">俗名信息：</td>
          <td class="ui_text_lt"><input type="text" id="family_commonInfo" name="family_commonInfo ="   class="ui_input_txt04"  onKeyUp="checkFyFh();"/></td>
        </tr>
	     <c:if test="${userList[0].user_type==3 }"><!-- 动植物区分！！9.16会议 -->
	         <tr>
	          <td class="ui_text_rt">区系类型：</td>
	          <td class="ui_text_lt">
	          <select name="reginal_3id_fk =" id="reginal" class="ui_select01">
	          		<option value="null">请选择...</option>
					<c:forEach items="${list1 }" var="Linkage">
						<option value="${Linkage.id }">${Linkage.name }</option>	
					</c:forEach>
	          </select>
	          <select name="subreginal_id_fk =" id="subreginal" class="ui_select01" style="width: 250px">
	              <option selected="selected">请选择所属的子区系类型</option>
	          </select>
	          </td>
	        </tr>
        </c:if>
        <tr>
          <td class="ui_text_rt">概述：</td>
          <td class="ui_text_lt"><textarea id="family_summarize" name="family_summarize =" class="ui_tb_h30" style="width: 483px; height: 153px;"></textarea>
          </td>
        </tr>
        <tr>
        <td class="ui_text_rt">备注：</td>
          <td class="ui_text_lt"><textarea id="family_notes" name="family_notes =" class="ui_tb_h30" style="width: 483px; height: 153px;"></textarea>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">参考文献：</td>
          <td class="ui_text_lt"><textarea id="family_literature" name="family_literature =" class="ui_tb_h30" style="width: 483px; height: 153px;"></textarea>
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
