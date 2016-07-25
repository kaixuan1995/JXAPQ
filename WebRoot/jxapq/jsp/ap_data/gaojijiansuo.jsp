<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <TITLE> ZTREE DEMO - radio select menu</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<!--<link rel="stylesheet" href="../../../css/demo.css" type="text/css">
	<link rel="stylesheet" href="../../../css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="../../../js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="../../../js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="../../../js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript" src="../../../js/jquery.ztree.exedit-3.5.js"></script>-->



<script   
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery-1.4.4.min.js"
	type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/css/demo.css"
	type="text/css" rel="stylesheet" />
<!--首页模板的css结束-->
<!--后台模板的css开始-->
<link href="${pageContext.request.contextPath}/jxapq/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/jxapq/style/authority/common_style.css" rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/css/zTreeStyle/zTreeStyle.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.ztree.exedit-3.5.js"></script>
	<script type="text/javascript">
		var setting = {
			check: {
				enable: true,
				chkStyle: "radio",
				radioType: "all"
			},
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: onClick,
				onCheck: onCheck
			}
		};

		var zNodes =[
			{id:1, pId:0, name:"北京"},
			{id:2, pId:0, name:"天津"},
			{id:3, pId:0, name:"上海"},
			{id:6, pId:0, name:"重庆"},
			{id:4, pId:0, name:"河北省", open:true, nocheck:true},
			{id:41, pId:4, name:"石家庄"},
			{id:42, pId:4, name:"保定"},
			{id:43, pId:4, name:"邯郸"},
			{id:44, pId:4, name:"承德"},
			{id:5, pId:0, name:"广东省", open:true, nocheck:true},
			{id:51, pId:5, name:"广州"},
			{id:52, pId:5, name:"深圳"},
			{id:53, pId:5, name:"东莞"},
			{id:54, pId:5, name:"佛山"},
			{id:6, pId:0, name:"福建省", open:true, nocheck:true},
			{id:61, pId:6, name:"福州"},
			{id:62, pId:6, name:"厦门"},
			{id:63, pId:6, name:"泉州"},
			{id:64, pId:6, name:"三明"}
		 ];

		function onClick(e, treeId, treeNode) {
			if(e.target.parentNode.parentNode.parentNode.id == "treeDemo") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}
			if(e.target.parentNode.parentNode.parentNode.id == "treeDemo1") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}
			if(e.target.parentNode.parentNode.parentNode.id == "treeDemo2") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo2");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}
			if(e.target.parentNode.parentNode.parentNode.id == "treeDemo3") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo3");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}
			if(e.target.parentNode.parentNode.parentNode.id == "treeDemo4") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo4");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}
			if(e.target.parentNode.parentNode.parentNode.id == "treeDemo5") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo5");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}
			if(e.target.parentNode.parentNode.parentNode.id == "treeDemo6") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo6");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}
			if(e.target.parentNode.parentNode.parentNode.id == "treeDemo7") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo7");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}
			if(e.target.parentNode.parentNode.parentNode.id == "treeDemo8") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo8");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}
			if(e.target.parentNode.parentNode.parentNode.id == "treeDemo9") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo9");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}
		}

		function onCheck(e, treeId, treeNode) {
			var flag = e.target.parentNode.parentNode.lastChild.id;
			if(flag == "citySel") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
				nodes = zTree.getCheckedNodes(true),
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				var cityObj = $("#citySel");
				cityObj.attr("value", v);
			}
			if(flag == "citySel1") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo1"),
				nodes = zTree.getCheckedNodes(true),
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				var cityObj = $("#citySel1");
				cityObj.attr("value", v);
			}
			if(flag == "citySel2") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo2"),
				nodes = zTree.getCheckedNodes(true),
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				var cityObj = $("#citySel2");
				cityObj.attr("value", v);
			}
			if(flag == "citySel3") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo3"),
				nodes = zTree.getCheckedNodes(true),
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				var cityObj = $("#citySel3");
				cityObj.attr("value", v);
			}
			if(flag == "citySel4") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo4"),
				nodes = zTree.getCheckedNodes(true),
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				var cityObj = $("#citySel4");
				cityObj.attr("value", v);
			}
			if(flag == "citySel5") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo5"),
				nodes = zTree.getCheckedNodes(true),
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				var cityObj = $("#citySel5");
				cityObj.attr("value", v);
			}
			if(flag == "citySel6") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo6"),
				nodes = zTree.getCheckedNodes(true),
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				var cityObj = $("#citySel6");
				cityObj.attr("value", v);
			}
			if(flag == "citySel7") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo7"),
				nodes = zTree.getCheckedNodes(true),
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				var cityObj = $("#citySel7");
				cityObj.attr("value", v);
			}
			if(flag == "citySel8") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo8"),
				nodes = zTree.getCheckedNodes(true),
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				var cityObj = $("#citySel8");
				cityObj.attr("value", v);
			}
			if(flag == "citySel9") {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo9"),
				nodes = zTree.getCheckedNodes(true),
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				var cityObj = $("#citySel9");
				cityObj.attr("value", v);
			}
		}
		
