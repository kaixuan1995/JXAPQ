<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="../../style/authority/common_style.css" rel="stylesheet" type="text/css">
<title>江西省动植物信息检索系统</title>
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
<div id="box_top">统计</div>
</p>
<div class="main">
  <div class="content">
    <div align="center" style="margin:50px 0px;">
      <div class="panel" style="width:90%;">
        <div class="panel_head">
          <div id="t_item_1" class="panel_item_show" style="width:120px;" onclick="showLayer('t', 1);">按分类等级</div>
          <div class="panel_item_spacing" style="width:18px;"></div>
          <div id="t_item_2" class="panel_item" style="width:120px;" onclick="showLayer('t', 2);">按地理分布</div>
          <div class="panel_item_spacing" style="width:18px;"></div>
          <div id="t_item_3" class="panel_item" style="width:120px;" onclick="showLayer('t', 3);">按保护等级</div>
        </div>
        <div class="panel_body"> 
          <!--分类等级面板-->
          <div id="t_layer_1">
            <table width="100%" cellpadding="0" cellspacing="0" >
              <form action="tongji-result.jsp" target="right">
                <tr>
                  <td height="42" colspan="2"><select name="kingdom_id =" class="ui_select01">
                      <option>界</option>
                      <option>动物界</option>
                      <option>植物界</option>
                    </select>
                    <select name="phylum_id =" class="ui_select01">
                      <option>门</option>
                      <option>脊索动物门</option>
                      <option>苔藓门</option>
                    </select>
                    <select name="class_id =" class="ui_select01">
                      <option>纲</option>
                    </select>
                    <select name="order_id =" class="ui_select01">
                      <option>目</option>
                    </select>
                    <select name="family_id =" class="ui_select01">
                      <option>科</option>
                    </select>
                    <select name="fucus_id =" class="ui_select01">
                      <option>属</option>
                    </select></td>
                </tr>
				 <tr>
					<td height="37" colspan="2"><input type="submit" value="统计"   class="ui_input_btn01"/></td>
				</tr>
              </form>
            </table>
          </div>
          
          <!--地理分布面板-->
          <div id="t_layer_2" style="display:none;">
            <table width="100%" cellpadding="0" cellspacing="0" >
                <form action="tongji-result.jsp" target="right">
              
              <tr>
                <td height="36">按地理分布检索统计：</td>
                <td> 江西省
                  <select name="species_geodist_fk =" class="ui_select01">
                    <option>全部</option>
                    <option>南昌市</option>
                    <option>九江市</option>
                    <option>上饶市</option>
                    <option>新余市</option>
                  </select>
                  <select name="species_geodist_fk =" class="ui_select01">
                    <option>全部</option>
                    <option>余干县</option>
                    <option>彭泽县</option>
                    <option>湖口县</option>
                    <option>广昌县</option>
                    <option>青山湖区</option>
                  </select></td>
              </tr>
			  
			  <tr>
                <td height="36">保护区：</td>
                <td>
                  <select name="species_geodist_fk =" class="ui_select01">
                    <option>全部</option>
                    <option>鄱阳湖保护区</option>
                  </select>
                 </td>
              </tr>
              <tr>
                <td height="37" colspan="2"><input type="submit" value="统计"   class="ui_input_btn01"/></td>
              </tr>
                <form>
            </table>
          </div>
          
          <!--保护等级面板-->
          <div id="t_layer_3" style="display:none;">
            <table width="100%" cellpadding="0" cellspacing="0" >
                <form action="tongji-result.jsp" target="right">
              
              <tr>
                <td height="38">国家保护级别：</td>
                <td><input type="radio" name="species_coupro_fk =" value="全部">
                  全部
                  <input type="radio" name="species_coupro_fk =" value="国家I级保护">
                  国家I级保护
                  <input type="radio" name="species_coupro_fk =" value="国家II级保护">
                  国家II级保护 </td>
              </tr>
              <tr>
                <td height="40">省保护级别：</td>
                <td><input type="radio" name="species_provpro_fk =" value="全部">
                  全部
                  <input type="radio" name="species_provpro_fk =" value="省I级保护(植)">
                  省I级保护(植)
                  <input type="radio" name="species_provpro_fk =" value="省II级保护(植)">
                  省II级保护(植)
                  <input type="radio" name="species_provpro_fk =" value="省III级保护(植)">
                  省III级保护(植)
                  <input type="radio" name="species_provpro_fk =" value="是(动)">
                  是(动)
                  <input type="radio" name="species_provpro_fk =" value="否(动)">
                  否(动) </td>
              </tr>
              <tr>
                <td height="41">中国红色名录等级：</td>
                <td><select name="species_credpro_fk =" class="ui_select01">
                    <option>全部</option>
                    <option >绝灭（EX）</option>
                    <option>野外绝灭（EW）</option>
                    <option>极危（CR）</option>
                    <option>濒危（EN）</option>
                    <option>易危（VU）</option>
                    <option>近危（NT）</option>
                    <option>无危（LC）</option>
                    <option>数据缺乏（DD）</option>
                    <option>未予评估（NE）</option>
                  </select></td>
              </tr>
              <tr>
                <td height="39">IUCN红色名录等级：</td>
                <td><select name="species_iucn_fk =" class="ui_select01">
                    <option>全部</option>
                    <option>绝灭（EX）</option>
                    <option>野外绝灭（EW）</option>
                    <option>极危（CR）</option>
                    <option>濒危（EN）</option>
                    <option>易危（VU）</option>
                    <option>近危（NT）</option>
                    <option>无危（LC）</option>
                    <option>数据缺乏（DD）</option>
                    <option>未予评估（NE）</option>
                  </select></td>
              </tr>
              <tr>
                <td height="39">CITES保护等级：</td>
                <td><select name="species_cites_fk =" class="ui_select01">
                    <option>全部</option>
                    <option>附录Ⅰ物种</option>
                    <option>附录Ⅱ物种</option>
                    <option>附录Ⅲ物种</option>
                  </select></td>
              </tr>
              <tr>
                <td height="38">中国特有：</td>
                <td><input type="radio" name="species_onlychina_fk =" value="全部">
                  全部
                  <input type="radio" name="species_onlychina_fk =" value="是">
                  是
                  <input type="radio" name="species_onlychina_fk =" value="否">
                  否 </td>
              </tr>
              <tr>
                <td height="41">三有保护：</td>
                <td><input type="radio" name="species_three_fk =" value="全部">
                  全部
                  <input type="radio" name="species_three_fk =" value="是">
                  是
                  <input type="radio" name="species_three_fk =" value="否">
                  否 </td>
              </tr>
              <tr>
                <td height="37" colspan="2"><input type="submit" value="统计"   class="ui_input_btn01"/></td>
              </tr>
                <form>
              
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>

