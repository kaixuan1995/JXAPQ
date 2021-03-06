﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>江西省动植物信息检索系统----工作人员</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.4.4.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/jxapq/scripts/function.js"
	type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/jxapq/style/style.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/jxapq/style/comm.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/jxapq/style/diy.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/jxapq/style/focus.css"
	type="text/css" rel="stylesheet" />
<!--首页模板的css结束-->
<!--后台模板的css开始-->
<link
	href="${pageContext.request.contextPath}/jxapq/style/authority/main_css.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/zTreeStyle/zTreeStyle.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/jxapq/style/authority/basic_layout.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/jxapq/style/authority/common_style.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jxapq/style/authority/jquery.fancybox-1.3.4.css"
	media="screen">
<script
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/zTree/jquery.ztree.core-3.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/zTree/jquery.ztree.excheck-3.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/zTree/jquery.ztree.exedit-3.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/authority/commonAll.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/suggest/yahoo-dom-event.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/suggest/suggest.js"></script>



<style type="text/css">
.ztree li span.button.add {
	margin-left: 2px;
	margin-right: -1px;
	background-position: -144px 0;
	vertical-align: top;
	*vertical-align: middle
}

.ztree li span.button.zdd {
	margin-left: 2px;
	margin-right: -1px;
	background-position: -110px -64;
	vertical-align: top;
	*vertical-align: middle
}

.ztree li span.button.udd {
	margin-left: 2px;
	margin-right: -1px;
	background-position: -110px -48;
	vertical-align: top;
	*vertical-align: middle
}
</style>