</script>
<script type="text/javascript">
		function showMenu(ht) {
			var data;
			var index = ht.parentNode.firstChild.selectedIndex;
			var text = ht.parentNode.firstChild.options[index].text; // 选中文本
			var tp = ht.parentNode.parentNode.parentNode.id;
			
			
			if(text == '请选择') {
				return;
			}else if(text == '中文名') {
				return;
			} else if(text == '学名') {
				return;
			} else if(text == '异名') {
				return;
			} else if(text == '俗名') {
				return;
			} else if(text == '命名人') {
				return;	
			} else if(text == '地理分布型') {
				data = ${地理分布型2};
			} else if(text == '国家保护级别') {
				if(tp == 't_layer_1') {
					data = ${国家保护级别2};
				}
				else {
					data = ${国家保护级别3};
				}
			} else if(text == 'IUCN红色名录等级') {
				if(tp == 't_layer_1') {
					data = ${IUCN红色名录等级2};
				}
				else {
					data = ${IUCN红色名录等级3};
				}
			} else if(text == '省保护级别') {
				if(tp == 't_layer_1') {
					data = ${省保护级别2};
				}
				else {
					data = ${省保护级别3};
				}
			} else if(text == '中国红色名录等级') {
				if(tp == 't_layer_1') {
					data = ${中国红色名录等级2};
				}
				else {
					data = ${中国红色名录等级3};
				}
			} else if(text == 'CITES保护等级') {
				if(tp == 't_layer_1') {
					data = ${CITES保护等级2};
				}
				else {
					data = ${CITES保护等级3};
				}
			} else if(text == '区系类型') {
				if(tp == 't_layer_1') {
					data = ${区系类型2};
				}
				else {
					data = ${区系类型3};
				}
			} else if(text == '居留型') {
					data = ${居留型2};
			} else if(text == '生活型') {
				data = ${生活型3};
			} else if(text == '省内分布') {
				if(tp == 't_layer_1') {
					data = ${省内分布2};
				}
				else {
					data = ${省内分布3};
				}
			} else if(text == '中国特有') {
				if(tp == 't_layer_1') {
					data = ${中国特有2};
				}
				else {
					data = ${中国特有3};
				}
			} else if(text == '三有物种') {
					data = ${三有物种2};
			} else if(text == '引种栽培') {
					data = ${引种栽培3};
			} else if(text == '饲养状况') {
					data = ${饲养状况2};
			}
		
			var jsonObject = eval(data);
			if(ht.id == "citySel") {
				$.fn.zTree.init($("#treeDemo"), setting, jsonObject);
				var cityObj = $("#citySel");
				var cityOffset = $("#citySel").offset();
				$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");	
				$("body").bind("mousedown", onBodyDown);
			}
			if(ht.id == "citySel1") {
				$.fn.zTree.init($("#treeDemo1"), setting, jsonObject);
				var cityObj = $("#citySel1");
				var cityOffset = $("#citySel1").offset();
				$("#menuContent1").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");	
				$("body").bind("mousedown", onBodyDown);
			}
			if(ht.id == "citySel2") {
				$.fn.zTree.init($("#treeDemo2"), setting, jsonObject);
				var cityObj = $("#citySel2");
				var cityOffset = $("#citySel2").offset();
				$("#menuContent2").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");	
				$("body").bind("mousedown", onBodyDown);
			}
			if(ht.id == "citySel3") {
				$.fn.zTree.init($("#treeDemo3"), setting, jsonObject);
				var cityObj = $("#citySel3");
				var cityOffset = $("#citySel3").offset();
				$("#menuContent3").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");	
				$("body").bind("mousedown", onBodyDown);
			}
			if(ht.id == "citySel4") {
				$.fn.zTree.init($("#treeDemo4"), setting, jsonObject);
				var cityObj = $("#citySel4");
				var cityOffset = $("#citySel4").offset();
				$("#menuContent4").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");	
				$("body").bind("mousedown", onBodyDown);
			}
		if(ht.id == "citySel5") {
				$.fn.zTree.init($("#treeDemo5"), setting, jsonObject);
				var cityObj = $("#citySel5");
				var cityOffset = $("#citySel5").offset();
				$("#menuContent5").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");	
				$("body").bind("mousedown", onBodyDown);
			}
			if(ht.id == "citySel6") {
				$.fn.zTree.init($("#treeDemo6"), setting, jsonObject);
				var cityObj = $("#citySel6");
				var cityOffset = $("#citySel6").offset();
				$("#menuContent6").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");	
				$("body").bind("mousedown", onBodyDown);
			}
			if(ht.id == "citySel7") {
				$.fn.zTree.init($("#treeDemo7"), setting, jsonObject);
				var cityObj = $("#citySel7");
				var cityOffset = $("#citySel7").offset();
				$("#menuContent7").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");	
				$("body").bind("mousedown", onBodyDown);
			}
			if(ht.id == "citySel8") {
				$.fn.zTree.init($("#treeDemo8"), setting, jsonObject);
				var cityObj = $("#citySel8");
				var cityOffset = $("#citySel8").offset();
				$("#menuContent8").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");	
				$("body").bind("mousedown", onBodyDown);
			}
			if(ht.id == "citySel9") {
				$.fn.zTree.init($("#treeDemo9"), setting, jsonObject);
				var cityObj = $("#citySel9");
				var cityOffset = $("#citySel9").offset();
				$("#menuContent9").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");	
				$("body").bind("mousedown", onBodyDown);
			}
		}
		
		
		function hideMenu() {
			$("#menuContent").fadeOut("fast");$("#menuContent5").fadeOut("fast");
			$("#menuContent1").fadeOut("fast");$("#menuContent6").fadeOut("fast");
			$("#menuContent2").fadeOut("fast");$("#menuContent7").fadeOut("fast");
			$("#menuContent3").fadeOut("fast");$("#menuContent8").fadeOut("fast");
			$("#menuContent4").fadeOut("fast");$("#menuContent9").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(
			
			event.target.id == "menuBtn" || 
			event.target.id == "citySel" || event.target.id == "citySel1" || event.target.id == "citySel2" || event.target.id == "citySel3" || event.target.id == "citySel4" || 
			event.target.id == "citySel5" ||event.target.id == "citySel6" ||event.target.id == "citySel7" ||event.target.id == "citySel8" ||event.target.id == "citySel9" || 
			event.target.id == "menuContent" || event.target.id == "menuContent1" || event.target.id == "menuContent2" || event.target.id == "menuContent3" || event.target.id == "menuContent4" || 
			event.target.id == "menuContent5" || event.target.id == "menuContent6" || event.target.id == "menuContent7" || event.target.id == "menuContent8" || event.target.id == "menuContent9" || 
			$(event.target).parents("#menuContent").length>0 ||$(event.target).parents("#menuContent1").length>0 ||
			$(event.target).parents("#menuContent2").length>0 ||$(event.target).parents("#menuContent3").length>0 ||$(event.target).parents("#menuContent4").length>0 ||
			$(event.target).parents("#menuContent5").length>0 ||$(event.target).parents("#menuContent6").length>0 ||
			$(event.target).parents("#menuContent7").length>0 ||$(event.target).parents("#menuContent8").length>0 ||$(event.target).parents("#menuContent9").length>0 
			)) {
				hideMenu();
			}
		}

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);$.fn.zTree.init($("#treeDemo5"), setting, zNodes);
			$.fn.zTree.init($("#treeDemo1"), setting, zNodes);$.fn.zTree.init($("#treeDemo6"), setting, zNodes);
			$.fn.zTree.init($("#treeDemo2"), setting, zNodes);$.fn.zTree.init($("#treeDemo7"), setting, zNodes);
			$.fn.zTree.init($("#treeDemo3"), setting, zNodes);$.fn.zTree.init($("#treeDemo8"), setting, zNodes);
			$.fn.zTree.init($("#treeDemo4"), setting, zNodes);$.fn.zTree.init($("#treeDemo9"), setting, zNodes);
		});
