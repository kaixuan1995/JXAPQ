<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>江西省动植物信息检索系统-忘记密码</title>


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
		<form id="my-form" display="none" method="post"  onsubmit="return getConf()"
			action="${pageContext.request.contextPath}/UserServlet?method=forgetpass3&view=forgetpass3View">
			<section name="第三步">
				<input type="hidden" id="email" name="#w#user_email =" value="${user_email}"/>
				<input type="hidden" id="user_id" name="#w#user_id =" value="${user_id}"/>
				<input type="hidden" id="user_code" name="#w#user_code =" value="${user_code}"/>
			  <div><label>密码:</label><input id="pwd" name="#s#user_password =" type="password"/></div><label id="pwdError"></label>
			<div><label>确认密码:</label><input id="pwd" name="#s#user_password =" type="password"/></div><label id="pwdError"></label>
		  </section><label><font color="red">${message}</font></span></label>
		  <div><hr/></div>
		  <div>
			<button type="submit">确认</button>
			<button id="reset3" type="reset">重置</button>
		  </div>
		</form>
		<!-- End Form -->
	</div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery.idealforms.js"></script>

<script type="text/javascript">
var options = {

	onFail: function(){
		alert( $myform.getInvalid().length +' invalid fields.' )
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