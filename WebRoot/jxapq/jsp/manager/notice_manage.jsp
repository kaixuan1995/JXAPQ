<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	src="${pageContext.request.contextPath}/jxapq/scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jxapq/style/authority/jquery.fancybox-1.3.4.css"
	media="screen"></link>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/artDialog/artDialog.js?skin=default"></script>
<script
	src="${pageContext.request.contextPath}/jxapq/scripts/My97DatePicker/WdatePicker.js"
	type="text/javascript" defer></script>
<title>公告管理</title>
<script type="text/javascript">
	$(document).ready(function() {
		/** 新增   **/
		$("#addBtn").fancybox({
			'href' : 'Search_VIP.html',
			'width' : 733,
			'height' : 530,
			'type' : 'iframe',
			//'hideOnOverlayClick' : false,
			//'showCloseButton' : false,
			//'onClosed' : function() { 
			//	window.location.href = 'Search_VIP.html';
			//}

			'openEffect' : 'none',
			'closeEffect' : 'none',
			'afterClose' : function() {
				window.location.reload();
			}

		});

		/** 导入  **/
		$("#importBtn").fancybox({
			'href' : '/xngzf/archives/importFangyuan.action',
			'width' : 633,
			'height' : 260,
			'type' : 'iframe',
			'hideOnOverlayClick' : false,
			'showCloseButton' : false,
			'onClosed' : function() {
				window.location.href = 'Search_VIP.html';
			}
		});

		/**编辑   **/
		$("a.edit").fancybox({
			'width' : 733,
			'height' : 530,
			'type' : 'iframe',
			//'hideOnOverlayClick' : false,
			//'showCloseButton' : false,
			//'onClosed' : function() { 
			// 	window.location.href = 'Search_VIP.html';
			//}

			'openEffect' : 'none',
			'closeEffect' : 'none',
			'afterClose' : function() {
				window.location.reload();
			}
		});
	});
	/** 用户角色   **/
	var userRole = '';

	/** 模糊查询来电用户  **/
	function search() {
		$("#submitForm").attr("action", "Search_VIP.html?page=" + 1).submit();
	}

	/** Excel导出  **/
	function exportExcel() {
		if (confirm('您确定要导出吗？')) {
			var fyXqCode = $("#fyXq").val();
			var fyXqName = $('#fyXq option:selected').text();
			//	 		alert(fyXqCode);
			if (fyXqCode == "" || fyXqCode == null) {
				$("#fyXqName").val("");
			} else {
				//	 			alert(fyXqCode);
				$("#fyXqName").val(fyXqName);
			}
			$("#submitForm").attr("action",
					"/xngzf/archives/exportExcelFangyuan.action").submit();
		}
	}

	/** 删除 **/
	function del(fyID) {
		// 非空判断
		if (fyID == '')
			return;
		if (confirm("您确定要删除吗？")) {
			$("#submitForm").attr("action",
					"/xngzf/archives/delFangyuan.action?fyID=" + fyID).submit();
		}
	}

	/** 批量删除 **/
	function batchDel() {
		if ($("input[name='IDCheck']:checked").size() <= 0) {
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '至少选择一条',
				ok : true,
			});
			return;
		}
		// 1）取出用户选中的checkbox放入字符串传给后台,form提交
		var allIDCheck = "";
		$("input[name='IDCheck']:checked").each(
				function(index, domEle) {
					bjText = $(domEle).parent("td").parent("tr").last()
							.children("td").last().prev().text();
					// 			alert(bjText);
					// 用户选择的checkbox, 过滤掉“已审核”的，记住哦
					if ($.trim(bjText) == "已审核") {
						// 				$(domEle).removeAttr("checked");
						$(domEle).parent("td").parent("tr").css({
							color : "red"
						});
						$("#resultInfo").html("已审核的是不允许您删除的，请联系管理员删除！！！");
						// 				return;
					} else {
						allIDCheck += $(domEle).val() + ",";
					}
				});
		// 截掉最后一个","
		if (allIDCheck.length > 0) {
			allIDCheck = allIDCheck.substring(0, allIDCheck.length - 1);
			// 赋给隐藏域
			$("#allIDCheck").val(allIDCheck);
			if (confirm("您确定要批量删除这些记录吗？")) {
				// 提交form
				$("#submitForm").attr("action",
						"/xngzf/archives/batchDelFangyuan.action").submit();
			}
		}
	}

	/** 普通跳转 **/
	function jumpNormalPage(page) {
		$("#submitForm").attr("action", "Search_VIP.html?page=" + page)
				.submit();
	}

	/** 输入页跳转 **/
	function jumpInputPage(totalPage) {
		// 如果“跳转页数”不为空
		if ($("#jumpNumTxt").val() != '') {
			var pageNum = parseInt($("#jumpNumTxt").val());
			// 如果跳转页数在不合理范围内，则置为1
			if (pageNum<1 | pageNum>totalPage) {
				art.dialog({
					icon : 'error',
					title : '友情提示',
					drag : false,
					resize : false,
					content : '请输入合适的页数，\n自动为您跳到首页',
					ok : true,
				});
				pageNum = 1;
			}
			$("#submitForm").attr("action", "Search_VIP.html?page=" + pageNum)
					.submit();
		} else {
			// “跳转页数”为空
			art.dialog({
				icon : 'error',
				title : '友情提示',
				drag : false,
				resize : false,
				content : '请输入合适的页数，\n自动为您跳到首页',
				ok : true,
			});
			$("#submitForm").attr("action", "Search_VIP.html?page=" + 1)
					.submit();
		}
	}