</script>	
<script type="text/javascript">	
		function searchange(sel) {
			var index = sel.selectedIndex; // 选中索引
			var text = sel.options[index].text; // 选中文本
			var value = sel.options[index].value; // 选中值
			if(text == '请选择') {
				return;
			} else if(text == '中文名') {
				sel.parentNode.lastChild.name = "cname like";
			} else if(text == '学名') {
				sel.parentNode.lastChild.name = "sname like";
			} else if(text == '异名') {
				sel.parentNode.lastChild.name = "species_synonym like";
			} else if(text == '俗名') {
				sel.parentNode.lastChild.name = "species_commonInfo like";			
			} else if(text == '命名人') {
				sel.parentNode.lastChild.name = "species_discover like";		
			} else if(text == '地理分布型') {
				sel.parentNode.lastChild.name = "species_geodist =";
			} else if(text == '国家保护级别') {
				sel.parentNode.lastChild.name = "species_coupro =";
			} else if(text == 'IUCN红色名录等级') {
				sel.parentNode.lastChild.name = "species_iucn =";
			} else if(text == '省保护级别') {
				sel.parentNode.lastChild.name = "species_provpro =";
			} else if(text == '中国红色名录等级') {
				sel.parentNode.lastChild.name = "species_credpro =";
			} else if(text == 'CITES保护等级') {
				sel.parentNode.lastChild.name = "species_cites =";
			} else if(text == '区系类型') {
				sel.parentNode.lastChild.name = "subreginal_name =";
			} else if(text == '居留型') {
				sel.parentNode.lastChild.name = "species_resitype =";
			} else if(text == '生活型') {
				sel.parentNode.lastChild.name = "species_lifetype =";
			} else if(text == '省内分布') {
				sel.parentNode.lastChild.name = "distribute_name like";
			} else if(text == '中国特有') {
				sel.parentNode.lastChild.name = "species_onlychina =";
			} else if(text == '三有物种') {
				sel.parentNode.lastChild.name = "species_three =";
			} else if(text == '引种栽培') {
				sel.parentNode.lastChild.name = "species_intculti =";
			} else if(text == '饲养状况') {
				sel.parentNode.lastChild.name = "species_feedstate =";
			}
		}
	</script>
	<style type="text/css">
	</style>
  </head>
  <style type="text/css">
