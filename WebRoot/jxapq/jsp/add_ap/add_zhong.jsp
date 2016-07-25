<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>江西省动植物信息检索系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-form.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery.js"></script>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/check.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.4.4.min.js"></script>
<script
	src="${pageContext.request.contextPath}/jxapq/scripts/My97DatePicker/WdatePicker.js"
	type="text/javascript" defer></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/artDialog/artDialog.js?skin=default"></script>
<script type="text/javascript">
	function submit() {
		if(!getConf()){//在校验表单时不符合的字段，不能提交
			return;
		}
		getLevel();
		$.ajax({
			url : "${pageContext.request.contextPath }/UpdateServlet?method=add2&view=addZhongView",
			type : "POST",
			data : $('#submitDiv :text,textarea,select'),
			success : function(data) {
				if ("\"添加信息成功\"" == data) {
					removeText();
					alert(data);
				} else {
					alert("添加信息失败");
				}
			},
		});
		return false;
	};

	if ('${message}' != "") {
		alert('${message}');
	}

	function downloadTemplate(file) {
		self.location = "${pageContext.request.contextPath}/UtilServlet?method=downloadTemplate&filename="
				+ file;
	}

	function removeText() {
		if (document.getElementById("species_discover") != null) {
			document.getElementById("species_discover").value = "";
		}

		document.getElementById("species_cname").value = "";
		document.getElementById("species_ename").value = "";
		document.getElementById("species_spelling").value = "";
		document.getElementById("species_commoninfo").value = "";
		document.getElementById("species_habitat").value = "";
		if (document.getElementById("species_habit") != null) {
			document.getElementById("species_habit").value = "";
		}

		document.getElementById("species_addword").value = "";
		if (document.getElementById("species_synonym") != null) {
			document.getElementById("species_synonym").value = "";
		}

		document.getElementById("species_nationdist").value = "";
		document.getElementById("species_chinadist").value = "";
		document.getElementById("species_summarize").value = "";
		document.getElementById("species_used").value = "";
		document.getElementById("species_literature").value = "";

	}

	function getLevel() {
		var kingdomIndex = document.getElementById("kingdom").selectedIndex;
		var kingdom = document.getElementById("kingdom").options[kingdomIndex].text;

		var phylumIndex = document.getElementById("phylum").selectedIndex;
		var phylum = document.getElementById("phylum").options[phylumIndex].text;

		var clazzIndex = document.getElementById("clazz").selectedIndex;
		var clazz = document.getElementById("clazz").options[clazzIndex].text;

		var orderIndex = document.getElementById("order").selectedIndex;
		var order = document.getElementById("order").options[orderIndex].text;

		var familyIndex = document.getElementById("family").selectedIndex;
		var family = document.getElementById("family").options[familyIndex].text;

		var fucusIndex = document.getElementById("fucus").selectedIndex;
		var fucus = document.getElementById("fucus").options[fucusIndex].text;
		alert(kingdom + "--" + phylum + "--" + clazz + "--" + order + "--"
				+ family + "--" + fucus);
		document.getElementById("species_level").value = kingdom + "--"
				+ phylum + "--" + clazz + "--" + order + "--" + family + "--"
				+ fucus;
	};
