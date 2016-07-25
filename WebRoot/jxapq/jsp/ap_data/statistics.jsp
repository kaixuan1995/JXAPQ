<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>江西省动植物信息检索系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/jxapq/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/jxapq/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/jxapq/scripts/jquery-1.8.2.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/jxapq/scripts/jquery.cityselect.js"></script>

</head>
<script type="text/javascript">
	//加载市
	$(function() {
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/UtilServlet?method=query&type=city',
			dataType : 'json',
			success : function(result) {
				$.each(result, function(entryIndex, entry) {
					var html = "<option value='" + entry.name + "'>"
							+ entry.name + "</option>";
					$("#selcity").append(html);	
				});
			}
		});
		//加载保护区
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath }/UtilServlet?method=query&type=area',
			dataType : 'json',
			success : function(result) {
				$.each(result, function(entryIndex, entry) {
					var html = "<option value='" + entry.name + "'>" 
								+ entry.name + "</option>";
					$("#proArea").append(html);
				})
			}
		})
	})
	
	//获取县
	function getArea() {
		$("#selarea option[value!=0]").remove();
		var object = $("#selcity");
		if (object.val() != 0) {
			$.ajax( {
				type :'post',
				url :'${pageContext.request.contextPath}/UtilServlet?method=query&type=xian',
				data : {
					id :object.val()
				},
				dataType :'json',
				success : function(result) {
					$.each(result, function(entryIndex, entry) {
						var html = "<option value='" + entry["name"] + "'>"
								+ entry["name"] + "</option>";
						$("#selarea").append(html);
					});
				}
			});
		}
	}
	
	//获取保护等级
	function getGrage() {
		$("#grage option[value!=0]").remove();
		var object = $("#pro");
		if (object.val() != 0) {
			$.ajax( {
				type :'post',
				url :'${pageContext.request.contextPath}/UtilServlet?method=query&type=grage',
				data : {
					id :object.val()
				},
				dataType :'json',
				success : function(result) {
					$.each(result, function(entryIndex, entry) {
						var html = "<option value='" + entry["name"] + "'>"
								+ entry["name"] + "</option>";
						$("#grage").append(html);
					});
				}
			});
		}
	}
	//获取门
	function getMen() {
		$("#men option[value!=0]").remove();
		var object = $("#jie");
		if (object.val() != 0) {
			$.ajax( {
				type :'post',
				url :'${pageContext.request.contextPath}/UtilServlet?method=query&type=men',
				data : {
					id :object.val()
				},
				dataType :'json',
				success : function(result) {
					$.each(result, function(entryIndex, entry) {
						var html = "<option value='" + entry["id"] + "'>"
								+ entry["name"] + "</option>";
						$("#men").append(html);
					});
				}
			});
		}
	}
	//获取纲
	function getGang() {
		$("#gang option[value!=0]").remove();
		var object = $("#men");
		if (object.val() != 0) {
			$.ajax( {
				type :'post',
				url :'${pageContext.request.contextPath}/UtilServlet?method=query&type=gang',
				data : {
					id :object.val()
				},
				dataType :'json',
				success : function(result) {
					$.each(result, function(entryIndex, entry) {
						var html = "<option value='" + entry["id"] + "'>"
								+ entry["name"] + "</option>";
						$("#gang").append(html);
					});
				}
			});
		}
	}
	//获取目
	function getMu() {
		$("#mu option[value!=0]").remove();
		var object = $("#gang");
		if (object.val() != 0) {
			$.ajax( {
				type :'post',
				url :'${pageContext.request.contextPath}/UtilServlet?method=query&type=mu',
				data : {
					id :object.val()
				},
				dataType :'json',
				success : function(result) {
					$.each(result, function(entryIndex, entry) {
						var html = "<option value='" + entry["id"] + "'>"
								+ entry["name"] + "</option>";
						$("#mu").append(html);
					});
				}
			});
		}
	}
	//获取科
	function getKe() {
		$("#ke option[value!=0]").remove();
		var object = $("#mu");
		if (object.val() != 0) {
			$.ajax( {
				type :'post',
				url :'${pageContext.request.contextPath}/UtilServlet?method=query&type=ke',
				data : {
					id :object.val()
				},
				dataType :'json',
				success : function(result) {
					$.each(result, function(entryIndex, entry) {
						var html = "<option value='" + entry["id"] + "'>"
								+ entry["name"] + "</option>";
						$("#ke").append(html);
					});
				}
			});
		}
	}
	//获取属
	function getShu() {
		$("#shu option[value!=0]").remove();
		var object = $("#ke");
		if (object.val() != 0) {
			$.ajax( {
				type :'post',
				url :'${pageContext.request.contextPath}/UtilServlet?method=query&type=shu',
				data : {
					id :object.val()
				},
				dataType :'json',
				success : function(result) {
					$.each(result, function(entryIndex, entry) {
						var html = "<option value='" + entry["id"] + "'>"
								+ entry["name"] + "</option>";
						$("#shu").append(html);
					});
				}
			});
		}
	}
	