table {
	line-height: 25px;
}
th {
	border: 1px solid #aaa
}
td {
	text-align: center;
	border: 1px solid #aaa
}
tr:hover {
	background-color: #A9C3DD
}
</style>
<script type="text/javascript">
   
        function showLayer(group, id)
        {
            //处理Item
            var count = 1;
            var obj = document.getElementById(group + "_item_" + count);
            while (obj != null)
            {
                obj.className = "panel_item";
                
                count++;
                obj = document.getElementById(group + "_item_" + count);
            }
            document.getElementById(group + "_item_" + id).className = "panel_item_show";
            
            //处理Layer
            count = 1;
            obj = document.getElementById(group + "_layer_" + count);
            while (obj != null)
            {
                obj.style.display = "none";                
                count++;
                obj = document.getElementById(group + "_layer_" + count);
            }
            document.getElementById(group + "_layer_" + id).style.display = "block";
        }
    </script>
<style  type="text/css">
.panel {
	border-left: 1px solid #C1D5F1;
	border-right: 1px solid #C1D5F1;
	border-bottom: 1px solid #C1D5F1;
}
.panel_head {
	color: #004499;
	height: 24px;
	line-height: 24px;
}
.panel_item {
	float: left;
	border-top: 1px solid #C1D5F1;
	border-bottom: 1px solid #C1D5F1;
	background-color: #E7F1FF;
	text-align: center;
}
.panel_item_show {
	float: left;
	border-top: 1px solid #C1D5F1;
	background-color: #FFFFFF;
	font-weight: bold;
	text-align: center;
}
.panel_item_spacing {
	float: left;
	height: 25px;
	border-left: 1px solid #C1D5F1;
	border-right: 1px solid #C1D5F1;
	border-bottom: 1px solid #C1D5F1;
}
.panel_body {
	clear: both;
}
.panel_foot {
}
</style>
  
  <body>
  <p>
