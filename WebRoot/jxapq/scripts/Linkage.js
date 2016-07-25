function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    //var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    //var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    //var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(projectName);
}

//查找的是门
$(function(){
	//添加界改变相应函数
	$("#kingdom").change(function(){	
		//去除第一个：请选择请求
		$("#phylum option:not(:first)").remove();
		var kingdom = $(this).val();
		//如果kingdom != ""，说明的确是界发生了改变，准备Ajax请求
		if(kingdom != "") {
			//要跳转的servlet
			var url = getRootPath()+"/QueryServlet?method=linkage2&view=searchMen";
			//需要附带的参数
			var args ={"id":kingdom};
			$.getJSON(url,args,function(data){
				if(data.length==0){
				}else{
					for(var i = 0;i<data.length;i++){
						var phylumId = data[i].id;
						var phylumName = data[i].name;	
						//创建一个optioin节点
						$("#phylum").append("<option value='"+phylumId+"'>"+phylumName+"</option>");	
					}
				}
			});
		}
	});
});

//查找的是纲
$(function(){
	//添加界改变相应函数
	$("#phylum").change(function(){	
		//去除第一个：请选择请求
		$("#clazz option:not(:first)").remove();
		var phylum = $(this).val();
		//如果kingdom != ""，说明的确是界发生了改变，准备Ajax请求
		if(phylum != "") {
			//要跳转的servlet
			var url = getRootPath()+"/QueryServlet?method=linkage2&view=searchGang";
			//需要附带的参数
			var args ={"id":phylum};
			$.getJSON(url,args,function(data){
				if(data.length==0){
				}else{
					for(var i = 0;i<data.length;i++){
						var clazzId = data[i].id;
						var clazzName = data[i].name;	
						//创建一个optioin节点
						$("#clazz").append("<option value='"+clazzId+"'>"+clazzName+"</option>");	
					}
				}
			});
		}
	});
});

//查找的是目
$(function(){
	//添加界改变相应函数
	$("#clazz").change(function(){	
		//去除第一个：请选择请求
		$("#order option:not(:first)").remove();
		var clazz = $(this).val();
		if(clazz != "") {
			//要跳转的servlet
			var url = getRootPath()+"/QueryServlet?method=linkage2&view=searchMu";
			//需要附带的参数
			var args ={"id":clazz};
			$.getJSON(url,args,function(data){
				if(data.length==0){
				}else{
					for(var i = 0;i<data.length;i++){
						var orderId = data[i].id;
						var orderName = data[i].name;	
						//创建一个optioin节点
						$("#order").append("<option value='"+orderId+"'>"+orderName+"</option>");	
					}
				}
			});
		}
	});
});



//查找的是科
$(function(){
	//添加界改变相应函数
	$("#order").change(function(){	
		//去除第一个：请选择请求
		$("#family option:not(:first)").remove();
		var order = $(this).val();
		//如果kingdom != ""，说明的确是界发生了改变，准备Ajax请求
		if(order != "") {
			//要跳转的servlet
			var url = getRootPath()+"/QueryServlet?method=linkage2&view=searchKe";
			//需要附带的参数
			var args ={"id":order};
			$.getJSON(url,args,function(data){
				if(data.length==0){
				}else{
					for(var i = 0;i<data.length;i++){
						var familyId = data[i].id;
						var familyName = data[i].name;	
						//创建一个optioin节点
						$("#family").append("<option value='"+familyId+"'>"+familyName+"</option>");	
					}
				}
			});
		}
	});
});

//查找的是属
$(function(){
	//添加界改变相应函数
	$("#family").change(function(){	
		//去除第一个：请选择请求
		$("#fucus option:not(:first)").remove();
		var family = $(this).val();
		//如果kingdom != ""，说明的确是界发生了改变，准备Ajax请求
		if(family != "") {
			//要跳转的servlet
			var url = getRootPath()+"/QueryServlet?method=linkage2&view=searchShu";
			//需要附带的参数
			var args ={"id":family};
			$.getJSON(url,args,function(data){
				if(data.length==0){
				}else{
					for(var i = 0;i<data.length;i++){
						var fucusId = data[i].id;
						var fucusName = data[i].name;	
						//创建一个optioin节点
						$("#fucus").append("<option value='"+fucusId+"'>"+fucusName+"</option>");	
					}
				}
			});
		}
	});
});

//查找的是种
$(function(){
	//添加界改变相应函数
	$("#fucus").change(function(){	
		//去除第一个：请选择请求
		$("#species option:not(:first)").remove();
		var fucus = $(this).val();
		//如果kingdom != ""，说明的确是界发生了改变，准备Ajax请求
		if(fucus != "") {
			//要跳转的servlet
			var url = getRootPath()+"/QueryServlet?method=linkage2&view=searchZhong";
			//需要附带的参数
			var args ={"id":fucus};
			$.getJSON(url,args,function(data){
				if(data.length==0){
				}else{
					for(var i = 0;i<data.length;i++){
						var speciesId = data[i].id;
						var speciesName = data[i].name;	
						//创建一个optioin节点
						$("#species").append("<option value='"+speciesId+"'>"+speciesName+"</option>");	
					}
				}
			});
		}
	});
});


//查找的是子区系类型
$(function(){
	//添加界改变相应函数
	$("#reginal").change(function(){	
		//去除第一个：请选择请求
		$("#subreginal option:not(:first)").remove();
		var reginal = $(this).val();
		//如果kingdom != ""，说明的确是界发生了改变，准备Ajax请求
		if(reginal != "") {
			//要跳转的servlet
			var url = getRootPath()+"/QueryServlet?method=linkage2&view=searchSubreginal";
			//需要附带的参数
			var args ={"id":reginal};
			$.getJSON(url,args,function(data){
				if(data.length==0){
				}else{
					for(var i = 0;i<data.length;i++){
						var subreginalId = data[i].id;
						var subreginalName = data[i].name;	
						//创建一个optioin节点
						$("#subreginal").append("<option value='"+subreginalId+"'>"+subreginalName+"</option>");	
					}
				}
			});
		}
	});
});