</script>

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
	<form action="<c:url value='/UtilServlet?method=statistics'/>" method="post">
		<table width="100%" cellpadding="0" cellspacing="0" >             
			<tr>
				<td>分类等级：</td>
				<td>   
   					<select id="jie" name="kingdom_id" class="ui_select01" onchange="getMen()">
         				<option value="0">--请选择界--</option>
         				<option value="1">植物界</option>
         				<option value="2">动物界</option>
			       	</select>  
			       	<select id="men" name="phylum_id" class="ui_select01" onchange="getGang()">
			         	<option value="0">--请选择门--</option>               
			       	</select>            
			       	<select id="gang" name="class_id" class="ui_select01" onchange="getMu()">
			         	<option value="0">--请选择纲--</option>               
			       	</select>  
			      	<select id="mu" name="order_id" class="ui_select01" onchange="getKe()">
			         	<option value="0">--请选择目--</option>               
			       	</select>
			       	<select id="ke" name="family_id" class="ui_select01" onchange="getShu()">
			         	<option value="0">--请选择科--</option>               
			       	</select>  
			       	<select id="shu" name="fucus_id" class="ui_select01">
			         	<option value="0">--请选择属--</option>               
			       	</select>    
			    </td>
   			</tr>      
			<tr>
      			<td>地理位置：</td>
                <td> 
                	<select 0class="ui_select01">
                		<option selected="selected" >江西省</option>       
                	</select>
                	<select id="selcity" name="city" class="ui_select01" onchange="getArea()">
                		<option value="0">--请选择市--</option>
                	</select>
                	<select id="selarea" name="county" class="ui_select01">
                		<option value="0">--请选择县--</option>
                	</select>
			</t>
			</tr>       		  		               
             <tr>
                <td >保护区：</td>
                <td>
              		<select id="proArea" name="protection_name" class="ui_select01">              
 						<option value="0">--选择保护区--</option>
                    </select>
             	</td>
             </tr>
             <tr>
                <td>保护级别：</td>
                <td>
                	<select id="pro" name="protectedType" class="ui_select01" onchange="getGrage()">
                		<option value="0">--选择保护类型--</option>
                    	<option value="species_coupro">国家保护级别</option>
                    	<option value="species_iucn">IUCN红色名录等级</option>
                    	<option value="species_credpro">中国红色名录等级</option>
                    	<option value="species_provpro">省保护级别</option>
                    	<option value="species_cites">CITES保护等级</option>
                    	<option value="species_three">三有物种</option>
                    	<option value="species_onlychina">中国特有</option>
                    	<option value="species_resitype">居留型</option>    
                    </select> 
                    <select id="grage" name="protectedGrage" class="ui_select01">
                    	<option value="0">--选择保护级别--</option>
                    </select> 
                </td>
              </tr>             
            <tr>
                <td colspan="2"><input type="submit" value="统计"   class="ui_input_btn01"/></td>
        	</tr>                          
    	</table>
	</form>       
</body>
</html>