<div id="box_top">动植物高级检索</div>

<div class="main">
  <div class="content">
    <div align="center" style="margin:50px 0px;">
      <div class="panel" style="width:90%;">
        <div class="panel_head">
          <div id="t_item_1" class="panel_item_show" style="width:120px;" onclick="showLayer('t', 1);">动物检索</div>
          <div class="panel_item_spacing" style="width:18px;"></div>
          <div id="t_item_2" class="panel_item" style="width:120px;" onclick="showLayer('t', 2);">植物检索</div>
        </div>
        <div class="panel_body"> 
          <!--动物-->
          <div id="t_layer_1">
		 <form action="${pageContext.request.contextPath }/QueryServlet?view=highquery&method=query" method="post">
		  <div align="left" class="content_wrap"><select onChange="searchange(this)" class="">
				<option value="请选择">请选择</option>
				<option value="中文名">中文名</option>
				<option value="学名">学名</option>
				<option value="俗名">俗名</option>
				<option value="地理分布型">地理分布型</option>
				<option value="国家保护级别">国家保护级别</option>
				<option value="IUCN红色名录等级">IUCN红色名录等级</option>
				<option value="省保护级别">省保护级别</option>
				<option value="中国红色名录等级">中国红色名录等级</option>
				<option value="CITES保护等级">CITES保护等级</option>
				<option value="区系类型">区系类型</option>
				<option value="居留型">居留型</option>
				<option value="省内分布">省内分布</option>
				<option value="中国特有">中国特有</option>
				<option value="三有物种">三有物种</option>
				<option value="饲养状况">饲养状况</option>
			</select>
			<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
			<input id="citySel" type="text" name="" value="" style="width:120px;" onclick="showMenu(this);" /></div>
			
			<div align="left" class="content_wrap"><select onChange="searchange(this)" class="">
				<option value="请选择">请选择</option>
				<option value="中文名">中文名</option>
				<option value="学名">学名</option>
				<option value="俗名">俗名</option>
				<option value="地理分布型">地理分布型</option>
				<option value="国家保护级别">国家保护级别</option>
				<option value="IUCN红色名录等级">IUCN红色名录等级</option>
				<option value="省保护级别">省保护级别</option>
				<option value="中国红色名录等级">中国红色名录等级</option>
				<option value="CITES保护等级">CITES保护等级</option>
				<option value="区系类型">区系类型</option>
				<option value="居留型">居留型</option>
				<option value="省内分布">省内分布</option>
				<option value="中国特有">中国特有</option>
				<option value="三有物种">三有物种</option>
				<option value="饲养状况">饲养状况</option>
			</select>
			<div id="menuContent1" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo1" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
			<input id="citySel1" type="text" name="" value="" style="width:120px;" onclick="showMenu(this);" /></div>
		
		
		  <div align="left" class="content_wrap"><select onChange="searchange(this)" class="">
				<option value="请选择">请选择</option>
				<option value="中文名">中文名</option>
				<option value="学名">学名</option>
				<option value="俗名">俗名</option>
				<option value="地理分布型">地理分布型</option>
				<option value="国家保护级别">国家保护级别</option>
				<option value="IUCN红色名录等级">IUCN红色名录等级</option>
				<option value="省保护级别">省保护级别</option>
				<option value="中国红色名录等级">中国红色名录等级</option>
				<option value="CITES保护等级">CITES保护等级</option>
				<option value="区系类型">区系类型</option>
				<option value="居留型">居留型</option>
				<option value="省内分布">省内分布</option>
				<option value="中国特有">中国特有</option>
				<option value="三有物种">三有物种</option>
				<option value="饲养状况">饲养状况</option>
			</select>
			<div id="menuContent2" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo2" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
			<input id="citySel2" type="text" name="" value="" style="width:120px;" onclick="showMenu(this);" /></div>
		
		  <div align="left" class="content_wrap"><select onChange="searchange(this)" class="">
				<option value="请选择">请选择</option>
				<option value="中文名">中文名</option>
				<option value="学名">学名</option>
				<option value="俗名">俗名</option>
				<option value="地理分布型">地理分布型</option>
				<option value="国家保护级别">国家保护级别</option>
				<option value="IUCN红色名录等级">IUCN红色名录等级</option>
				<option value="省保护级别">省保护级别</option>
				<option value="中国红色名录等级">中国红色名录等级</option>
				<option value="CITES保护等级">CITES保护等级</option>
				<option value="区系类型">区系类型</option>
				<option value="居留型">居留型</option>
				<option value="省内分布">省内分布</option>
				<option value="中国特有">中国特有</option>
				<option value="三有物种">三有物种</option>
				<option value="饲养状况">饲养状况</option>
			</select>
			<div id="menuContent3" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo3" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
			<input id="citySel3" type="text" name="" value="" style="width:120px;" onclick="showMenu(this);" /></div>
		
		  <div align="left" class="content_wrap"><select onChange="searchange(this)" class="">
				<option value="请选择">请选择</option>
				<option value="中文名">中文名</option>
				<option value="学名">学名</option>
				<option value="俗名">俗名</option>
				<option value="地理分布型">地理分布型</option>
				<option value="国家保护级别">国家保护级别</option>
				<option value="IUCN红色名录等级">IUCN红色名录等级</option>
				<option value="省保护级别">省保护级别</option>
				<option value="中国红色名录等级">中国红色名录等级</option>
				<option value="CITES保护等级">CITES保护等级</option>
				<option value="区系类型">区系类型</option>
				<option value="居留型">居留型</option>
				<option value="省内分布">省内分布</option>
				<option value="中国特有">中国特有</option>
				<option value="三有物种">三有物种</option>
				<option value="饲养状况">饲养状况</option>
			</select>
			<div id="menuContent4" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo4" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
			<input id="citySel4" type="text" name="" value="" style="width:120px;" onclick="showMenu(this);" /></div>
		
			<div align="left"><input type="submit" value="确认搜索" /></div>
			</form>
          </div>
          
          
          <!--植物-->
          <div id="t_layer_2" style="display:none;">
          <form action="${pageContext.request.contextPath }/QueryServlet?view=highquery&method=query" method="post">
			
		  <div align="left" class="content_wrap"><select onChange="searchange(this)" class="">
				<option value="请选择">请选择</option>
				<option value="中文名">中文名</option>
				<option value="学名">学名</option>
				<option value="异名">异名</option>
				<option value="俗名">俗名</option>
				<option value="命名人">命名人</option>
				<option value="国家保护级别">国家保护级别</option>
				<option value="IUCN红色名录等级">IUCN红色名录等级</option>
				<option value="省保护级别">省保护级别</option>
				<option value="中国红色名录等级">中国红色名录等级</option>
				<option value="CITES保护等级">CITES保护等级</option>
				<option value="区系类型">区系类型</option>
				<option value="生活型">生活型</option>
				<option value="省内分布">省内分布</option>
				<option value="中国特有">中国特有</option>
				<option value="引种栽培">引种栽培</option>
			</select>
			<div id="menuContent5" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo5" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
			<input id="citySel5" type="text" name="" value="" style="width:120px;" onclick="showMenu(this);" /></div>
			
			<div align="left" class="content_wrap"><select onChange="searchange(this)" class="">
				<option value="请选择">请选择</option>
				<option value="中文名">中文名</option>
				<option value="学名">学名</option>
				<option value="异名">异名</option>
				<option value="俗名">俗名</option>
				<option value="命名人">命名人</option>
				<option value="国家保护级别">国家保护级别</option>
				<option value="IUCN红色名录等级">IUCN红色名录等级</option>
				<option value="省保护级别">省保护级别</option>
				<option value="中国红色名录等级">中国红色名录等级</option>
				<option value="CITES保护等级">CITES保护等级</option>
				<option value="区系类型">区系类型</option>
				<option value="生活型">生活型</option>
				<option value="省内分布">省内分布</option>
				<option value="中国特有">中国特有</option>
				<option value="引种栽培">引种栽培</option>
			</select>
			<div id="menuContent6" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo6" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
			<input id="citySel6" type="text" name="" value="" style="width:120px;" onclick="showMenu(this);" /></div>
		
		
		  <div align="left" class="content_wrap"><select onChange="searchange(this)" class="">
			<option value="请选择">请选择</option>
			<option value="中文名">中文名</option>
			<option value="学名">学名</option>
			<option value="异名">异名</option>
			<option value="俗名">俗名</option>
			<option value="命名人">命名人</option>
			<option value="国家保护级别">国家保护级别</option>
			<option value="IUCN红色名录等级">IUCN红色名录等级</option>
			<option value="省保护级别">省保护级别</option>
			<option value="中国红色名录等级">中国红色名录等级</option>
			<option value="CITES保护等级">CITES保护等级</option>
			<option value="区系类型">区系类型</option>
			<option value="生活型">生活型</option>
			<option value="省内分布">省内分布</option>
			<option value="中国特有">中国特有</option>
			<option value="引种栽培">引种栽培</option>
			</select>
			<div id="menuContent7" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo7" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
			<input id="citySel7" type="text" name="" value="" style="width:120px;" onclick="showMenu(this);" /></div>
		
		  <div align="left" class="content_wrap"><select onChange="searchange(this)" class="">
			<option value="请选择">请选择</option>
			<option value="中文名">中文名</option>
			<option value="学名">学名</option>
			<option value="异名">异名</option>
			<option value="俗名">俗名</option>
			<option value="命名人">命名人</option>
			<option value="国家保护级别">国家保护级别</option>
			<option value="IUCN红色名录等级">IUCN红色名录等级</option>
			<option value="省保护级别">省保护级别</option>
			<option value="中国红色名录等级">中国红色名录等级</option>
			<option value="CITES保护等级">CITES保护等级</option>
			<option value="区系类型">区系类型</option>
			<option value="生活型">生活型</option>
			<option value="省内分布">省内分布</option>
			<option value="中国特有">中国特有</option>
			<option value="引种栽培">引种栽培</option>
			</select>
			<div id="menuContent8" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo8" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
			<input id="citySel8" type="text" name="" value="" style="width:120px;" onclick="showMenu(this);" /></div>
		
		  <div align="left" class="content_wrap"><select onChange="searchange(this)" class="">
				<option value="请选择">请选择</option>
				<option value="中文名">中文名</option>
				<option value="学名">学名</option>
				<option value="异名">异名</option>
				<option value="俗名">俗名</option>
				<option value="命名人">命名人</option>
				<option value="国家保护级别">国家保护级别</option>
				<option value="IUCN红色名录等级">IUCN红色名录等级</option>
				<option value="省保护级别">省保护级别</option>
				<option value="中国红色名录等级">中国红色名录等级</option>
				<option value="CITES保护等级">CITES保护等级</option>
				<option value="区系类型">区系类型</option>
				<option value="生活型">生活型</option>
				<option value="省内分布">省内分布</option>
				<option value="中国特有">中国特有</option>
				<option value="引种栽培">引种栽培</option>
			</select>
			<div id="menuContent9" class="menuContent" style="display:none; position: absolute;">
			<ul id="treeDemo9" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
			</div>
			<input id="citySel9" type="text" name="" value="" style="width:120px;" onclick="showMenu(this)" /></div>
			<div align="left"><input type="submit" value="确认搜索" /></div>
			</form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
  </body>
</html>