</script>
</head>
<style type="text/css">
tr:hover {
	background-color: #A9C3DD
}
</style>
<body>
	<div id="container">

		<div id="box_top">
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
		<div>
			<table cellspacing="0" cellpadding="0" width="100%" align="left"
				border="0">
				<tr>
					<td class="ui_text_rt">所属分类：</td>
					<td height="42" colspan="2">
					<select name="kingdom_3id ="
						id="kingdom" class="ui_select01">
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
					<select name="order_3id =" id="order" class="ui_select01">
							<option selected="selected">请选择所属目</option>
					</select> 
					<select name="family_3id =" id="family" class="ui_select01">
							<option selected="selected">请选择所属科</option>
					</select>
					 <select name="fucus_id_fk =" id="fucus" class="ui_select01">
							<option selected="selected">请选择所属的属</option>
					</select></td>
				</tr>
			</table>
		</div>
		<div class="ui_content" id="submitDiv">
			<table cellspacing="0" cellpadding="0" width="100%" align="left"
				border="0">
				<tr>
					<td class="ui_text_lt"><input type="text" hidden="hidden" id="species_level"
						name="species_level =" class="ui_input_txt04" /></td>
				</tr>
				<c:if test="${userList[0].user_type==3 }">
					<!-- 3植物管理员 动植物区分！！9.16会议 -->
					<tr>
						<td class="ui_text_rt">命名人：</td>
						<td class="ui_text_lt"><input type="text"
							id="species_discover" name="species_discover ="
							class="ui_input_txt04" />
							<label id="species_discoverError"></label>
							</td>
							
					</tr>
				</c:if>
				<tr>
					<td class="ui_text_rt" width="80">中文名：</td>
					<td class="ui_text_lt"><input type="text" id="species_cname"
						name="species_cname =" class="ui_input_txt04" value="" />
						<label id="species_cnameError"></label>
						</td>
				</tr>
				<tr>
					<td class="ui_text_rt">英文名：</td>
					<td class="ui_text_lt"><input type="text" id="species_ename"
						name="species_ename =" class="ui_input_txt04" /><label id="species_enameError"></label>
						</td>
				</tr>
				<tr>
					<td class="ui_text_rt">中文拼音：</td>
					<td class="ui_text_lt"><input type="text"
						id="species_spelling" name="species_spelling ="
						class="ui_input_txt04" />
						<label id="species_spellingError"></label>
						</td>
				</tr>
				<tr>
					<td class="ui_text_rt">俗名信息：</td>
					<td class="ui_text_lt"><input type="text"
						id="species_commoninfo" name="species_commoninfo ="
						class="ui_input_txt04" /></td>
				</tr>
				<tr>
					<td class="ui_text_rt">生境：</td>
					<td class="ui_text_lt"><input type="text" id="species_habitat"
						name="species_habitat =" class="ui_input_txt04" /></td>
				</tr>
				<c:if test="${userList[0].user_type==2 }">
					<!-- 动植物区分！！9.16会议 -->
			  		<tr>
						<td class="ui_text_rt">习性：</td>
						<td class="ui_text_lt"><input type="text" id="species_habit"
							name="species_habit =" class="ui_input_txt04" /></td>
					</tr>
				</c:if>
				<tr>
					<td class="ui_text_rt">种加词：</td>
					<td class="ui_text_lt"><input type="text" id="species_addword"
						name="species_addword =" class="ui_input_txt04" />
						<label id="species_addwordError"></label>
						</td>
				</tr>
				<tr>
					<c:if test="${userList[0].user_type==3 }">
						<!-- 动植物区分！！9.16会议 -->
						<tr>
							<td class="ui_text_rt">异名信息：</td>
							<td class="ui_text_lt"><input type="text"
								id="species_synonym" name="species_synonym ="
								class="ui_input_txt04" /></td>
						</tr>
					</c:if>
				<tr>
					<td class="ui_text_rt">国家分布：</td>
					<td class="ui_text_lt"><input type="text"
						id="species_nationdist" name="species_nationdist ="
						placeholder="输入国家名" class="ui_input_txt04" /></td>
				</tr>
				<tr>
					<td class="ui_text_rt">国内分布：</td>
					<td class="ui_text_lt"><input type="text"
						id="species_chinadist" name="species_chinadist ="
						class="ui_input_txt04" /></td>
				</tr>
				<c:if test="${userList[0].user_type==2 }">
					<!-- 动植物区分！！9.16会议 -->

					<tr>
						<td class="ui_text_rt">区系类型：</td>
						<td class="ui_text_lt"><select id="subreginal"
							name="subreginal_id_fk =" class="ui_select01">
	 			 				<option value="null">请选择...</option>
								<c:forEach items="${listSubr }" var="Linkage">
									<option value="${Linkage.id }">${Linkage.name }</option>
								</c:forEach>

						</select></td>
					</tr>
				</c:if>
				<c:if test="${userList[0].user_type==3 }">
					<!--3代表植物  动植物区分！！9.16会议 -->
					<tr>
						<td class="ui_text_rt">区系类型：</td>
						<td class="ui_text_lt"><select 
							name="reginal_3id_fk =" id="reginal" class="ui_select01">
								<option value="null">请选择...</option>

								<c:forEach items="${list1 }" var="Linkage">
									<option value="${Linkage.id }">${Linkage.name }</option>
								</c:forEach>

						</select> <select  name="subreginal_id_fk ="
							id="subreginal" class="ui_select01" style="width: 250px">
								<option selected="selected">请选择所属的子区系类型</option>
						</select></td>
					</tr>
				</c:if>

				<tr>
					<td class="ui_text_rt">国家保护级别：</td>
					<td class="ui_text_lt"><select id="species_coupro_fk"
						name="species_coupro_fk =" class="ui_select01">
							<c:forEach items="${listCoup }" var="Linkage">
								<option value="${Linkage.id }">${Linkage.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<c:if test="${userList[0].user_type==3 }">
					<!-- 3植物管理员 动植物区分！！9.16会议 -->
					<tr>
						<td class="ui_text_rt">生活型：</td>
						<td class="ui_text_lt"><select id="species_lifetype_fk"
							name="species_lifetype_fk =" class="ui_select01">
								<c:forEach items="${listLife }" var="Linkage">
									<option value="${Linkage.id }">${Linkage.name }</option>
								</c:forEach>
						</select></td>
					</tr>
				</c:if>
				<c:if test="${userList[0].user_type==2 }">
					<!-- 2动物管理员 动植物区分！！9.16会议 -->
					<tr>
						<td class="ui_text_rt">居留型：</td>
						<td class="ui_text_lt"><select id="species_resitype_fk"
							name="species_resitype_fk =" class="ui_select01">
								<c:forEach items="${listResi }" var="Linkage">
									<option value="${Linkage.id }">${Linkage.name }</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td class="ui_text_rt">地理分布型：</td>
						<td class="ui_text_lt"><select id="species_geodist_fk"
							name="species_geodist_fk =" class="ui_select01">
								<option value="null">请选择...</option>
								<c:forEach items="${listGeod }" var="Linkage">
									<option value="${Linkage.id }">${Linkage.name }</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td class="ui_text_rt">饲养状况：</td>
						<td class="ui_text_lt"><select id="species_feedState_fk"
							name="species_feedState_fk =" class="ui_select01">
								<option value="null">请选择...</option>
								<c:forEach items="${listFeed }" var="Linkage">
									<option value="${Linkage.id }">${Linkage.name }</option>
								</c:forEach>
						</select></td>
					</tr>
				</c:if>
				<c:if test="${userList[0].user_type==3 }">
					<!-- 3植物管理员动植物区分！！9.16会议 -->
					<tr>
						<td class="ui_text_rt">引种栽培：</td>
						<td class="ui_text_lt"><select id="species_intculti_fk"
							name="species_intculti_fk =" class="ui_select01">
								<option value="null">请选择...</option>
								<c:forEach items="${listIntc }" var="Linkage">
									<option value="${Linkage.id }">${Linkage.name }</option>
								</c:forEach>
						</select></td>
					</tr>
				</c:if>
				<tr>
					<td class="ui_text_rt">IUCN红色名录等级：</td>
					<td class="ui_text_lt"><select id="species_iucn_fk"
						name="species_iucn_fk =" class="ui_select01">
							<c:forEach items="${listIucn }" var="Linkage">
								<option value="${Linkage.id }">${Linkage.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="ui_text_rt">省保护级别：</td>
					<td class="ui_text_lt"><select id="species_provpro_fk"
						name="species_provpro_fk =" class="ui_select01">
							<c:forEach items="${listProv }" var="Linkage">
								<option value="${Linkage.id }">${Linkage.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="ui_text_rt">CITES保护等级：</td>
					<td class="ui_text_lt"><select id="species_cites_fk"
						name="species_cites_fk =" class="ui_select01">
							<c:forEach items="${listCite }" var="Linkage">
								<option value="${Linkage.id }">${Linkage.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="ui_text_rt">中国红色名录等级：</td>
					<td class="ui_text_lt"><select id="species_credpro_fk"
						name="species_credpro_fk =" class="ui_select01">
							<c:forEach items="${listCred }" var="Linkage">
								<option value="${Linkage.id }">${Linkage.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<c:if test="${userList[0].user_type==2 }">
					<!-- 2代表动物 -->
					<tr>
						<td class="ui_text_rt">三有物种(动)：</td>
						<td class="ui_text_lt"><select id="species_three_fk"
							name="species_three_fk =" class="ui_select01">
								<c:forEach items="${listThre }" var="Linkage">
									<option value="${Linkage.id }">${Linkage.name }</option>
								</c:forEach>
						</select></td>
					</tr>
				</c:if>
				<tr>
					<td class="ui_text_rt">中国特有：</td>
					<td class="ui_text_lt"><select name="species_onlychina_fk ="
						class="ui_select01">
							<c:forEach items="${listOnly }" var="Linkage">
								<option value="${Linkage.id }">${Linkage.name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="ui_text_rt">概述：</td>
					<td class="ui_text_lt"><textarea id="species_summarize"
							name="species_summarize =" class="ui_tb_h30"
							style="width: 483px; height: 153px;"></textarea></td>
				</tr>
				<tr>
					<td class="ui_text_rt">用途：</td>
					<td class="ui_text_lt"><textarea id="species_used"
							name="species_used =" class="ui_tb_h30"
							style="width: 483px; height: 153px;"></textarea></td>
				</tr>
				<tr>
					<td class="ui_text_rt">参考文献：</td>
					<td class="ui_text_lt"><textarea id="species_literature"
							name="species_literature =" class="ui_tb_h30"
							style="width: 483px; height: 153px;"></textarea></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td class="ui_text_lt">&nbsp; <input type="button"
						onclick="submit()" value="提交" class="ui_input_btn01" /> &nbsp; <input
						type="reset" value="取消" class="ui_input_btn01" />
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div style="display:none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>
