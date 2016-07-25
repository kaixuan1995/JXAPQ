<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<!--首页模板的css开始-->
<script
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery.min.js"
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
	href="${pageContext.request.contextPath}/jxapq/style/authority/zTreeStyle.css"
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
</link>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/zTree/jquery.ztree.core-3.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/authority/commonAll.js"></script>



<!--后台模板的css结束-->
<script type="text/javascript">
	/* zTree插件加载目录的处理  */
	var zTree;

	var setting = {
		view : {
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
				rootPId : ""
			}
		},
		callback : {
			// 				beforeExpand: beforeExpand,
			// 				onExpand: onExpand,
			onClick : zTreeOnClick
		}
	};

	var curExpandNode = null;
	function beforeExpand(treeId, treeNode) {
		var pNode = curExpandNode ? curExpandNode.getParentNode() : null;
		var treeNodeP = treeNode.parentTId ? treeNode.getParentNode() : null;
		for ( var i = 0, l = !treeNodeP ? 0 : treeNodeP.children.length; i < l; i++) {
			if (treeNode !== treeNodeP.children[i]) {
				zTree.expandNode(treeNodeP.children[i], false);
			}
		}
		while (pNode) {
			if (pNode === treeNode) {
				break;
			}
			pNode = pNode.getParentNode();
		}
		if (!pNode) {
			singlePath(treeNode);
		}

	}
	function singlePath(newNode) {
		if (newNode === curExpandNode)
			return;
		if (curExpandNode && curExpandNode.open == true) {
			if (newNode.parentTId === curExpandNode.parentTId) {
				zTree.expandNode(curExpandNode, false);
			} else {
				var newParents = [];
				while (newNode) {
					newNode = newNode.getParentNode();
					if (newNode === curExpandNode) {
						newParents = null;
						break;
					} else if (newNode) {
						newParents.push(newNode);
					}
				}
				if (newParents != null) {
					var oldNode = curExpandNode;
					var oldParents = [];
					while (oldNode) {
						oldNode = oldNode.getParentNode();
						if (oldNode) {
							oldParents.push(oldNode);
						}
					}
					if (newParents.length > 0) {
						for ( var i = Math.min(newParents.length,
								oldParents.length) - 1; i >= 0; i--) {
							if (newParents[i] !== oldParents[i]) {
								zTree.expandNode(oldParents[i], false);
								break;
							}
						}
					} else {
						zTree.expandNode(oldParents[oldParents.length - 1],
								false);
					}
				}
			}
		}
		curExpandNode = newNode;
	}

	function onExpand(event, treeId, treeNode) {
		curExpandNode = treeNode;
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
		} 
		if ('left_tab5' == tabid) {
			$(document).ajaxStart(onStart).ajaxSuccess(onStop);
			// 异步加载"系统管理员"下的菜单
			loadMenu(5, 'dleft_tab1');
		}
	}

	$(document).ready(function() {
		$(document).ajaxStart(onStart).ajaxSuccess(onStop);
		/** 默认异步加载"动植物资料查询"目录  **/
		loadMenu(1, "dleft_tab1");
		// 默认展开所有节点
		if (zTree) {
			// 默认展开所有节点
			zTree.expandAll(false);
		}
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
			data = [
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/ap_data/01-jie.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 3,
						"resourceName" : "植物界 Plantae",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/ap_data/01-jie.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 2,
						"resourceName" : "动物界 Animalia",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/ap_data/02-men.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 3,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 3,
						"resourceID" : 7,
						"resourceName" : "苔藓植物门 Bryophyta",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/ap_data/02-men.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 2,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 3,
						"resourceID" : 9,
						"resourceName" : "脊索动物门 Anseriformes",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/ap_data/03-gang.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 9,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 4,
						"resourceID" : 10,
						"resourceName" : "鸟纲 Anatidae",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/ap_data/04-mu.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 10,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 5,
						"resourceID" : 11,
						"resourceName" : "雁行目 Anseriformes",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/ap_data/05-ke.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 11,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 6,
						"resourceID" : 12,
						"resourceName" : "鸭科 Anatidae",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/ap_data/06-shu.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 12,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 7,
						"resourceID" : 16,
						"resourceName" : "鸳鸯属 Aix",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/ap_data/07-zhong.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 16,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 8,
						"resourceID" : 00,
						"resourceName" : "鸳鸯 Aix galericulata",
						"resourceOrder" : 0,
						"resourceType" : ""
					} ];
		}
		//系统管理员
		if (resourceType == 5) {
			data = [
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/manager/add_work.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 3,
						"resourceName" : "添加工作人员",
						"resourceOrder" : 0,
						"resourceType" : ""
					},{
						"accessPath" : "${pageContext.request.contextPath}/UserServlet?method=queryAllWorker&view=queryAllWorkerView&user_type%3D=2&user_type%3D=3",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 3,
						"resourceName" : "查询管理工作人员",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/manager/add_gonggao.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 4,
						"resourceName" : "添加公告",
						"resourceOrder" : 0,
						"resourceType" : ""
					},
					{
						"accessPath" : "${pageContext.request.contextPath}/UserServlet?method=queryNotice&view=queryNoticeView&1 %3D=1",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 4,
						"resourceName" : "管理公告",
						"resourceOrder" : 0,
						"resourceType" : ""
					},{
						"accessPath" : "${pageContext.request.contextPath}/jxapq/jsp/manager/backup_recoverDB.jsp",
						"checked" : false,
						"delFlag" : 0,
						"parentID" : 1,
						"resourceCode" : "",
						"resourceDesc" : "",
						"resourceGrade" : 2,
						"resourceID" : 4,
						"resourceName" : "数据库的备份和恢复",
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
							function c_keyword() {
								if ($("title").value == "") {
									alert("请输入关键词！");
									$("title").focus();
									return false;
								}

							}
						</script>
						<form action="ap_data/putongsousuo.html" target="right"
							method="get" name="S_article">
							<input size="25/" maxlength="50" id="title" name="title"
								value="请输入查找动植物的名称"
								onBlur="javascript:if(this.value=='')this.value='请输入查找动植物的名称';"
								onFocus="javascript:if(this.value=='请输入查找动植物的名称')this.value='';"
								style="height:36px;width:350px;float:left;border:2px solid #074177;line-height:40px;border-radius:5px 0 0 5px;margin-left:20px;"
								type="text" /> <input
								style="height:40px;border:0px;width:40px;float:left;"
								class="botton" onClick="return c_keyword()"
								src="${pageContext.request.contextPath}/jxapq/images/ss.jpg"
								type="image" />
						</form>
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
							class="menu">首页</a></li>
						<li class="menu_style" id="MenuItem62" name="MenuItem"><a
							href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp"
							class="menu">动物界</a></li>
						<li class="menu_style" id="MenuItem63" name="MenuItem"><a
							href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp"
							class="menu">植物界</a></li>
						<li class="menu_style" id="MenuItem67" name="MenuItem"><a
							href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp"
							class="menu">高级检索</a></li>
						<li class="menu_style" id="MenuItem64" name="MenuItem"><a
							href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp"
							target="right" class="menu">统计</a></li>
						<li class="menu_style" id="MenuItem68" name="MenuItem"><a
							href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp"
							target="right" class="menu">地图</a></li>
						<li class="menu_style" id="MenuItem65" name="MenuItem"><a
							href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp"
							target="right" class="menu">联系我们</a></li>
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
				<li id="left_tab5"
					onClick="javascript:switchTab('TabPage2','left_tab5');"
					title="系统管理"><img alt="系统管理" title="系统管理"
					src="${pageContext.request.contextPath}/jxapq/images/common/left_tab4_hover.jpg"
					width="33" height="31"></li>
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
	<div id="top_nav">
		<span id="here_area">当前位置：系统&nbsp;>&nbsp;首页</span>
	</div>
	<div id="main">
		<iframe name="right" id="rightMain" src="ap_data/01-jie.jsp"
			frameborder="no" scrolling="auto" width="100%" height="90%"
			allowtransparency="true" />
	</div>
	<script type="text/javascript">
		alert(location.search.substr(1));
		document.getElementById("rightMain").src = location.search.substr(1);
	</script>
	</body>
</html>
