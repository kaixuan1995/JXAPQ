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
		var protection_id_fk = document.getElementById("protection_id_fk").value
	    $.ajax({
	        url: "${pageContext.request.contextPath }/UpdateServlet?method=add2&view=addSpecies_protectionView&species_id_fk %3D="+species_id_fk+" &protection_id_fk %3D="+protection_id_fk, type: "POST",
	        success: function(data){
	        	if("\"添加信息成功\"" == data) {
	        		alert(data);
	        	}else {
	        		alert("添加信息失败");
	        	}
	        },
	    });
	    return false;
	  
	};
	
	if('${message}' != "") {
		alert('${message}');
	}
	
</script>
</head>
<body>
   <div id="box_top">完善保护区信息
      
			新增种 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=importZhong&sign=false">导入种模板</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_species_protection&sign=protection">完善保护区信息</a>
			&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_species_dynamic&sign=dynamic">完善种群动态</a>
			&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_species_distribute&sign=town">完善省内分布</a>
			&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="${pageContext.request.contextPath}/jxapq/jsp/add_ap/add_tupian.jsp">完善物种图片</a>
		    &nbsp;&nbsp;&nbsp;&nbsp;<a
		        href="${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_species_yazhong&sign=yazhong">完善亚种信息</a>
				
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
          <td><input type="hidden" id="species_id" value="${species_id }"></td>
          <td class="ui_text_rt">保护区：</td>
          <td class="ui_text_lt">
          <select name="protection_id_fk =" id="protection_id_fk">
          	<c:forEach items="${listProt }" var="Linkage">
          		<option value="${Linkage.id }">${Linkage.name }</option>
          	</c:forEach>
          </select>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td class="ui_text_lt">&nbsp;
            <input  type="submit" onclick="submit()" value="提交" class="ui_input_btn01"/>
            &nbsp;
            <input  type="reset" value="取消" class="ui_input_btn01"/>
          </td>
        </tr>
      </table>
  </div>
  </body>
</html>
