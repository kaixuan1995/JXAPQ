<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>江西省动植物信息检索网站-Powered by bluedot</title>
<meta name="keywords" content="江西省动植物信息检索网站" />
<meta name="Author" content="bluedot" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

<script
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/jxapq/scripts/function.js"
	type="text/javascript"></script>

<link
	href="${pageContext.request.contextPath}/jxapq/style/authority/main_css.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/jxapq/style/style.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/jxapq/style/comm.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/jxapq/style/diy.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/jxapq/style/focus.css"
	type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/suggest/yahoo-dom-event.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/suggest/suggest.js"></script>
<script   
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>	
	

<script type="text/javascript">



$(function() {
	$.ajax({  
    	url: '${pageContext.request.contextPath}/UtilServlet?method=showNotices',  
        type: 'GET',  
        dataType: 'json',  
      //  timeout: 1000,  
      //  cache: false,  
        success: succFunction //成功执行方法    
    });
    
    $.ajax({
    	url: "${pageContext.request.contextPath}/UtilServlet?method=showResource",
    	type: "GET",
    	dataType: "json",
    	success: succStatistics
    });
    
    function succFunction(result) { 
    	for(var i=0; i<result.length; i++) {
    		var id = result[i].notice_id;
    		var title = result[i].notice_title;	
    		$("#notices").append("<li>" + id + "----------" + title + "</li>");  
    	}
    }  
    
     function succStatistics(result) {
   		$("#picture").text(result[0].number);
   		$("#biaoben").text(result[1].number);
    	$("#species").text(result[2].number);
    	$("#usercount").text(result[3].number);
    }
})
</script>

</head>
<body>

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
function  c_keyword()
 {
  if($("title").value=="")
  {
    alert("请输入关键词！");
    $("title").focus();
    return false;
  }
 }
 

function sub() {
	var q = publicname = document
			.getElementById("q").value;
	document.forms[0].action = document.forms[0].action + q;
	document.forms[0].submit();
}
function dosub() {
	var q = publicname = document
			.getElementById("q").value;
	document.forms[0].action = document.forms[0].action + q;
	document.forms[0].submit();
			
}
					
