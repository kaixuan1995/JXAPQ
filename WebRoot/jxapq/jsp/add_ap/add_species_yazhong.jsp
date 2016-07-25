<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		var species_id_fk = document.getElementById("species_id").value;
		if(species_id_fk == "") {
			species_id_fk = document.getElementById("species").value;
		}
	    $.ajax({
	        url: "${pageContext.request.contextPath }/UpdateServlet?method=add2&view=addSpecies_Yazhong&species_id_fk %3D="+species_id_fk, type: "POST",
	        data: $('#submitDiv :text,select'),
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
		document.getElementById("subspecies_addword").value ="";
		document.getElementById("subspecies_discover").value ="";
	}
	if('${message}' != "") {
		alert('${message}');
	}
	
</script>
</head>
<body>
   <div id="box_top">完善种群动态信息
			新增种 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=importYaZhong&sign=false">导入亚种模板</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_species_protection&sign=protection">完善保护区信息</a>
			&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_species_dynamic&sign=dynamic">完善种群动态</a>
			&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_species_distribute&sign=town">完善省内分布</a>
			&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="${pageContext.request.contextPath}/jxapq/jsp/add_ap/add_tupian.jsp">完善物种图片</a>
   </div>
   <input type="text" hidden="hidden" id="species_id" value="${species_id }">
   <c:if test="${empty species_id}">
   <div>
   	 <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
   		<tr>
          <td class="ui_text_rt">所属分类：</td>
          <td height="42" colspan="2">
          	<select name="kingdom_3id =" id="kingdom" class="ui_select01">
              <option value="null">请选择所属的界</option>
				<c:forEach items="${list }" var="Linkage">
					<option value="${Linkage.id }">${Linkage.name }</option>	
				</c:forEach>
            </select>
            <select name="phylum_3id =" id="phylum" class="ui_select01">
              <option selected="selected">请选择所属门</option>
            </select>
            <select name="class_3id =" id="clazz" class="ui_select01">
              <option selected="selected">请选择所属纲</option>
            </select>
            <select name="order_3id =" id ="order" class="ui_select01">
              <option selected="selected">请选择所属目</option>
            </select>
			 <select name="family_3id =" id="family" class="ui_select01">
            <option selected="selected">请选择所属科</option>
          </select>
		   <select name="fucus_3id =" id="fucus" class="ui_select01">
            <option selected="selected">请选择所属的属</option>
          </select>
		   <select name="species_id_fk =" id="species" class="ui_select01">
            <option selected="selected">请选择所属的种</option>
          </select>
          </td> 
        </tr>
     </table>
   </div>
   </c:if>
  <div class="ui_content" id="submitDiv">
      <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
        <tr>
          <td class="ui_text_rt">亚种加词</td>
          <td class="ui_text_lt">
        	<input type="text" id="subspecies_addword" name="subspecies_addword =" class="ui_input_txt04" />
          </td>
        </tr>
        <c:if test="${userList[0].user_type==3 }"> <!--3代表植物  动植物区分！！9.16会议 -->
	        <tr>
	          <td class="ui_text_rt">变种命名人</td>
	          <td class="ui_text_lt">
	        	<input type="text" id="subspecies_discover" name="subspecies_discover ="  class="ui_input_txt04" />
	          </td>
	        </tr>
	        <tr>
	          <td class="ui_text_rt">变种符号</td>
	          <td class="ui_text_lt">
	          <select name="subspeciessign_fk =">
	          	<c:forEach items="${listSubs }" var="Linkage">
	          		<option value="${Linkage.id }">${Linkage.name }</option>
	          	</c:forEach>
	          </select>
	          </td>
	        </tr>
        </c:if>
        <tr>
          <td>&nbsp;</td>
          <td class="ui_text_lt">&nbsp;
            <input  type="button" onclick="submit()" value="提交" class="ui_input_btn01"/>
            &nbsp;
            <input  type="reset" value="取消" class="ui_input_btn01"/>
          </td>
        </tr>
      </table>
  </div>
  </body>
</html>