<!--后台模板的css结束-->
<script type="text/javascript">
	var zTree, rMenu;

	var setting = {	
	async : true,
		view : {
			addHoverDom: addHoverDom,
			removeHoverDom: removeHoverDom,
			dblClickExpand : false,
			showLine : false,
			expandSpeed : ($.browser.msie && parseInt($.browser.version) <= 6) ? ""
					: "fast"
		},
	
		data : {
			key : {
				name : "resourceName"
			},
			simpleData : {
				enable : true,
				idKey : "resourceID",
				pIdKey : "parentID",
				async : true,
				rootPId : ""
			}
		},
		callback : {	
			onExpand: onExpand,
			onClick : zTreeOnClick
		}
	};

	var curExpandNode = null;
		var log, className = "dark";
		
		
		var newCount = 1;
		function addHoverDom(treeId, treeNode) {
			var sObj = $("#" + treeNode.tId + "_span");
			if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
			var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
				+ "' title='add node' onfocus='this.blur();'></span>" + 
				"<span class='button zdd' id='zddBtn_" + treeNode.tId
				+ "' title='zdd node' onfocus='this.blur();'></span>" +
				"<span class='button udd' id='uddBtn_" + treeNode.tId
				+ "' title='udd node' onfocus='this.blur();'></span>";
			sObj.after(addStr);
			var btn = $("#addBtn_"+treeNode.tId);
			if (btn) btn.bind("click", function(){
				alert("添加" + treeNode.resourceID);
			});
			var btn2 = $("#zddBtn_"+treeNode.tId);
			if (btn2) btn2.bind("click", function(){
				alert("删除" + treeNode.resourceID);
			});
			var btn3 = $("#uddBtn_"+treeNode.tId);
			if (btn3) btn3.bind("click", function(){
				alert("修改" + treeNode.resourceID);
			});
		};
		function removeHoverDom(treeId, treeNode) {
			$("#addBtn_"+treeNode.tId).unbind().remove();
			$("#zddBtn_"+treeNode.tId).unbind().remove();
			$("#uddBtn_"+treeNode.tId).unbind().remove();
		};
		function selectAll() {
			var zTree = $.fn.zTree.getZTreeObj("dleft_tab1");
			zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
		}
		
		
		
		
		
	function onExpand(event, treeId, treeNode) {
		curExpandNode = treeNode;
		//alert(treeNode.children);
		if(treeNode.resourceType = 1 && treeNode.children == undefined ) {
			$.post("${pageContext.request.contextPath}/QueryServlet",{"pid =":treeNode.resourceID, "view":'tree'+treeNode.view, "method":'tree'},function(data,textStatus){
				var jsonObject = eval("("+data+")");	
				//alert(jsonObject);		
				var zTree = $.fn.zTree.getZTreeObj("dleft_tab1");
				zTree.addNodes(treeNode,jsonObject,true);
				//$.fn.zTree.init($("#dleft_tab1"), setting, data);
				zTreeObj.refresh();
			}); 
		}
		
	}
	
	
	
	

	/** 用于捕获节点被点击的事件回调函数  **/
	function zTreeOnClick(event, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("dleft_tab1");
		zTree.expandNode(treeNode, null, null, null, true);
		// 		zTree.expandNode(treeNode);
		// 规定：如果是父类节点，不允许单击操作
		//if(treeNode.isParent){
		// 			alert("父类节点无法点击哦${pageContext.request.contextPath}/jxapq.");
		//	return false;
		//}
		// 如果节点路径为空或者为"#"，不允许单击操作
		if (treeNode.accessPath == "" || treeNode.accessPath == "#") {

			//alert("节点路径为空或者为'#'哦${pageContext.request.contextPath}/jxapq.");
			return false;
		}
		// 跳到该节点下对应的路径, 把当前资源ID(resourceID)传到后台，写进Session
		rightMain(treeNode.accessPath);

		if (treeNode.isParent) {
			$('#here_area').html(
					'当前位置：' + treeNode.getParentNode().resourceName
							+ '&nbsp;>&nbsp;<span style="color:#1A5CC6">'
							+ treeNode.resourceName + '</span>');
		} else {
			$('#here_area').html(
					'当前位置：系统&nbsp;>&nbsp;<span style="color:#1A5CC6">'
							+ treeNode.resourceName + '</span>');
		}
	};

	/* 上方菜单 */
	function switchTab(tabpage, tabid) {
		var oItem = document.getElementById(tabpage).getElementsByTagName("li");
		for ( var i = 0; i < oItem.length; i++) {
			var x = oItem[i];
			x.className = "";
		}
		if ('left_tab1' == tabid) {
			$(document).ajaxStart(onStart).ajaxSuccess(onStop);
			// 异步加载"动植物资料查询"下的菜单
			loadMenu(1, 'dleft_tab1');
		} else if ('left_tab2' == tabid) {
			$(document).ajaxStart(onStart).ajaxSuccess(onStop);
			// 异步加载"vip用户管理"下的菜单
			loadMenu(2, 'dleft_tab1');
		} else if ('left_tab3' == tabid) {
			$(document).ajaxStart(onStart).ajaxSuccess(onStop);
			// 异步加载"个人资料管理"下的菜单
			loadMenu(3, 'dleft_tab1');
		} else if ('left_tab4' == tabid) {
			$(document).ajaxStart(onStart).ajaxSuccess(onStop);
			// 异步加载"物种资料管理"下的菜单
			loadMenu(4, 'dleft_tab1');
		} else if ('left_tab5' == tabid) {
			$(document).ajaxStart(onStart).ajaxSuccess(onStop);
			// 异步加载"系统管理员"下的菜单
			loadMenu(5, 'dleft_tab1');
		}
	}

	$(document).ready(function() {
	var urlName=location.search.substr(1);
	
		//if(urlName.indexOf(".jsp") > 0||urlName.indexOf(".html") > 0){
			document.getElementById("rightMain").src=location.search.substr(1);
		//}
		
		
		$(document).ajaxStart(onStart).ajaxSuccess(onStop);
		
		/** 默认异步加载"动植物资料查询"目录  **/
		//rMenu = $("#rMenu");
		var re = new RegExp(/^\.+key=2$/);
	if(urlName == '/JXAPQ/jxapq/jsp/welcome.jsp?key=2' || urlName == '/JXAPQ/jxapq/jsp/ap_data/01-jie.jsp?key=2') {
		$.post("${pageContext.request.contextPath}/QueryServlet",{"cname =": '动物界', "view":'tree', "method":'tree'},function(data,textStatus){
			var jsonObject = eval("("+data+")");	
			//alert(jsonObject);
			//zTree.addNodes(treeNode,jsonObject,true);
			//var zTreeObj = zTree(setting, data);
			$.fn.zTree.init($("#dleft_tab1"), setting, jsonObject);
			zTreeObj.refresh();
		}); 
	} else if(urlName == '/JXAPQ/jxapq/jsp/welcome.jsp?key=3' || urlName == '/JXAPQ/jxapq/jsp/ap_data/01-jie.jsp?key=3') {
		$.post("${pageContext.request.contextPath}/QueryServlet",{"cname =": '植物界', "view":'tree', "method":'tree'},function(data,textStatus){
			var jsonObject = eval("("+data+")");	
			//alert(jsonObject);
			//zTree.addNodes(treeNode,jsonObject,true);
			//var zTreeObj = zTree(setting, data);
			$.fn.zTree.init($("#dleft_tab1"), setting, jsonObject);
			zTreeObj.refresh();
		}); 
	}
		
		// 默认展开所有节点
		if (zTree) {
			// 默认展开所有节点
			zTree.expandAll(false);
		}
		
		$("#selectAll").bind("click", selectAll);
		
		
		
	});

	function loadMenu(resourceType, treeObj) {
		/*$.ajax({
			type:"POST",
			url:"${dynamicURL}/authority/modelPart.action?resourceType=" + resourceType,
			dataType : "json",
			success:function(data){
				// 如果返回数据不为空，加载"业务模块"目录
				if(data != null){
					// 将返回的数据赋给zTree
					$.fn.zTree.init($("#"+treeObj), setting, data);
					alert(treeObj);
					zTree = $.fn.zTree.getZTreeObj(treeObj);
					if( zTree ){
						// 默认展开所有节点
						zTree.expandAll(true);
					}
				}
			}
		});*/
		
		//动植物资料管理
		if (resourceType == 1) {
			data = [ {
				//"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/ap_data/01-jie.jsp",
				//"parentID" : 0,
				//"resourceID" : 1,
				//"resourceName" : "植物界 Plantae",
				//"resourceType" : "1",
				//"isParent" : true
			} ];
			//$.post("${pageContext.request.contextPath}/QueryServlet",{"cname =": '动物界', "view":'tree', "method":'tree'},function(data,textStatus){
			//	var jsonObject = eval("("+data+")");	
			//	alert(jsonObject);
			//	$.fn.zTree.init($("#dleft_tab1"), setting, jsonObject);
			//	zTreeObj.refresh();
			//}); 
			
			var urlName=location.search.substr(1);
	
		//if(urlName.indexOf(".jsp") > 0||urlName.indexOf(".html") > 0){
			document.getElementById("rightMain").src=location.search.substr(1);
		//}
		
		
		$(document).ajaxStart(onStart).ajaxSuccess(onStop);
		
		/** 默认异步加载"动植物资料查询"目录  **/
		//rMenu = $("#rMenu");
		var re = new RegExp(/^\.+key=2$/);
	if(urlName == '/JXAPQ/jxapq/jsp/welcome.jsp?key=2' || urlName == '/JXAPQ/jxapq/jsp/ap_data/01-jie.jsp?key=2') {
		$.post("${pageContext.request.contextPath}/QueryServlet",{"cname =": '动物界', "view":'tree', "method":'tree'},function(data,textStatus){
			var jsonObject = eval("("+data+")");	
			//alert(jsonObject);
			//zTree.addNodes(treeNode,jsonObject,true);
			//var zTreeObj = zTree(setting, data);
			$.fn.zTree.init($("#dleft_tab1"), setting, jsonObject);
			zTreeObj.refresh();
		}); 
	} else if(urlName == '/JXAPQ/jxapq/jsp/welcome.jsp?key=3' || urlName == '/JXAPQ/jxapq/jsp/ap_data/01-jie.jsp?key=3') {
		$.post("${pageContext.request.contextPath}/QueryServlet",{"cname =": '植物界', "view":'tree', "method":'tree'},function(data,textStatus){
			var jsonObject = eval("("+data+")");	
			//alert(jsonObject);
			//zTree.addNodes(treeNode,jsonObject,true);
			//var zTreeObj = zTree(setting, data);
			$.fn.zTree.init($("#dleft_tab1"), setting, jsonObject);
			zTreeObj.refresh();
		}); 
	}
		}
		//VIP用户管理
		if (resourceType == 2) {
			data = [ {
				"accessPath" : "${pageContext.request.contextPath}/UserServlet?method=queryVip&view=queryVipView&user_type%3D=0",
				"checked" : false,
				"delFlag" : 0,
				"parentID" : 1,
				"resourceCode" : "",
				"resourceDesc" : "",
				"resourceGrade" : 2,
				"resourceID" : 3,
				"resourceName" : "查询VIP用户",
				"resourceOrder" : 0,
				"resourceType" : ""
			} ];
		}

		//工作人员个人资料维护
		if (resourceType == 3) {
			data = [
					{
						"accessPath" : "${pageContext.request.contextPath}/UserServlet?view=userInfoView&method=queryUserInfo&user_id%3D=${userList[0].user_id}",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 3,
						"resourceName" : "个人信息",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
							"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/user_info/change_password.jsp",
							"checked" : false,
							"delFlag" : 0,
							"parentID" : 37,
							"resourceCode" : "",
							"resourceDesc" : "",
							"resourceGrade" : 2,
							"resourceID" : 19,
							"resourceName" : "修改密码",
							"resourceOrder" : 0,
							"resourceType" : ""
						},
						{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/user_info/alterInfo.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 3,
						"resourceName" : "基本资料修改",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/UtilServlet?method=resetResources",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 37,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 21,
						"resourceName" : "更新站内资源",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/user_info/change_email.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 37,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 20,
						"resourceName" : "修改邮箱",
						"resourceOrder" : 0,
						"resourceType" : ""
					} ];
		}
		//物种资料管理
		if (resourceType == 4) {
			data = [
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/add_ap/add_jie.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 3,
						"resourceName" : "添加界",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_men&sign=false",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 4,
						"resourceName" : "添加门",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
"accessPath" : "${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_gang&sign=false",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 5,
						"resourceName" : "添加纲",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
				<c:if test="${userList[0].user_type==3 }"> <!--3代表植物  动植物区分！！9.16会议 -->
					{
"accessPath" : "${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_yagang&sign=false",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 6,
						"resourceName" : "添加亚纲",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
			     </c:if>
					{
						"accessPath" : "${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_mu&sign=false",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 7,
						"resourceName" : "添加目",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
"accessPath" : "${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_ke&sign=true",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 8,
						"resourceName" : "添加科",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_shu&sign=true",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 9,
						"resourceName" : "添加属",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_zhong&sign=true",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 10,
						"resourceName" : "添加种",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_YaZhong&sign=true",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 10,
						"resourceName" : "添加亚种",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_biaoben&sign=false",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 14,
						"resourceName" : "添加标本",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
												"accessPath" : "${pageContext.request.contextPath}/QueryServlet?method=linkage&view=Linkage&forward=add_Speciestupian&sign=false",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 15,
						"resourceName" : "添加图片",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/add_ap/add_baohuqu.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 11,
						"resourceName" : "添加保护区",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
			<c:if test="${userList[0].user_type==3 }"><!--3代表植物  动植物区分！！9.16会议 -->
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/add_ap/add_quxileixing.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 12,
						"resourceName" : "添加区系类型",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/QueryServlet?method=linkage&view=false&forward=add_ziquxileixing&sign=true",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 13,
						"resourceName" : "添加子区系类型",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
			</c:if>
					
		    <c:if test="${userList[0].user_type==2 }"><!--2代表动物  动植物区分！！9.16会议 -->

					
					{
						"accessPath" : "${pageContext.request.contextPath}/QueryServlet?method=linkage&view=false&forward=add_ziquxileixing&sign=true",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 13,
						"resourceName" : "添加区系类型",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
			</c:if>	
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/add_ap/add_shujuzidian.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 13,
						"resourceName" : "管理数据字典",
						"resourceOrder" : 0,
						"resourceType" : ""
					} ];
		}

		// 如果返回数据不为空，加载"业务模块"目录
		if (data != null) {
			// 将返回的数据赋给zTree
			$.fn.zTree.init($("#" + treeObj), setting, data);
			//              alert(treeObj);
			zTree = $.fn.zTree.getZTreeObj(treeObj);
			if (zTree) {
				// 默认展开所有节点
				zTree.expandAll(false);
			}
		}
	}

	//ajax start function
	function onStart() {
		$("#ajaxDialog").show();
	}

	//ajax stop function
	function onStop() {
		// 		$("#ajaxDialog").dialog("close");
		$("#ajaxDialog").hide();
	}


 
</script>
</head>
<!--头部分开始-->

<div class="page_style lanmupage page_l61">
	<div class="top_box">
		<div class="top_box_inner">
			<div class="logo">
				<a href=""><img
					src="${pageContext.request.contextPath}/jxapq/images/logo.png"
					border="0"> </a>
			</div>
			<div class="topcontent">
				<div style="clear:both;overflow:hidden;">
					<div style="float:left;">
						<ul>
							<li class="top_1"></li>
							<li class="top_2"></li>
						</ul>
					</div>
					<div style="float:left;">
						<script type="text/javascript">
							function sub() {
								var publicname = document
										.getElementById("q").value;
								document.getElementById("sname").value = publicname;
								document.getElementById("ename").value = publicname;
								document.getElementById("spelling").value = publicname;
								document.getElementById("commoninfo").value = publicname;

								document.forms[0].submit();
							}
						</script>

						<style type="text/css">
</style>

						<form
							action="${pageContext.request.contextPath }/QueryServlet?method=query"
							target="rightMain" method="post"  onsubmit="sub()">
							<input size="25/" maxlength="50" id="q" name="cname like "
								class="search-input" value="请输入查找动植物的名称"
								onBlur="javascript:if(this.value=='')this.value='请输入查找动植物的名称';"
								onFocus="javascript:if(this.value=='请输入查找动植物的名称')this.value='';"
								style="height:40px;width:350px;float:left;border:2px solid #074177;line-height:40px;border-radius:5px 0 0 5px;margin-left:20px;"
								type="text" /> <input
								style="height:40px;border:0px;width:40px;float:left;background-image:url('${pageContext.request.contextPath}/jxapq/images/ss.jpg');"
								onClick="return sub()" type="button" /> <input type="hidden"
								name="sname like" value="" id="sname" /> <input type="hidden"
								name="ename like " value="" id="ename"> <input
								type="hidden" name="spelling like " value="" id="spelling">
							<input type="hidden" name="commoninfo like " value=""
								id="commoninfo"> <input type="hidden" name="view"
								value="generalquery" />
						</form>
						<script type="text/javascript">
	            (function() {
	            	//document.getElementById("q").value=document.getElementById("q").value+'&method=search'
	                var dataUrl = '${pageContext.request.contextPath}/QueryServlet';
	                new KISSY.Suggest('q', dataUrl,
	                    { autoFocus: true,
	                      resultFormat: ''
	                    });
	            })();
	        </script>

						<c:if test="${not empty userList[0].user_id }">
								你好：<font color='red'>${userList[0].user_id }</font>|
								<a
								href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp">个人中心</a>|
								<a
								href="${pageContext.request.contextPath}/UserServlet?method=exit&view=exitView">退出</a>
						</c:if>
						<c:if test="${empty userList[0].user_id}">
							<a href="${pageContext.request.contextPath}/jxapq/jsp/login.jsp">登陆</a>&nbsp;
								<a
								href="${pageContext.request.contextPath}/jxapq/jsp/register.jsp">注册</a>
						</c:if>

					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="menu_box" id="Menu">
				<ul>
					<li class="menu_style_homepage menu_current" id="MenuItem61"
						name="MenuItem"><a
						href="${pageContext.request.contextPath}/jxapq/jsp/index.jsp"
						target="_self" class="menu">首页</a>
					</li>
					<li class="menu_style" id="MenuItem62" name="MenuItem"><a
						href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp?${pageContext.request.contextPath}/jxapq/jsp/welcome.jsp?key=2"
						target="" class="menu">动物界</a>
					</li>
					<li class="menu_style" id="MenuItem63" name="MenuItem"><a
						href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp?${pageContext.request.contextPath}/jxapq/jsp/welcome.jsp?key=3"
						target="" class="menu">植物界</a>
					</li>
					<li class="menu_style" id="MenuItem67" name="MenuItem"><a
						href="${pageContext.request.contextPath}/QueryServlet?method=highquery"
						target="rightMain" class="menu">高级检索</a>
					</li>
					<li class="menu_style" id="MenuItem64" name="MenuItem"><a
						href="${pageContext.request.contextPath}/jxapq/jsp/ap_data/statistics.jsp"
						target="rightMain" class="menu">统计</a>
					</li>
					<li class="menu_style" id="MenuItem68" name="MenuItem"><a
						href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp"
						target="rightMain" class="menu">地图</a>
					</li>
					<li class="menu_style" id="MenuItem65" name="MenuItem">
					<a href="${pageContext.request.contextPath}/jxapq/jsp/introduce.jsp" target="rightMain"  class="menu">联系我们</a>
					
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!--头部分结束-->
	<div id="side">
		<div id="left_menu">
			<ul id="TabPage2" style="height:200px; margin-top:50px;">
				<li id="left_tab1" class="selected"
					onClick="javascript:switchTab('TabPage2','left_tab1');"
					title="查询物种资料"><img alt="查询物种资料" title="查询物种资料"
					src="${pageContext.request.contextPath}/jxapq/images/common/1_hover.jpg"
					width="33" height="31"></li>
				<c:if test="${userList[0].user_type==2||userList[0].user_type==2 }">
					<li id="left_tab2"
						onClick="javascript:switchTab('TabPage2','left_tab2');"
						title="VIP用户管理"><img alt="VIP用户管理" title="VIP用户管理"
						src="${pageContext.request.contextPath}/jxapq/images/common/2.jpg"
						width="33" height="31"></li>
				</c:if>
				<c:if
					test="${userList[0].user_type==2||userList[0].user_type==1||userList[0].user_type==3}">
					<li id="left_tab3"
						onClick="javascript:switchTab('TabPage2','left_tab3');"
						title="个人资料管理"><img alt="个人资料管理" title="个人资料管理"
						src="${pageContext.request.contextPath}/jxapq/images/common/3.jpg"
						width="33" height="31"></li>
				</c:if>
				<c:if test="${userList[0].user_type==2||userList[0].user_type==3 }">
					<li id="left_tab4"
						onClick="javascript:switchTab('TabPage2','left_tab4');"
						title="物种资料管理"><img alt="物种资料管理" title="物种资料管理"
						src="${pageContext.request.contextPath}/jxapq/images/common/3.jpg"
						width="33" height="31"></li>
				</c:if>
			</ul>
			<div id="nav_show"
				style="position:absolute; bottom:0px; padding:10px;">
				<a href="javascript:;" id="show_hide_btn"> <img alt="显示/隐藏"
					title="显示/隐藏"
					src="${pageContext.request.contextPath}/jxapq/images/common/nav_hide.png"
					width="35" height="35"> </a>
			</div>
		</div>
		<div id="left_menu_cnt">
			<div id="nav_module">
				<img
					src="${pageContext.request.contextPath}/jxapq/images/common/module_1.png"
					width="210" height="58" />
			</div>
			<div id="nav_resource">
				<ul id="dleft_tab1" class="ztree">
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#TabPage2 li').click(
					function() {
						var index = $(this).index();
						$(this).find('img').attr(
								'src',
								'${pageContext.request.contextPath}/jxapq/images/common/'
										+ (index + 1) + '_hover.jpg');
						$(this).css({
							background : '#fff'
						});
						$('#nav_module').find('img').attr(
								'src',
								'${pageContext.request.contextPath}/jxapq/images/common/module_'
										+ (index + 1) + '.png');
						$('#TabPage2 li').each(
								function(i, ele) {
									if (i != index) {
										$(ele).find('img').attr(
												'src',
												'${pageContext.request.contextPath}/jxapq/images/common/'
														+ (i + 1) + '.jpg');
										$(ele).css({
											background : '#044599'
										});
									}
								});
						// 显示侧边栏
						switchSysBar(true);
					});

			// 显示隐藏侧边栏
			$("#show_hide_btn").click(function() {
				switchSysBar();
			});
		});

		/**隐藏或者显示侧边栏**/
		function switchSysBar(flag) {
			var side = $('#side');
			var left_menu_cnt = $('#left_menu_cnt');
			if (flag == true) { // flag==true
				left_menu_cnt.show(500, 'linear');
				side.css({
					width : '280px'
				});
				$('#top_nav').css({
					width : '77%',
					left : '304px'
				});
				$('#main').css({
					left : '280px'
				});
			} else {
				if (left_menu_cnt.is(":visible")) {
					left_menu_cnt.hide(10, 'linear');
					side.css({
						width : '60px'
					});
					$('#top_nav').css({
						width : '100%',
						left : '60px',
						'padding-left' : '28px'
					});
					$('#main').css({
						left : '60px'
					});
					$("#show_hide_btn")
							.find('img')
							.attr('src',
									'${pageContext.request.contextPath}/jxapq/images/common/nav_show.png');
				} else {
					left_menu_cnt.show(500, 'linear');
					side.css({
						width : '280px'
					});
					$('#top_nav').css({
						width : '77%',
						left : '304px',
						'padding-left' : '0px'
					});
					$('#main').css({
						left : '280px'
					});
					$("#show_hide_btn")
							.find('img')
							.attr('src',
									'${pageContext.request.contextPath}/jxapq/images/common/nav_hide.png');
				}
			}
		}
	</script>
	<!-- side menu start -->
	<div id="top_nav">
		<span id="here_area">当前位置：系统&nbsp;>&nbsp;首页</span>
	</div>
	<div id="main">
		<iframe name="rightMain" id="rightMain"
			src="${pageContext.request.contextPath}/jxapq/jsp/show.jsp"
			frameborder="no" scrolling="auto" width="100%" height="90%"
			allowtransparency="true" />
	</div>

	<div style="display:none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>



	</body>
</html>