</script>
						<form action="${pageContext.request.contextPath}/jxapq/jsp/second.jsp?${pageContext.request.contextPath}/QueryServlet?method=indexquery&key="
							 method="post" onsubmit="dosub()">
							<input size="25/" maxlength="50" id="q" name="cname like "  class="search-input"
								value="请输入查找动植物的名称"
								onBlur="javascript:if(this.value=='')this.value='请输入查找动植物的名称';"
								onFocus="javascript:if(this.value=='请输入查找动植物的名称')this.value='';"
								style="height:40px;width:350px;float:left;border:2px solid #074177;line-height:40px;border-radius:5px 0 0 5px;margin-left:20px;"
								type="text" /> 
								
								<input style="height:40px;border:0px;width:40px;float:left;background-image:url('${pageContext.request.contextPath}/jxapq/images/ss.jpg');"
								 onclick="sub()" type="button" /> 
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
							class="menu">首页</a></li>
						<li class="menu_style" id="MenuItem62" name="MenuItem"><a
							href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp?${pageContext.request.contextPath}/jxapq/jsp/welcome.jsp?key=2"
							class="menu">动物界</a></li>
						<li class="menu_style" id="MenuItem63" name="MenuItem"><a
							href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp?${pageContext.request.contextPath}/jxapq/jsp/welcome.jsp?key=3"
							class="menu">植物界</a></li>
						<li class="menu_style" id="MenuItem67" name="MenuItem"><a
							href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp?${pageContext.request.contextPath}/jxapq/jsp/ap_data/gaojijiansuo.jsp"
							class="menu">高级检索</a></li>
						<li class="menu_style" id="MenuItem64" name="MenuItem"><a
							href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp?${pageContext.request.contextPath}/jxapq/jsp/ap_data/statistics.jsp"
							target="right" class="menu">统计</a></li>
						<li class="menu_style" id="MenuItem68" name="MenuItem"><a
							href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp"
							target="right" class="menu">地图</a></li>
						<li class="menu_style" id="MenuItem65" name="MenuItem"><a
							href="${pageContext.request.contextPath}/jxapq/jsp/second.jsp?${pageContext.request.contextPath}/jxapq/jsp/introduce.jsp"
							target="right" class="menu">联系我们</a></li>
					</ul>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			var IsPageHome = "1";
			var Lanmu_Id = "61";
			var Sublanmu_Id = "0";
			ShowSubMenu(Lanmu_Id);
		</script>
		<div class="banner">
			<script type="text/javascript">
				var Show_Style = 3;
				var Image_12 = new Array();
				var Pics = "${pageContext.request.contextPath}/jxapq/images/banner/001.jpg|${pageContext.request.contextPath}/jxapq/images/banner/002.jpg|${pageContext.request.contextPath}/jxapq/images/banner/003.jpg";
				var Links = "";
				var Titles = "";
				var Alts = "";
				var Apic12 = Pics.split('|');
				var ALink12 = Links.split('|');
				var ATitle12 = Titles.split('|');
				var AAlts12 = Alts.split('|');
				var Show_Text = 0;
				for (i = 0; i < Apic12.length; i++) {
					Image_12.src = Apic12[i];
				}

				var FHTML = '<div id="js_slide_focus_12" class="slide_focus focus_style3" style="height:400px">';
				FHTML += '<ul class="inner">';
				for ( var i = 0; i < Apic12.length; i++) {
					if (ALink12.length < (i + 1) || ALink12[i] == "") {
						ALink12[i] = "javascript:void(0)";
					}
					if (AAlts12.length < (i + 1)) {
						AAlts12[i] = "";
					}
					if (ATitle12.length < (i + 1)) {
						ATitle12[i] = "";
					}
					FHTML += '<li><a href="'+ALink12[i]+'" target="_self" title="'+AAlts12[i]+'"><img src="'+Apic12[i]+'">';
					FHTML += '<em>' + ATitle12[i] + '</em>';
					FHTML += '</a></li>';
				}
				FHTML += '</ul>';
				FHTML += '</div>';
				document.write(FHTML);
				$(function() {
					Slide_Focus("js_slide_focus_12", 1, 5, 1500, 400, true);
				});
			</script>
		</div>
		<div class="main_box main_box_style">
			<div class="main_box_inner">
				<div class="sy_con_2">
					<div class="title">
						<img
							src="${pageContext.request.contextPath}/jxapq/images/sy_1.png" /><span>News</span>新闻动态
					</div>
				</div>
				<div class="xw_con">
					<div class="xw_1">
						<div class="xw_4">
							快捷方式<span><a href="#">More+</a> </span>
						</div>
						<div class="xw_t">
							<img
								src="${pageContext.request.contextPath}/jxapq/images/xw_1_1.jpg">
						</div>
						<div>
							<div class="article">
								<ul>
									<li><span class="title"> <a href="#" target="_self"
											title="" style="">关于我们</a> </span> <span class="date">07-04</span> <span
										class="clear"></span>
									</li>
									<li><span class="title"> <a href="#" target="_self"
											title="" style="">资料下载</a> </span> <span class="date">07-04</span> <span
										class="clear"></span>
									</li>
									<li><span class="title"> <a href="#" target="_self"
											title="" style="">高级查询</a> </span> <span class="date">07-04</span> <span
										class="clear"></span>
									</li>
									<li><span class="title"> <a href="#" target="_self"
											title="" style="">统计</a> </span> <span class="date">07-04</span> <span
										class="clear"></span>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="xw_2">
						<div class="xw_4">
							最新公告<span><a href="#">More+</a> </span>
						</div>
						<div>
							<div id="notices" class="article">
								<ul id="notice">
								</ul>
							</div>
						</div>
					</div>
					<div class="xw_3">
						<div class="xw_4">
							站内资源<span><a href="#">More+</a> </span>
						</div>
						<div class="xw_t">
							<img
								src="${pageContext.request.contextPath}/jxapq/images/xw_1_1.jpg">
						</div>
						<div>
							<div class="article">
								<ul>
									
									<li><span class="title"> 本站共有物种： <span id="species"></span> 种 </span> </li>
									<li><span class="title"> 本站共有图片： <span id="picture"></span> 张 </span> </li>
									<li><span class="title"> 本站共有标本： <span id="biaoben"></span> 个 </span> </li>
									<li><span class="title"> 本站注册用户： <span id="usercount"></span> 个 </span> </li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="sy_con_1">
					<div class="title">
						<img
							src="${pageContext.request.contextPath}/jxapq/images/sy_2.png" /><span>Product</span>案例展示
					</div>
					<div class="mero">
						<a href="#">More+</a>
					</div>
				</div>
				<div class="cp_con">
					<ul class="product_pic">
						<li style="width:185px;height:275px;"><a href="#"
							target="_self"><img
								src="${pageContext.request.contextPath}/jxapq/images/banner/004.jpg"
								border="0" style="width:185px;height:275px;"> </a> <span
							class="title"> <a href="#" target="_self" title="HL-193">HL-193</a>
						</span>
						</li>
						<li style="width:185px;height:275px;"><a href="#"
							target="_self"><img
								src="${pageContext.request.contextPath}/jxapq/images/banner/005.jpg"
								border="0" style="width:185px;height:275px;"> </a> <span
							class="title"> <a href="#" target="_self" title="HL-193">HL-193</a>
						</span>
						</li>
						<li style="width:185px;height:275px;"><a href="#"
							target="_self"><img
								src="${pageContext.request.contextPath}/jxapq/images/banner/006.jpg"
								border="0" style="width:185px;height:275px;"> </a> <span
							class="title"> <a href="#" target="_self" title="HL-193">HL-193</a>
						</span>
						</li>
						<li style="width:185px;height:275px;"><a href="#"
							target="_self"><img
								src="${pageContext.request.contextPath}/jxapq/images/banner/007.jpg"
								border="0" style="width:185px;height:275px;"> </a> <span
							class="title"> <a href="#" target="_self" title="HL-193">HL-193</a>
						</span>
						</li>
						<li style="width:185px;height:275px;"><a href="#"
							target="_self"><img
								src="${pageContext.request.contextPath}/jxapq/images/banner/008.jpg"
								border="0" style="width:185px;height:275px;"> </a> <span
							class="title"> <a href="#" target="_self" title="HL-193">HL-193</a>
						</span>
						</li>
					</ul>
				</div>
			</div>
			<div class="clear main_box_inner_bottom"></div>
		</div>
		<div class="bottom_box">
			<div class="dbd">
				<div class="dbd_1" align="center">
					<a href="index.aspx">网站首页</a>&nbsp;|&nbsp;<a href="#">关于我们</a>&nbsp;|&nbsp;<a
						href="#">新闻动态</a>&nbsp;|&nbsp;<a href="#">产品中心</a>&nbsp;|&nbsp;<a
						href="#">资料下载</a>&nbsp;|&nbsp;<a href="#">联系我们</a>
				</div>

				<div class="dbd_3">
					<div class="dbd_3_1">
						<ul>
							<li>电话：0760-22517081</li>
							<li>传真：021-4545212X</li>
						</ul>
					</div>
					<div class="dbd_3_2">
						<img
							src="${pageContext.request.contextPath}/jxapq/images/dbd_ew.jpg" />
					</div>
				</div>
				<p align="center">
					本系统由<a target="_blank"
						href="http://baike.baidu.com/view/6177001.htm">江西农业大学蓝点工作室</a>制作
					Copyright <span style="font-family:Arial;">&copy;</span>
					2015&nbsp;&nbsp; bluedot
				</p>
			</div>
		</div>
		<div align='center' style='padding:5px'>
			Powered by <a href='http://baike.baidu.com/view/6177001.htm'
				target='_blank'><strong>bluedot</strong> </a>
		</div>
	</div>
</body>
</html>