</script>
<style>
.alt td {
	background: black !important;
}
</style>
</head>
<body>

	<div>${message }</div>
	<div id="container">
		<form id="submitForm" name="submitForm"
			action="${pageContext.request.contextPath}
	/UserServlet?view=queryNoticeView&method=queryNotice"
			method="post">
			<div>
				<span id="login_err" class="sty_txt2"><font color="red">${message}</font>
				</span>
			</div>
			<input type="hidden" name="1 =" value="1" />
			<div class="ui_content">

				<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">搜索</div>
						<div id="box_center">
							按时间查询:&nbsp;<input name="notice_time =" class="ui_input_txt04"
								data-ideal="date" type="text" onClick="WdatePicker()" />
							&nbsp;&nbsp;&nbsp; 按标题查询：&nbsp;<input type="text"
								name="notice_title like" />&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp; <input type="submit" name="submit" value="查询" />
						</div>
					</div>
				</div>
			</div>
		</form>

		<div class="ui_content">
			<div class="ui_tb">
				<table class="table" cellspacing="0" cellpadding="0" width="100%"
					align="center" border="0">
					<tr>
						<th width="0"><input type="checkbox" id="all"
							onclick="selectOrClearAllCheckbox(this);" /></th>
						<th>发布时间</th>
						<th>公告标题</th>
						<th>公告内容</th>
						<th>可见</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${noticeList}" var="notice">
						<tr>
							<td><input type="checkbox" name="IDCheck" value=""
								class="acb" />
							</td>
							<td>${notice.notice_time }</td>
							<td>${notice.notice_title }</td>
							<td>${notice.notice_content }</td>
							<td><c:choose>
									<c:when test="${notice.notice_onlyworksee ==1}">仅管理员可见</c:when>
									<c:otherwise>所有人都可见</c:otherwise>
								</c:choose></td>
							<td><a
								href="${pageContext.request.contextPath}/UserServlet?view=delNoticeView&method=delNotice&notice_id %3D=${notice.notice_id }">删除公告</a>
							</td>
						</tr>
					</c:forEach>


				</table>
			</div>
			<div class="ui_tb_h30">
				<div class="ui_flt" style="height: 30px; line-height: 30px;">
					共有 <span class="ui_txt_bold04">90</span> 条记录，当前第 <span
						class="ui_txt_bold04">1 / 9</span> 页
				</div>
				<div class="ui_frt">
					<!--    如果是第一页，则只显示下一页、尾页 -->

					<input type="button" value="首页" class="ui_input_btn01" /> <input
						type="button" value="上一页" class="ui_input_btn01" /> <input
						type="button" value="下一页" class="ui_input_btn01"
						onclick="jumpNormalPage(2);" /> <input type="button" value="尾页"
						class="ui_input_btn01" onclick="jumpNormalPage(9);" />



					<!--     如果是最后一页，则只显示首页、上一页 -->

					转到第<input type="text" id="jumpNumTxt" class="ui_input_txt01" />页 <input
						type="button" class="ui_input_btn01" value="跳转"
						onclick="jumpInputPage(9);" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
