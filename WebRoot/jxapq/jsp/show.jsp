<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="blue" uri="/blue" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询显示页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <style type="text/css">
        .In-table
        {width: 900px; height: 30px; border: 0px; }
        #div-button
        { margin-bottom: 5px; }
        #div-button input
        { color: #fff; border: 1px solid #9cf; box-shadow: 2px 2px 3px #ccc; border-radius: 5px;background: #9cf; }
    </style>
  </head>
  
  <body>

   <blue:list2array list="${list }" />
  
  
      <table id="input-table" class="In-table" border="1">     
      </table>
      <div id="div-button">
	      <input type="button" value="首页" id="F-page" onclick='shouye(${jsonObject})'>
	      <input type="button" value="下一页" id="Nex-page" onclick='xiayiye(${jsonObject})'>
	      <input type="button" value="上一页" id="Pre-page" onclick='shangyiye(${jsonObject})'>
	      <input type="button" value="尾页" id="L-page" onclick='weiye(${jsonObject})'>
	        总共<span id="s1"></span>页&nbsp;当前第<span id="s2"></span>页&nbsp;    每页显示<input type="text" id="PageNo" size="3" value="10"/>行<br/>
      </div>
      
     <%-- <c:forEach var="SimpleInfo" items="${list }">
<a href="${pageContext.request.contextPath }/QueryServlet?view=${SimpleInfo.view }&method=query&${SimpleInfo.view }_id%20%3d=${SimpleInfo.id}">
${SimpleInfo.id}   ${SimpleInfo.cname }  ${SimpleInfo.sname } ${SimpleInfo.view }</a><br /> 
  	</c:forEach>--%>
  </body>
</html>



<script type="text/javascript">
          var dataArray=[];
              var PageNo=document.getElementById('PageNo');                   //设置每页显示行数
              var InTb=document.getElementById('input-table');               //表格
              var Fp=document.getElementById('F-page');                      //首页
              var Nep=document.getElementById('Nex-page');                  //下一页
              var Prp=document.getElementById('Pre-page');                  //上一页
              var Lp=document.getElementById('L-page');                     //尾页
              var S1=document.getElementById('s1');                         //总页数
              var S2=document.getElementById('s2');                         //当前页数
              var currentPage;                                              //定义变量表示当前页数
              var SumPage;                                                  //定义变量表示总页数
              function shouye(jsonArray)
              {
                  if(PageNo.value!="")                                       //判断每页显示是否为空
                  {
                      InTb.innerHTML='';                                     //每次进来都清空表格
                      S2.innerHTML='';                                        //每次进来清空当前页数
                      currentPage=1;                                          //首页为1
                      S2.appendChild(document.createTextNode(currentPage));
                      S1.innerHTML='';                                        //每次进来清空总页数
                      if(jsonArray.length%PageNo.value==0)                    //判断总的页数
                      {
                          SumPage=parseInt(jsonArray.length/PageNo.value);
                      }
                      else
                      {
                          SumPage=parseInt(jsonArray.length/PageNo.value)+1
                      }
                      S1.appendChild(document.createTextNode(SumPage));
                      var oTBody=document.createElement('tbody');               //创建tbody
                      oTBody.setAttribute('class','In-table');                   //定义class
                      oTBody.insertRow(0);
                      oTBody.rows[0].insertCell(0);
                      oTBody.rows[0].cells[0].appendChild(document.createTextNode('信息列表'));
                      //oTBody.rows[0].insertCell(1);
                      //oTBody.rows[0].cells[1].appendChild(document.createTextNode('性别'));
                      //oTBody.rows[0].insertCell(2);
                      //oTBody.rows[0].cells[2].appendChild(document.createTextNode('年龄'));
                      InTb.appendChild(oTBody);                                     //将创建的tbody添加入table
                      for(i=0;i<parseInt(PageNo.value);i++)
                      {                                                          //循环打印数组值
                          oTBody.insertRow(i+1);
                         // for(j=0;j<jsonArray[i].length;j++)
                         // {
                         	  var aElement = document.createElement("a");
                         	  aElement.setAttribute("href","${pageContext.request.contextPath }/QueryServlet?view="+jsonArray[i].view+"&method=query&"+jsonArray[i].view+"_id%20%3d="+jsonArray[i].id+"");
                         	  aElement.appendChild(document.createTextNode(jsonArray[i].cname + " : " + jsonArray[i].sname));
                              oTBody.rows[i+1].insertCell(0);
                              oTBody.rows[i+1].cells[0].appendChild(aElement);
                         // }
                      }
                  }
              }
              function xiayiye(jsonArray)
              {
            
                  if(currentPage<SumPage)                                 //判断当前页数小于总页数
                  {
                      InTb.innerHTML='';
                      S1.innerHTML='';
                      if(jsonArray.length%PageNo.value==0)
                      {
                          SumPage=parseInt(jsonArray.length/PageNo.value);
                      }
                      else
                      {
                          SumPage=parseInt(jsonArray.length/PageNo.value)+1
                      }
                      S1.appendChild(document.createTextNode(SumPage));
                      S2.innerHTML='';
                      currentPage=currentPage+1;
                      S2.appendChild(document.createTextNode(currentPage));
                      var oTBody=document.createElement('tbody');
                      oTBody.setAttribute('class','In-table');
                      oTBody.insertRow(0);
                      oTBody.rows[0].insertCell(0);
                      oTBody.rows[0].cells[0].appendChild(document.createTextNode('信息列表'));
                      //oTBody.rows[0].insertCell(1);
                      //oTBody.rows[0].cells[1].appendChild(document.createTextNode('性别'));
                      //oTBody.rows[0].insertCell(2);
                      //oTBody.rows[0].cells[2].appendChild(document.createTextNode('年龄'));
                      InTb.appendChild(oTBody);
                      var a;                                                 //定义变量a
                      a=PageNo.value*(currentPage-1);                       //a等于每页显示的行数乘以上一页数
                      var c;                                                  //定义变量c
                      if(jsonArray.length-a>=PageNo.value)                  //判断下一页数组数据是否小于每页显示行数
                      {
                          c=PageNo.value;
                      }
                      else
                      {
                          c=jsonArray.length-a;
                      }
                      for(i=0;i<c;i++)
                      {
                          oTBody.insertRow(i+1);
                          //for(j=0;j<dataArray[i].length;j++)
                          //{
 							  var aElement = document.createElement("a");
                         	  aElement.setAttribute("href","${pageContext.request.contextPath }/QueryServlet?view="+jsonArray[i+a].view+"&method=query&"+jsonArray[i+a].view+"_id%20%3d="+jsonArray[i+a].id+"");
                         	  aElement.appendChild(document.createTextNode(jsonArray[i+a].cname + " : " + jsonArray[i+a].sname));
                              oTBody.rows[i+1].insertCell(0);
                              oTBody.rows[i+1].cells[0].appendChild(aElement);
                          //}                                                            //数组从第i+a开始取值
                      }
                  }
              }

              function shangyiye(jsonArray)
              {
                  if(currentPage>1)                        //判断当前是否在第一页
                  {
                      InTb.innerHTML='';
                      S1.innerHTML='';
                      if(jsonArray.length%PageNo.value==0)
                      {
                          SumPage=parseInt(jsonArray.length/PageNo.value);
                      }
                      else
                      {
                          SumPage=parseInt(jsonArray.length/PageNo.value)+1
                      }
                      S1.appendChild(document.createTextNode(SumPage));
                      S2.innerHTML='';
                      currentPage=currentPage-1;
                      S2.appendChild(document.createTextNode(currentPage));
                      var oTBody=document.createElement('tbody');
                      oTBody.setAttribute('class','In-table');
                      oTBody.insertRow(0);
                      oTBody.rows[0].insertCell(0);
                      oTBody.rows[0].cells[0].appendChild(document.createTextNode('信息列表'));
                      //oTBody.rows[0].insertCell(1);
                      //oTBody.rows[0].cells[1].appendChild(document.createTextNode('性别'));
                      //oTBody.rows[0].insertCell(2);
                      //oTBody.rows[0].cells[2].appendChild(document.createTextNode('年龄'));
                      InTb.appendChild(oTBody);
                      var a;
                      a=PageNo.value*(currentPage-1);
                      for(i=0;i<parseInt(PageNo.value);i++)
                      {
                          oTBody.insertRow(i+1);
                          //for(j=0;j<jsonArray[i].length;j++)
                         // {

                              var aElement = document.createElement("a");
                         	  aElement.setAttribute("href","${pageContext.request.contextPath }/QueryServlet?view="+jsonArray[i+a].view+"&method=query&"+jsonArray[i+a].view+"_id%20%3d="+jsonArray[i+a].id+"");
                         	  aElement.appendChild(document.createTextNode(jsonArray[i+a].cname + " : " + jsonArray[i+a].sname));
                              oTBody.rows[i+1].insertCell(0);
                              oTBody.rows[i+1].cells[0].appendChild(aElement);
                          //}
                      }
                  }
              }

               function weiye(jsonArray)
              {
                      InTb.innerHTML='';
                      S1.innerHTML='';
                      if(jsonArray.length%PageNo.value==0)
                      {
                          SumPage=parseInt(jsonArray.length/PageNo.value);
                      }
                      else
                      {
                          SumPage=parseInt(jsonArray.length/PageNo.value)+1
                      }
                      S1.appendChild(document.createTextNode(SumPage));
                      S2.innerHTML='';
                      currentPage=SumPage;
                      S2.appendChild(document.createTextNode(currentPage));
                      var oTBody=document.createElement('tbody');
                      oTBody.setAttribute('class','In-table');
                      oTBody.insertRow(0);
                      oTBody.rows[0].insertCell(0);
                      oTBody.rows[0].cells[0].appendChild(document.createTextNode('信息列表'));
                      //oTBody.rows[0].insertCell(1);
                      //oTBody.rows[0].cells[1].appendChild(document.createTextNode('性别'));
                      //oTBody.rows[0].insertCell(2);
                      //oTBody.rows[0].cells[2].appendChild(document.createTextNode('年龄'));
                      InTb.appendChild(oTBody);
                      var a;
                      a=PageNo.value*(currentPage-1);
                      var c;
                      if(jsonArray.length-a>=PageNo.value)
                      {
                          c=PageNo.value;
                      }
                      else
                      {
                          c=jsonArray.length-a;
                      }
                      for(i=0;i<c;i++)
                      {
                          oTBody.insertRow(i+1);
                          //for(j=0;j<dataArray[i].length;j++)
                          //{
							  var aElement = document.createElement("a");
                         	  aElement.setAttribute("href","${pageContext.request.contextPath }/QueryServlet?view="+jsonArray[i+a].view+"&method=query&"+jsonArray[i+a].view+"_id%20%3d="+jsonArray[i+a].id+"");
                         	  aElement.appendChild(document.createTextNode(jsonArray[i+a].cname + " : " + jsonArray[i+a].sname));
                              oTBody.rows[i+1].insertCell(0);
                              oTBody.rows[i+1].cells[0].appendChild(aElement);
                          //}
                      }
              }
              
              window.onload = function(){
              	shouye(${jsonObject})
              }
              
     
      </script>