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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>江西省动植物信息检索系统-忘记密码</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jxapq/scripts/jquery.idealforms.js"></script>
<link href="${pageContext.request.contextPath}/jxapq/style/normalize.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/jxapq/style/jquery-ui.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/jxapq/style/jquery.idealforms.min.css" rel="stylesheet"media="screen" />

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
<script type="text/javascript">
$(document).ready(function() {
	$("#yzmbutton").click(
		function() {
			var user_email = $("#email").val();
			var user_id = $("#user_id").val();
			alert(user_email+user_id);
			//计时器开始
			sendMessage();
			var url = "${pageContext.request.contextPath}/UserServlet?method=alterCode&view=alterCodeView";
			var args = {
				"user_email =" : user_email,
				"user_id =" : user_id,
				"time" : new Date()
			};
			$.post(url, args, function(data) {
				if (data == 1) {
					alert("发送成功");
				} else {
					alert("发送失败");
				}
			});
	});

	function sendMessage() {
		curCount=60;
		// 设置button效果，开始计时
		$("#yzmbutton").attr("disabled", "true");
		$("#yzmbutton").val(curCount + "秒后可重发");
		InterValObj = window.setInterval(SetRemainTimeh, 1000); // 启动计时器，1秒执行一次
	}

	function SetRemainTimeh() {
		if (curCount == 0) {                
			window.clearInterval(InterValObj);// 停止计时器
			$("#yzmbutton").removeAttr("disabled");// 启用按钮
			$("#yzmbutton").val("重新发送");
		}
		else {
			curCount--;
			$("#yzmbutton").val(curCount + "秒后可重发");
		}
	}
});
</script>
</head>
<body>
	<div class="row">
		<div class="eightcol last">
			<form id="my-form" display="none" method="post"
			action="${pageContext.request.contextPath}/UserServlet?method=forgetpass2&view=forgetpass2View">
				<input type="hidden" id="email" name="user_email =" value="${user_email}"/>
				<input type="hidden" id="user_id" name="user_id =" value="${user_id}"/>
				<section name="第二步">
				<div id="languages">
					<div>
						<label>邮箱验证码:</label><input id="emailCode" name="user_code ="
							type="password" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type='button' id="yzmbutton" name="yzmbutton">获取验证码</button>
						<label id="emailCodeError"><font color="red">${message}</font></span></label>
					</div>
				</div>
				</section>
				<div>
					<hr />
				</div>
				<div>
					<button type="submit">确认</button>
					<button id="reset2" type="reset">重置</button>
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
						exclude : '选择国籍.'
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