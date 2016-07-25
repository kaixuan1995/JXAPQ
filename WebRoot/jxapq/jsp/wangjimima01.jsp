<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="en"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>江西省动植物信息检索系统-忘记密码</title>


<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<![endif]-->

<link href="${pageContext.request.contextPath}/jxapq/style/normalize.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/jxapq/style/jquery-ui.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/jxapq/style/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>

<style type="text/css">
body{font:normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;color: #222;background:url(pattern.png);overflow-y:scroll;padding:60px 0 0 0;}
#my-form{width:755px;margin:0 auto;border:1px solid #ccc;padding:3em;border-radius:3px;box-shadow:0 0 2px rgba(0,0,0,.2);}
#comments{width:350px;height:100px;}
</style>

</head>
<body>
<div class="row">

  <div class="eightcol last">

    <!-- Begin Form -->

    <form id="my-form"  method="post"
    	action="${pageContext.request.contextPath}/UserServlet?method=forgetpass1&view=forgetpass1View" >
        <section name="第一步">      
         <div><label>用户名:</label><input id="name" name="user_id =" type="text"/>
         </div><label id="nameError"></label>
		   <div><label>验证码:</label><input id="yzm" name="vcode" type="text"/>
		   <a href="javascript:change() ">
		<img id="vCode" src="${pageContext.request.contextPath}/UserServlet?view=validateCodeView&method=validateCode" /> </a>
	</div>      <span id="login_err" class="sty_txt2"><font color="red">${message}</font></span>
        </section>
		
      <div><hr/></div>
      <div>
        <button type="submit">确认</button>
        <button id="reset1" type="button">重置</button>
      </div>
    </form>
  </div>
</div>	

<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery.idealforms.js"></script>
<script type="text/javascript">
function change() {
		/*
		1. 获取<img>元素
		 */
		var ele = document.getElementById("vCode");
		ele.src = "${pageContext.request.contextPath}/UserServlet?view=validateCodeView&method=validateCode&a=" + new Date().getTime();

	}

var options = {

	onFail: function(){
		alert( ' 存在'+ $myform.getInvalid().length +' 个无效字段.' )
	},

	inputs: {
		'password': {
			filters: 'required pass',
		},
		'username': {
			filters: 'required username',
			data: {
			//ajax: { url:'validate.php' }
			}
		},
		'file': {
			filters: 'extension',
			data: { extension: ['jpg'] }
		},
		'comments': {
			filters: 'min max',
			data: { min: 50, max: 200 }
		},
		'states': {
			filters: 'exclude',
			data: { exclude: ['default'] },
			errors : {
				exclude: '选择国籍.'
			}
		},
		'langs[]': {
			filters: 'min max',
			data: { min: 2, max: 3 },
			errors: {
				min: 'Check at least <strong>2</strong> options.',
				max: 'No more than <strong>3</strong> options allowed.'
			}
		}
	}
	
};

var $myform = $('#my-form').idealforms(options).data('idealforms');

$('#reset').click(function(){
	$myform.reset().fresh().focusFirst()
});

$myform.focusFirst();
</script>
<div style="text-align:center;">
</div>
</body>
</html>