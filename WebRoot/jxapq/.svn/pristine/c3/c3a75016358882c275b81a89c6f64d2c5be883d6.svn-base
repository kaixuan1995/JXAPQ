<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/jxapq/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/jxapq/style/authority/common_style.css" rel="stylesheet" type="text/css">
<style type="text/css">
	
</style>
<title>无标题文档</title>
</head>

<body>

<p>&nbsp;</p>
<p>&nbsp;</p>


	<form id="submitForm" name="submitForm" action="" method="post">
		<input type="hidden" name="allIDCheck" value="" id="allIDCheck"/>
		<input type="hidden" name="fangyuanEntity.fyXqName" value="" id="fyXqName"/>
		<div id="container">
			<div class="ui_content">
			  <div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">搜索结果：</div>
						<!--工作人员有下面几个按钮-->
						
					<!--	<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onClick="search();" /> 
							<input type="button" value="新增" class="ui_input_btn01" id="addBtn" /> 
							<input type="button" value="删除" class="ui_input_btn01" onClick="batchDel();" /> 
							<input type="button" value="导入" class="ui_input_btn01" id="importBtn" />
							
						</div>
					-->
						<!--工作人员有上面几个按钮-->
						<input type="button" value="导出" class="ui_input_btn01" onClick="exportExcel();" />
					</div>
				</div>
			</div>
			<div class="ui_content">
				<div class="ui_tb">
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th width="30"><input type="checkbox" id="all" onClick="selectOrClearAllCheckbox(this);" />
							</th>
							<th>中文名</th>
							<th>学名</th>
							<th>英文名</th>
							<th>中文拼音</th>
							<th>概述</th>
							<th>操作</th>
						</tr>
							<tr>
								<td><input type="checkbox" name="IDCheck" value="14458579642011" class="acb" /></td>
								<td>角苔纲</td>
								<td>Anthocerotae</td>
								<td>&nbsp;</td>
								<td>jiǎo tái gāng</td>
								<td>叶状体多呈圆形</td>
								<td>
									<a href="house_edit.html?fyID=14458579642011" class="edit">编辑</a> 
									<a href="javascript:del('14458579642011');">删除</a>
								</td>
							</tr>
						
							<tr>
								<td><input type="checkbox" name="IDCheck" value="14458625716623" class="acb" /></td>
								<td>藓纲</td>
								<td>Bryopsida</td>
								<td>&nbsp;</td>
								<td>xiǎn gāng</td>
								<td>有茎与叶的分化</td>
								<td>
									<a href="house_edit.html?fyID=14458625716623" class="edit">编辑</a> 
									<a href="javascript:del('14458625716623');">删除</a>
								</td>
							</tr>
						
							<tr>
								<td><input type="checkbox" name="IDCheck" value="14458592537463" class="acb" /></td>
								<td>苔纲</td>
								<td>Hepaticae</td>
								<td>&nbsp;</td>
								<td>tái gāng</td>
								<td>原丝体不发育</td>
								<td>
									<a href="house_edit.html?fyID=14458592537463" class="edit">编辑</a> 
									<a href="javascript:del('14458592537463');">删除</a>
								</td>
							</tr>
						
							<tr>
								<td height="26"><input type="checkbox" name="IDCheck" value="14458632171244" class="acb" /></td>
								<td>藻苔纲</td>
								<td>Takakiopsida</td>
								<td>&nbsp;</td>
								<td>zǎo tái gāng</td>
								<td>具有苔藓植物的最原始性状</td>
								<td>
									<a href="house_edit.html?fyID=14458632171244" class="edit">编辑</a> 
									<a href="javascript:del('14458632171244');">删除</a>
								</td>
							</tr>
						
							
						
					</table>
				</div>
				<div class="ui_tb_h30">
					<div class="ui_flt" style="height: 30px; line-height: 30px;">
						共有
						<span class="ui_txt_bold04">90</span>
						条记录，当前第
						<span class="ui_txt_bold04">1
						/
						9</span>
						页
					</div>
					<div class="ui_frt">
						<!--    如果是第一页，则只显示下一页、尾页 -->
						
							<input type="button" value="首页" class="ui_input_btn01" />
							<input type="button" value="上一页" class="ui_input_btn01" />
							<input type="button" value="下一页" class="ui_input_btn01"
								onclick="jumpNormalPage(2);" />
							<input type="button" value="尾页" class="ui_input_btn01"
								onclick="jumpNormalPage(9);" />
						
						
						
						<!--     如果是最后一页，则只显示首页、上一页 -->
						
						转到第<input type="text" id="jumpNumTxt" class="ui_input_txt01" />页
							 <input type="button" class="ui_input_btn01" value="跳转" onClick="jumpInputPage(9);" />
					</div>
				</div>
			</div>
		</div>
	</form>
  <br/>
  <br />

<div align="center">

	<a href="">首页</a>
	<a href="">1</a>
    <a href="">2</a>
    <a href="">3</a>
    <a href="">4</a>
    <a href="">5</a>
    <a href="">6</a>
    <a href="">7</a>
    <a href="">8</a>
    <a href="">9</a>
    <a href="">最后一页</a>
    
</div>
<p></p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="" class = "e"><div id="box_top">导出excel表</div></a>

</body>
</html>
