<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
	
	function delele(value,del) {
		var url = "${pageContext.request.contextPath }/UpdateServlet?method=delete&view=deleteShujuzidianView&dictionary_id %3D="+value;
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
  <div id="nav_links"> 当前位置：动植物数据管理&nbsp;>&nbsp;<span style="color: #1A5CC6;">数据字典维护</span>
    <div id="page_close"> <a href="javascript:parent.$.fancybox.close();"> <img src="${pageContext.request.contextPath}/jxapq/images/common/page_close.png" width="20" height="20" style="vertical-align: text-top;"/> </a> </div>
  </div>
    </div>
	  <p>
  <div id="box_top">数据字典维护</div>
  </p>
  <div class="ui_content">
    <form id="submitForm" name="submitForm" onsubmit="return getConf()" action="${pageContext.request.contextPath }/UpdateServlet?method=add&view=addShujuzidianView" method="post">
	
      <table  cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
	 
		
        <tr>
          <td class="ui_text_rt">所属类型：</td>
          <td class="ui_text_lt" height="42" colspan="2">
      <c:if test="${userList[0].user_type==3 }"><!-- 3植物管理员 动植物区分！！9.16会议 -->
          <select name="category =" class="ui_select01">
              <option value="变种符号">变种符号</option>
			  <option value="生活型">生活型</option>
			  <option value="引种栽培">引种栽培</option>
			  <option value="国家保护等级">国家保护等级</option>
			  <option value="IUCN红色名录等级">IUCN红色名录等级</option>
			  <option value="省保护级别">省保护级别</option>
			  <option value="CITES保护级别">CITES保护级别</option>
			  <option value="中国红色名录等级">中国红色名录等级</option>
			  <option value="发展趋势">发展趋势</option>
			  <option value="中国特有">中国特有</option>
          </select>
     </c:if> 
 
     <c:if test="${userList[0].user_type==2 }"><!-- 2动物管理员 动植物区分！！9.16会议 -->
          <select id= "category"name="category =" class="ui_select01">
              <option value="地理分布型">地理分布型</option>
			  <option value="居留型">居留型</option>
			  <option value="饲养状况">饲养状况</option>
			  <option value="国家保护等级">国家保护等级</option>
			  <option value="IUCN红色名录等级">IUCN红色名录等级</option>
			  <option value="省保护级别">省保护级别</option>
			  <option value="CITES保护级别">CITES保护级别</option>
			  <option value="中国红色名录等级">中国红色名录等级</option>
			  <option value="发展趋势">发展趋势</option>
			  <option value="三有物种">三有物种</option>
			  <option value="中国特有">中国特有</option>
          </select>
     </c:if>     
     <label id="categoryError"></label> 
          </td>
        </tr>
        <tr>
          <td class="ui_text_rt">名称：</td>
          <td class="ui_text_lt"><input type="text" id="dictionary_name" name="dictionary_name =" value="" class="ui_input_txt04"/>
         	<label id="dictionary_nameError"></label>
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
  
  <p>
  <div id="box_top"><a href="${pageContext.request.contextPath }/QueryServlet?method=queryInfor&view=getShujuzidianInfor">查看已有数据字典</a></div>
  <div class="ui_content">
	<table  cellspacing="0" cellpadding="0" width="100%" align="left" border="1"  >
		<tr>
          <td  width="10%" >编号</td>
          <td  width="40%" >数据字典名称</td>
          <td  width="40%" >所属类型</td>
		  <td  width="10%" >操作类型</td>
        </tr>
        <c:forEach items="${list }" var="Dictionary">
        <tr>
          <td align="center" width="10%" >${Dictionary.dictionary_id }</td>
          <td align="center" width="40%" >${Dictionary.dictionary_name }</td>
          <td align="center" width="40%" >${Dictionary.category }</td>
		  <td align="center" width="10%" >&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="delele(${Dictionary.dictionary_id },this)" >删除</a>&nbsp;&nbsp;
		  <a href="${pageContext.request.contextPath }/QueryServlet?method=querySelf&view=queryShujuzidianSelf&value=${Dictionary.dictionary_id }">修改</a></td>
        </tr>
       </c:forEach>
      </table>
  </div>
  
<div style="display:none">
  <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script>
</div>
</body>
</html>
