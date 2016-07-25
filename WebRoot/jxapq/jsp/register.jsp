<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>江西省动植物信息检索系统-用户注册</title>

<link
	href="${pageContext.request.contextPath}/jxapq/style/normalize.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/jxapq/style/jquery-ui.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/jxapq/style/jquery.idealforms.min.css"
	rel="stylesheet" media="screen" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery-1.8.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jxapq/scripts/jquery.idealforms.js"></script>

<style type="text/css">
body {
	font: normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;
	color: #222;
	background: url(pattern.png);
	overflow-y: scroll;
	padding: 60px 0 0 0;
}

#my-form {
	width: 755px;
	margin: 0 auto;
	border: 1px solid #ccc;
	padding: 3em;
	border-radius: 3px;
	box-shadow: 0 0 2px rgba(0, 0, 0, .2);
}

#comments {
	width: 350px;
	height: 100px;
}
</style>
</head>
<script type="text/javascript">
		$(function(){
			$("#name").change(function(){
				var username = $.trim($(this).val());
				if(username != ""){
					var url="/JXAPQ/UserServlet?view=checkView&method=check";
					var args={"user_id =":username,"time":new Date()};
					$.post(url,args,
					function(data){
						if(data==1){
							$("#nameError").html("<font color='red'>此用户名已经存在！</font>");
						}else{
							$("#nameError").html("<font color='green'>用户名可以使用！</font>");
						}
				});
			}
		});
		
		
		$("#email").change(function(){
				var email = $.trim($(this).val());
				if(email != ""){
					var url="/JXAPQ/UserServlet?view=checkView&method=check";
					var args={"user_email =":email,"time":new Date()};
					$.post(url,args,
					function(data){
						if(data==1){
							$("#emailError").html("<font color='red'>此邮箱已经使用</font>");
						}else{
							$("#emailError").html("<font color='green'>邮箱可以使用！</font>");
						}
				});
			}
		});
	});
	</script>
<body>


	<div class="row">

		<div class="eightcol last">
			<form id="my-form"
				action="${pageContext.request.contextPath}/UserServlet?method=register&view=registerView"
				 onsubmit="return getConf()" method="post">
				<div>
					<span id="login_err" class="sty_txt2"><font color="red">${message}</font></span>
				</div>
				<section name="第一步">
				
				<div>
					<label>用户名:</label><input id="name" name="user_id ="
						type="text" />
					<label id="nameError"></label>
				</div>
				<div>
					<label>密码:</label><input id="pwd" name="user_password ="
						type="password" />
						<label id="pwdError"></label>
				</div>
				<div>
					<label>确认密码:</label><input id="pwd" name="user_password ="
						type="password" />
						<label id="pwdError"></label>
				</div>
				<div>
					<label>真实姓名:</label><input id="realname" name="user_name ="
						type="text" />
				</div>
				<div>
					<label>性别:</label> <label><input type="radio"
						name="user_sex =" value="男" checked />男</label> <label><input
						type="radio" name="user_sex =" value="女" />女</label>
				</div>
				<div>
					<label>邮箱:</label><input id="email" name="user_email ="
						data-ideal="required email" type="text" />
						<label id="emailError"></label>
				</div>
				<div>
					<label>出生日期:</label><input id="birthday" name="user_birthday ="
						class="datepicker" data-ideal="date" type="text"
						placeholder="年-月-日" />
						<label id="birthdayError"></label>
				</div>
				<div>
					<label>身份:</label> <select id="states" name="user_called =">
						<option value="default">&ndash; 选择身份 &ndash;</option>
						<option value="高校教师">高校教师</option>
						<option value="在校本科生">在校本科生</option>
						<option value="硕士研究生">硕士研究生</option>
						<option value="博士或博士后">博士或博士后</option>
						<option value="企业研发人员">企业研发人员</option>
						<option value="其他">其他</option>
					</select>
				</div>
				<div>
					<label>电话:</label><input type="text" name="user_tel ="
						data-ideal="phone" id="tel" />
						<label id="telError"></label>
				</div>
				<div>
					<label>注册理由:</label>
					<textarea id="comments" name="user_reason ="></textarea>
					<label id="commentsError"></label>
				</div>
				</section>
				<div>
					<hr />
				</div>

				<div>
					<button type="submit">提交</button>
					<button id="reset" type="button">重置</button>
				</div>

			</form>
		</div>

	</div>



	<script type="text/javascript">
		var options = {

			onFail : function() {
				alert($myform.getInvalid().length + ' invalid fields.')
			},

			inputs : {
				'password' : {
					filters : 'required pass',
				},
				'username' : {
					filters : 'required username',
					data : {
					//ajax: { url:'validate.php' }
					}
				},
				'file' : {
					filters : 'extension',
					data : {
						extension : [ 'jpg' ]
					}
				},
				'comments' : {
					filters : 'min max',
					data : {
						min : 50,
						max : 200
					}
				},
				'states' : {
					filters : 'exclude',
					data : {
						exclude : [ 'default' ]
					},
					errors : {
						exclude : '选择身份.'
					}
				},
				'langs[]' : {
					filters : 'min max',
					data : {
						min : 2,
						max : 3
					},
					errors : {
						min : 'Check at least <strong>2</strong> options.',
						max : 'No more than <strong>3</strong> options allowed.'
					}
				}
			}

		};

		var $myform = $('#my-form').idealforms(options).data('idealforms');

		$('#reset').click(function() {
			$myform.reset().fresh().focusFirst()
		});

		$myform.focusFirst();
	</script>
	<div style="text-align:center;"></div>
</body>
</html>