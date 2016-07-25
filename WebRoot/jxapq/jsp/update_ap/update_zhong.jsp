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
		$("#fucus").change(function(){	
			document.getElementById("fucus_id").value = document.getElementById("fucus").value;
		});
	});
	
</script>
</head>
<style type="text/css">
    tr:hover{ background-color:#A9C3DD}
</style>
<body>
<input type="hidden" name="fyID" value="14458625716623" id="fyID"/>
<div id="container">
  <div id="nav_links"> 当前位置：动植物数据管理&nbsp;&nbsp;<span style="color: #1A5CC6;">修改种资料</span>
    <div id="page_close"> <a href="javascript:parent.$.fancybox.close();"> <img src="../../images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/> </a> </div>
  </div>
  <div id="box_top">如果不需要修改，则不要选择下拉列表</div>
   <div>
  	 <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
  		 <tr>
          <td class="ui_text_rt">所属分类：</td>
          <td height="42" colspan="2">
          	<select name="kingdom_3id =" id="kingdom" class="ui_select01">
              <option value="null">请选择所属的界</option>
				<c:forEach items="${listKing }" var="Linkage">
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
		   <select name="fucus_id_fk =" id="fucus" class="ui_select01">
            <option selected="selected">请选择所属的属</option>
          </select>
          </td> 
        </tr>
     </table>
  </div>
  <div id="box_top">修改种资料</div>
  <div class="ui_content">
    <form id="submitForm" name="submitForm" action="${pageContext.request.contextPath }/UpdateServlet?method=update&view=updateZhongView" method="post">
      <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
		<tr>
	 <c:if test="${userList[0].user_type==3 }"> <!-- 3代表植物 -->    
		  <tr>
          <td class="ui_text_rt">命名人：</td>
          <td class="ui_text_lt">
          <input type="text"  name="#s#species_discover =" value="${list.get(0).species_discover}"  class="ui_input_txt04"  />
          <input type="text" hidden=""  name="#w#species_id =" value="${list.get(0).species_id }"   class="ui_input_txt04"  />
          <input type="text" hidden="" id="fucus_id" name="#s#fucus_id_fk =" value="${list.get(0).fucus_id_fk }"   class="ui_input_txt04"  />
          </td>
        </tr>
        </c:if>
        <tr>
          <td class="ui_text_rt" width="80">中文名：</td>
          <td class="ui_text_lt"><input type="text" name="#s#species_cname =" value="${list.get(0).species_cname}" class="ui_input_txt04"/>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">英文名：</td>
          <td class="ui_text_lt"><input type="text" name="#s#species_ename =" value="${list.get(0).species_ename }" class="ui_input_txt04"/>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">中文拼音：</td>
          <td class="ui_text_lt"><input type="text"  name="#s#species_spelling =" value="${list.get(0).species_spelling }"  class="ui_input_txt04" /></td>
        </tr>
        <tr>
          <td class="ui_text_rt">俗名信息：</td>
          <td class="ui_text_lt"><input type="text"  name="#s#species_commoninfo =" value="${list.get(0).species_commoninfo }"  class="ui_input_txt04"  /></td>
        </tr>
        <tr>
          <td class="ui_text_rt">生境：</td>
          <td class="ui_text_lt"><input type="text"  name="#s#species_habitat =" value="${list.get(0).species_habitat }" class="ui_input_txt04"  /></td>
        </tr>
    	<c:if test="${userList[0].user_type==2 }"> <!-- 2代表动物 -->    
	        <tr>
	          <td class="ui_text_rt">习性：</td>
	          <td class="ui_text_lt"><input type="text"  name="#s#species_habit =" value="${list.get(0).species_habit}" class="ui_input_txt04"  /></td>
	        </tr>
	    </c:if>
        <tr>
          <td class="ui_text_rt">种加词：</td>
          <td class="ui_text_lt"><input type="text"  name="#s#species_addword =" value="${list.get(0).species_addword}" class="ui_input_txt04"  /></td>
        </tr>
    	<c:if test="${userList[0].user_type==3 }"> <!-- 3代表植物 -->    
			<tr>
	          <td class="ui_text_rt">异名信息：</td>
	          <td class="ui_text_lt"><input type="text" name="#s#species_synonym =" value="${list.get(0).species_synonym }" class="ui_input_txt04"  /></td>
	        </tr>
	    </c:if>
		<tr>
          <td class="ui_text_rt">国家分布：</td>
          <td class="ui_text_lt"><input type="text"  name="#s#species_nationdist =" value="${list.get(0).species_nationdist }" class="ui_input_txt04"  /></td>
        </tr>
		<tr>
          <td class="ui_text_rt">国内分布：</td>
          <td class="ui_text_lt"><input type="text"  name="#s#species_chinadist =" value="${list.get(0).species_chinadist}" class="ui_input_txt04"  /></td>
        </tr>
         <tr>
          <td class="ui_text_rt">子区系类型：</td>
          <td class="ui_text_lt">
          <select name="#s#subreginal_id_fk =" class="ui_select01">
	          <c:if test="${empty list.get(0).subreginal_id_fk }">
	          	  	<option value="" selected="selected">请选择...</option>
	          </c:if>
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
         <tr>
          <td class="ui_text_rt">国家保护等级：</td>
          <td class="ui_text_lt">
          <select name="#s#species_coupro_fk =" class="ui_select01">
          <c:if test="${empty list.get(0).species_coupro_fk }">
	          	  	<option value="" selected="selected">请选择...</option>
	          </c:if>
          <c:forEach items="${listCoup }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).species_coupro_fk }">
          	  		<option value="${Linkage.id }" selected="selected">${Linkage.name }</option>
          	  	</c:when>
          	  	<c:otherwise>
          	  		<option value="${Linkage.id }">${Linkage.name }</option>
          	  	</c:otherwise>
          	  </c:choose>
			  </c:forEach>
           </select>
        </tr>
      <c:if test="${userList[0].user_type==3 }"> <!-- 3代表植物 -->    
         <tr>
          <td class="ui_text_rt">生活型：</td>
          <td class="ui_text_lt">
          <select name="#s#species_lifetype_fk =" class="ui_select01">
          <c:if test="${empty list.get(0).species_lifetype_fk  }">
	          	  	<option value="" selected="selected">请选择...</option>
	          </c:if>
          <c:forEach items="${listLife }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).species_lifetype_fk }">
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
    <c:if test="${userList[0].user_type==2 }"> <!-- 3代表植物 -->    
         <tr>
          <td class="ui_text_rt">居留型：</td>
          <td class="ui_text_lt">
          <select name="#s#species_resitype_fk =" class="ui_select01">
          <c:if test="${empty list.get(0).species_resitype_fk }">
	          	  	<option value="" selected="selected">请选择...</option>
	          </c:if>
          <c:forEach items="${listResi }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).species_resitype_fk }">
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
    <c:if test="${userList[0].user_type==2 }"> <!-- 2代表动物 -->    
         <tr>
          <td class="ui_text_rt">地理分布型：</td>
          <td class="ui_text_lt">
          <select name="#s#species_geodist_fk =" class="ui_select01">
          <c:if test="${empty list.get(0).species_geodist_fk }">
	          	  	<option value="" selected="selected">请选择...</option>
	          </c:if>
          <c:forEach items="${listGeod }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).species_geodist_fk }">
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
    <c:if test="${userList[0].user_type==2 }"> <!-- 3代表植物 -->    
         <tr>
          <td class="ui_text_rt">饲养状况：</td>
          <td class="ui_text_lt">
          <select name="#s#species_feedState_fk =" class="ui_select01">
          <c:if test="${empty list.get(0).species_feedstate_fk }">
	          	  	<option value="" selected="selected">请选择...</option>
          </c:if>
          <c:forEach items="${listFeed }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).species_feedstate_fk }">
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
    <c:if test="${userList[0].user_type==3 }"> <!-- 3代表植物 -->    
         <tr>
          <td class="ui_text_rt">引种栽培：</td>
          <td class="ui_text_lt">
          <select name="#s#species_intculti_fk =" class="ui_select01">
          <c:if test="${empty list.get(0).species_intculti_fk }">
	          	  	<option value="" selected="selected">请选择...</option>
	          </c:if>
          <c:forEach items="${listIntc }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).species_intculti_fk }">
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
          <td class="ui_text_rt">IUCN红色名录等级：</td>
          <td class="ui_text_lt">
          <select name="#s#species_iucn_fk =" class="ui_select01">
          <c:if test="${empty list.get(0).species_iucn_fk }">
	          	  	<option value="" selected="selected">请选择...</option>
	          </c:if>
          <c:forEach items="${listIucn }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).species_iucn_fk }">
          	  		<option value="${Linkage.id }" selected="selected">${Linkage.name }</option>
          	  	</c:when>
          	  	<c:otherwise>
          	  		<option value="${Linkage.id }">${Linkage.name }</option>
          	  	</c:otherwise>
          	  </c:choose>
			  </c:forEach>
           </select>
        </tr>
         <tr>
          <td class="ui_text_rt">省保护级别：</td>
          <td class="ui_text_lt">
          <select name="#s#species_provpro_fk =" class="ui_select01">
          <c:if test="${empty list.get(0).species_provpro_fk }">
	          <option value="" selected="selected">请选择...</option>
	      </c:if>
          <c:forEach items="${listProv }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).species_provpro_fk }">
          	  		<option value="${Linkage.id }" selected="selected">${Linkage.name }</option>
          	  	</c:when>
          	  	<c:otherwise>
          	  		<option value="${Linkage.id }">${Linkage.name }</option>
          	  	</c:otherwise>
          	  </c:choose>
			  </c:forEach>
           </select>
        </tr>
         <tr>
          <td class="ui_text_rt">CITES保护等级：</td>
          <td class="ui_text_lt">
          <select name="#s#species_cites_fk =" class="ui_select01">
          <c:if test="${empty list.get(0).species_cites_fk }">
	          	  	<option value="" selected="selected">请选择...</option>
	          </c:if>
          <c:forEach items="${listCite }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).species_cites_fk }">
          	  		<option value="${Linkage.id }" selected="selected">${Linkage.name }</option>
          	  	</c:when>
          	  	<c:otherwise>
          	  		<option value="${Linkage.id }">${Linkage.name }</option>
          	  	</c:otherwise>
          	  </c:choose>
			  </c:forEach>
           </select>
        </tr>
         <tr>
          <td class="ui_text_rt">中国红色名录等级：</td>
          <td class="ui_text_lt">
          <select name="#s#species_credpro_fk =" class="ui_select01">
          <c:if test="${empty list.get(0).species_credpro_fk }">
	          	  	<option value="" selected="selected">请选择...</option>
	          </c:if>
          <c:forEach items="${listCred }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).species_credpro_fk }">
          	  		<option value="${Linkage.id }" selected="selected">${Linkage.name }</option>
          	  	</c:when>
          	  	<c:otherwise>
          	  		<option value="${Linkage.id }">${Linkage.name }</option>
          	  	</c:otherwise>
          	  </c:choose>
			  </c:forEach>
           </select>
        </tr>
      <c:if test="${userList[0].user_type==2 }"> <!-- 3代表植物 -->    
        
         <tr>
          <td class="ui_text_rt">三有物种：</td>
          <td class="ui_text_lt">
          <select name="#s#species_three_fk =" class="ui_select01">
          <c:if test="${empty list.get(0).species_three_fk }">
	          	  	<option value="" selected="selected">请选择...</option>
	          </c:if>
          <c:forEach items="${listThre }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).species_three_fk }">
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
          <td class="ui_text_rt">中国特有：</td>
          <td class="ui_text_lt">
          <select name="#s#species_onlychina_fk =" class="ui_select01">
          <c:if test="${empty list.get(0).species_onlychina_fk  }">
	          	  	<option value="" selected="selected">请选择...</option>
	          </c:if>
          <c:forEach items="${listOnly }" var="Linkage">
          	  <c:choose>
          	  	<c:when test="${Linkage.id} == ${list.get(0).species_onlychina_fk }">
          	  		<option value="${Linkage.id }" selected="selected">${Linkage.name }</option>
          	  	</c:when>
          	  	
          	  	<c:otherwise>
          	  		<option value="${Linkage.id }">${Linkage.name }</option>
          	  	</c:otherwise>
          	  </c:choose>
			  </c:forEach>
           </select>
        </tr>
        <tr>
          <td class="ui_text_rt">概述：</td>
          <td class="ui_text_lt"><textarea name="#s#species_summarize =" class="ui_tb_h30" style="width: 483px; height: 153px;">${list.get(0).species_summarize }</textarea>
          </td>
        </tr>
		 <tr>
          <td class="ui_text_rt">用途：</td>
          <td class="ui_text_lt"><textarea name="#s#species_used =" class="ui_tb_h30" style="width: 483px; height: 153px;">${list.get(0).species_used }</textarea>
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">参考文献：</td>
          <td class="ui_text_lt"><textarea name="#s#species_literature =" class="ui_tb_h30" style="width: 483px; height: 153px;">${list.get(0).species_literature }</textarea>
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
