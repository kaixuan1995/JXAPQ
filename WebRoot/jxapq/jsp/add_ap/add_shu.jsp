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
<script type="text/javascript" charset="utf-8">
	function submit() {
		if(!getConf()){//在校验表单时不符合的字段，不能提交
			return;
		}
		getLevel();
		
	    $.ajax({
	        url: "${pageContext.request.contextPath }/UpdateServlet?method=add2&view=addShuView", type: "POST",
	        data: $('#submitDiv :text,hidden,textarea,select'),
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
	
	function removeText() {
		document.getElementById("fucus_sname").value = "";
		document.getElementById("fucus_cname").value = "";
		document.getElementById("fucus_ename").value = "";
		document.getElementById("fucus_spelling").value = "";
		document.getElementById("fucus_commoninfo").value = "";
		document.getElementById("fucus_summarize").value = "";
		document.getElementById("fucus_literature").value = "";
		if(document.getElementById("fucus_discover") != null) {
			document.getElementById("fucus_discover").value = "";
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

		var familyIndex = document.getElementById("family").selectedIndex;
		var family = document.getElementById("family").options[familyIndex].text;
		document.getElementById("fucus_level").value = kingdom+"--"+phylum+"--"+clazz+"--"+order+"--"+family;
	};
	
</script>
</head>
<style type="text/css">
    tr:hover{ background-color:#A9C3DD}
</style>
<body>
<input type="hidden" name="fyID" value="14458625716623" id="fyID"/>
	
  <p>
  <div id="box_top">新增属    <a href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=importShu&sign=false">导入属模板</a></div>
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
  <div class="ui_content" id="submitDiv">
      <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
        <tr>
          <td class="ui_text_rt">学名：</td>
          <td class="ui_text_lt">
          <input type="text" id="fucus_sname" name="fucus_sname ="  class="ui_input_txt04"/>
          <input type="text" hidden="" id="fucus_level" name="fucus_level ="  class="ui_input_txt04"/>
          </td>
        </tr>
      <c:if test="${userList[0].user_type==3 }"><!-- 动植物区分！！9.16会议 -->
		  <tr>
          <td class="ui_text_rt">命名人：</td>
          <td class="ui_text_lt"><input type="text" id="fucus_discover" name="fucus_discover ="  class="ui_input_txt04"  onKeyUp="checkFyFh();"/></td>
        </tr>
        </c:if>
        <tr>
          <td class="ui_text_rt" width="80">中文名：</td>
          <td class="ui_text_lt"><input type="text" id="fucus_cname" name="fucus_cname ="  class="ui_input_txt04"/>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">英文名：</td>
          <td class="ui_text_lt"><input type="text" id="fucus_ename" name="fucus_ename ="   class="ui_input_txt04"/>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">中文拼音：</td>
          <td class="ui_text_lt"><input type="text" id="fucus_spelling" name="fucus_spelling ="  class="ui_input_txt04" onKeyUp="checkFyFh();"/></td>
        </tr>
        <tr>
          <td class="ui_text_rt">俗名信息：</td>
          <td class="ui_text_lt"><input type="text" id="fucus_commoninfo" name="fucus_commoninfo ="   class="ui_input_txt04"  onKeyUp="checkFyFh();"/></td>
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
          <td class="ui_text_lt"><textarea id="fucus_summarize" name="fucus_summarize =" style="width: 483px; height: 153px;"></textarea>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">参考文献：</td>
          <td class="ui_text_lt"><textarea id="fucus_literature" name="fucus_literature =" class="ui_tb_h30" style="width: 483px; height: 153px;"></textarea>
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
<div style="display:none">
  <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
</div>
</body>
</html>
