

checkJson = [
	{"name":"name", "length":"^.{4,14}$","lengthError":"长度不合","regular":"^([\u4e00-\u9fa5]+|[a-zA-Z0-9]{4,14}+)$","regError":"格式出错"},
	{"name":"username", "length":"^.{4,14}$","lengthError":"长度不合","regular":"^([\u4e00-\u9fa5]+|[a-zA-Z0-9]{4,14}+)$","regError":"格式出错"},
	{"name":"pwd", "length":"^.{6,20}$","lengthError":"长度不合","regular":"[[0-9a-zA-Z][_]]{6,20}","regError":"格式出错"},
	{"name":"realname", "length":"^.{2,6}$","lengthError":"长度不合","regular":"^([[\u4e00-\u9fa5]+|[a-zA-Z]]{2,6}+)$","regError":"格式出错"},
	{"name":"email", "length":"","lengthError":"长度不合","regular":"^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$","regError":"格式出错"},
	{"name":"birthday", "length":"","lengthError":"长度不合","regular":"[0-9]{4}-[0-9]{1,2}-[0-9]{2}","regError":"格式出错"},
	{"name":"tel", "length":"^.{11,11}$","lengthError":"长度不合","regular":"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$","regError":"格式出错"},
	{"name":"comments", "length":"^.{5,50}$","lengthError":"长度不合","regular":"","regError":"格式出错"},
	{"name":"emailCode", "length":"^.{6,6}$","lengthError":"长度不合","regular":"","regError":"格式出错"},
	{"name":"protection_name", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"sample_time", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"sample_discover", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"sample_identifier", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"sample_identime", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"sname", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"cname", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"ename", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"spelling", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"summarize", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"reginal_name", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"dictionary_name", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"category", "length":"","lengthError":"","regular":"","regError":""},
	
	
	{"name":"family_sname", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"family_cname", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"family_ename", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"family_spelling", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"family_summarize", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"subreginal", "length":"","lengthError":"","regular":"","regError":""},
	
	{"name":"order_sname", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"order_cname", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"order_ename", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"order_spelling", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"order_summarize", "length":"","lengthError":"","regular":"","regError":""},
	
	{"name":"fucus_sname", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"fucus_cname", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"fucus_ename", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"fucus_spelling", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"fucus_summarize", "length":"","lengthError":"","regular":"","regError":""},
	
	{"name":"pdynamics_time", "length":"","lengthError":"","regular":"","regError":""},
	
	{"name":"pdynamics_number", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"pdynamics_summarize", "length":"","lengthError":"","regular":"","regError":""},
	
	{"name":"species_discover", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"species_cname", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"species_ename", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"species_spelling", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"fucus_summarize", "length":"","lengthError":"","regular":"","regError":""},
	{"name":"species_addword", "length":"","lengthError":"","regular":"","regError":""}
	
	
	
	];
	var flag = false;
		$(function() {
				
				$("input").change(
					function() {
						var value = $.trim($(this).val());
						var idName = this.id;
						//为空的时候每个input都需要校验
						//alert(idName);
						if(value==""){
							$("#"+idName+"Error").html(
									"<font color='red'>此为必填项！</font>");
							flag = false;
							return;
						}else{
							for(var i = 0; i < checkJson.length; i++){
								if(checkJson[i].name==idName){
									//如果匹配到了其字段就进行校验
									//1校验长度
									var lengthReg = checkJson[i].length;//长度正则
									var lengthError =  checkJson[i].lengthError;//出错显示信息
									if(value.match(lengthReg)){
										$("#"+idName+"Error").html(
											"<font color='green'>格式符合</font>");
										flag = true;
											return ;
									}else{
										$("#"+idName+"Error").html(
											"<font color='red'>"+lengthError+"</font>");
										flag = false;
										 return ;
									}
									//1校验格式
									var regular = checkJson[i].regular;//格式正则
									var regError =  checkJson[i].regError;//出错显示信息
									if(value.match(regular)){
										$("#"+idName+"Error").html(
											"<font color='green'>格式符合</font>");
										flag = true;
											return ;
									}else{
										$("#"+idName+"Error").html(
											"<font color='red'>"+regError+"</font>");
										flag = false;
											return ;
									}
								
								}
							}
			     	}
			});
		});
		
		function getConf(){
			alert("您还没填写信息！请填写信息！");
			return flag;
		}

