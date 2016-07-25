<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>江西省动植物信息检索系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
<link
	href="${pageContext.request.contextPath}/jxapq/style/authority/basic_layout.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/jxapq/style/authority/common_style.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/authority/commonAll.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/Linkage.js"></script>

<link href="${pageContext.request.contextPath}/uploadify/uploadify.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/uploadify/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/uploadify/swfobject.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
	
<c:set var="speciesId" value="" scope="request"/>

</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#uploadify").uploadify({
		'uploader'	:	"<%=basePath%>uploadify/uploadify.swf",
		'script'    :	"${pageContext.request.contextPath}/UploadifyServlet",
		'cancelImg' :	"<%=basePath%>uploadify/cancel.png",
		'folder' : "uploads",//上传文件存放的路径,请保持与uploadFile.jsp中PATH的值相同
		'queueId' : "fileQueue",
		'queueSizeLimit' : 10,//限制上传文件的数量
		'fileExt':'*.gif;*.jpg;*.jpeg;*.png',//允许上传的文件类型，使用分号(”;)”分割 例如:*.jpg;*.gif,默认为null(所有文件类型)
        'fileDesc':'不超过5M的图片 (*.gif;*.jpg;*.png)',
        'sizeLimit': 2048000,  //允许上传的文件大小(kb)  此为2M
		'auto' : false,
		'multi' : true,//是否允许多文件上传
		'simUploadLimit' : 10,//同时运行上传的进程数量
		'buttonText' : "picture",
       'scriptData' : {
		},//这个参数用于传递用户自己的参数，此时'method' 必须设置为GET, 后台可以用request.getParameter('name')获取名字的值
		'method' : "GET",
		'onError': function(event, queueID, fileObj) {//当单个文件上传出错时触发
               alert("文件:" + fileObj.name + " 上传失败！");
         },
		'onComplete' : function(event, ID, fileObj, response, data) {
				var result = $("#result1");
				var $image = "<img style='width: 180px; height: 200px;'src = '<%=basePath%>uploads/"+response+"'>&nbsp;&nbsp;";
				result.append($image);
			},
		});
	});
</script>
</head>
<style type="text/css">
tr:hover {
	background-color: #A9C3DD
}
</style>
<body>
	<input type="hidden" name="fyID" value="14458625716623" id="fyID" />
	<div id="container">
		<div id="nav_links">
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
		            <option selected="selected" value="">请选择所属的种</option>
		          </select>
		          </td> 
		        </tr>
		      </table>
		   </div>
		</div>
		</div>
		<p>
		<br>
		<fieldset>
		<legend style="color:#4E4E4E"> <font size="5">上传物种图片</font></legend>
		<br>
		<div style="margin-left: 20px;">
			<div id="fileQueue"></div>
				<input type="file" name="uploadify" id="uploadify" />
			<p>
				<br> <a
					href="javascript:$('#uploadify').uploadifySettings('scriptData',{'zhongId':$('#species').val()}); jQuery('#uploadify').uploadifyUpload()"
					style="color:#4E4E4E">开始上传</a>&nbsp; <a
					href="javascript:jQuery('#uploadify').uploadifyClearQueue()"
					style="color:#4E4E4E">取消所有上传</a>
			</p>
				<div>
				<h4 style="clolr:#1E82E9">下面图片已上传成功</h4>
				</div>
			<div id="result1"></div>
		</div>
		</fieldset>
</body>
</html>
