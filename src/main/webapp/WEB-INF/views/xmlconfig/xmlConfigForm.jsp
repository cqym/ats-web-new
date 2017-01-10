<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>配置管理</title>
</head>

<body>

<link href="${ctx}/static/prettify/css/hemisu-light.css" type="text/css" rel="stylesheet"></link>
<script src="${ctx}/static/prettify/js/prettify.js"></script>
<script src="${ctx}/static/jquery-json/jquery.json.min.js"></script>
<style type="text/css">
	body .modal {
		width:70%;
		margin-left: -480px;
    }
</style>

	<div class="container">
	<div class="row">
		<form id="inputForm" action="${ctx}/module/${action}" method="post" class="form-horizontal">
			<input type="hidden" name="id" value="${module.id}"/>
			<fieldset>
				<legend><small>创建配置</small></legend>
				<div class="control-group">
					<label for="module_title" class="control-label">配置名称：</label>
					<div class="controls">
						<input type="text" id="xml_config_title" name="title"  value="${xmlConfig.title}" class="input-large required" minlength="3"/>
					</div>
				</div>	
				<div class="control-group">
					<label for="description" class="control-label">备注：</label>
					<div class="controls">
						<textarea id="xml_config_discription" name="responseCmd" class="form-control" >${xmlConfig.description}</textarea>
					</div>
				</div>
			</fieldset>
		</form>

	</div>
	<div class="row">
		<div class="span6">
			<table class="table table-hover table-condensed table-striped">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							步骤名
						</th>
						<th>
							备注
						</th>
						<th>
							 <button class="btn btn-small btn-success" id="addStep" type="button">加步骤</button>
						</th>
					</tr>
				</thead>
				<tbody id="stepTbody">
					<c:forEach items="${xmlConfig.detail}" var="m">
					    <tr class="stepRowClass">
						    <td>${m.orderNum}</td>
							<td>${m.stepName}</td>
							<td><a href="#" class="stepClass" data-type="text" data-pk="1" data-title="请输入备注">${m.description}</a></td>
							<td><a href="#">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="span6">
			<div class="tabbable" id="tabs-151291">
				<ul class="nav nav-tabs">
					<li>
						<a href="#panel-988369" data-toggle="tab">请求</a>
					</li>
					<li class="active">
						<a href="#panel-587039" data-toggle="tab">响应</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="panel-988369">
						<pre id="requestContentView" class="prettyprint">
							请求内容.......
						</pre>
					</div>
					<div class="tab-pane active" id="panel-587039">
						<pre id="responseContentView" class="prettyprint">
							响应内容.......
						</pre>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span4">
			<form class="form-horizontal">
				<fieldset >
					 <legend><small>请求参数配置</small></legend> 
					 <div class="control-group" id="reqParamsView">
						
					</div>	
				</fieldset>
			</form>
		</div>
		<div class="span4">
			<form class="form-horizontal">
				<fieldset>
					 <legend><small>响应参数配置</small></legend>
					 <div class="control-group" id="responseParamsView">

					</div>	
				</fieldset>
			</form>
		</div>
		<div class="span4">
			<form class="form-horizontal">
				<fieldset>
					 <legend><small>关联参数</small></legend> 
					 <div class="control-group" id="guanlianParamsView">					 
					 </div>
				</fieldset>
			</form>
		</div>
	</div>
	<div class="row">
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="document.location.href='${ctx}/xmlConfig'"/>
		    </div>
	</div>
</div>
<div class="modal fade" id="selectModuleWin">  
    <div class="modal-dialog" >  
        <div class="modal-content">  
            <div class="modal-header">  
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="selectModuleWinLabel">选择模板</h4>  
            </div>  
            <div class="modal-body" style="height:300px">  
                <iframe id="NoPermissioniframe" width="100%" height="100%" frameborder="0"></iframe>  
            </div>  
            <div class="modal-footer">  
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="selectModuleConfirm">确认</button> 
            </div>  
        </div>  
    </div>  
</div>
<script type="text/javascript">
<!--
	$(function(){  

    $("#addStep").click(function(){  
        var frameSrc = "${ctx}/module/select";  
        $("#NoPermissioniframe").attr("src", frameSrc);  
        $('#selectModuleWin').modal({ show: true, backdrop: 'static' });  
    });
	
	$('#selectModuleConfirm').click(function(){
	    var id = $($('#NoPermissioniframe')[0].contentWindow.document.body).find('input[name="moduleSelec"]:checked').val();
		$.ajax({ url: "${ctx}/module/getDetail/" + id, context: document.body, success: function(rt){
			addStepFunc(rt.title,rt.requestCmd,rt.responseCmd)
		}});
	});

	 $('.stepClass').editable({
           type: 'text',
           title: '请输入步骤名',
		   validate: function (value) { //字段验证
                if (!$.trim(value)) {
                    return '不能为空';
                }
				setTimeout(function() {
					currentStep.description = value;
				}, 1000);
           }
    });
	
	
function getValByStepParamKey(arr,key){
	for(var i = 0; i < arr.length ;i++ ){
		if(arr[i][key]){
		    return arr[i][key];
		}
	}
	return '';
}
function stepRowClickFunc(){
		    var obj = stepArray[$(this).find('td:first').text()-1];
			currentStep = obj;
			$('#requestContentView').text(obj.requestContent);
			$('#responseContentView').text(obj.responseContent);
			
			var reqParamsMatchList = obj.requestContent.match(/\\$.*\\$/gi);
			$('#reqParamsView').html('');
			for(var i=0;i< reqParamsMatchList.length;i++ ){
				$('#reqParamsView').append('<label class="control-label">' + reqParamsMatchList[i] + '</label><div class="controls"><input type="text" class="input-medium required" value="' + getValByStepParamKey(currentStep.reqParams,reqParamsMatchList[i]) + '"/></div>');
			}


			$('#reqParamsView').find('input').blur(function(){
			    currentStep.reqParams = [];
				var reqParamsNames = $('#reqParamsView').find('label');
				var reqParamsInputs = $('#reqParamsView').find('input');
				for(var i = 0; i <  reqParamsNames.length; i++){
					var o = {};
					o[$(reqParamsNames[i]).text()] = $(reqParamsInputs[i]).val();
					currentStep.reqParams.push(o);
				}
			});

			var responeParamsMatchList = obj.responseContent.match(/\\$\{.*\}/gi);
			$('#responseParamsView').html('');
			for(var i=0;i< responeParamsMatchList.length;i++ ){
				$('#responseParamsView').append('<label class="control-label">' + responeParamsMatchList[i] + '</label><div class="controls"><input type="text" class="input-medium required" value="' + getValByStepParamKey(currentStep.responseParams,responeParamsMatchList[i]) + '"/></div>');
			}

			$('#responseParamsView').find('input').blur(function(){
			    currentStep.responseParams = [];
				var responParamsNames = $('#responseParamsView').find('label');
				var responParamsInputs = $('#responseParamsView').find('input');
				for(var i = 0; i <  responParamsNames.length; i++){
					var o = {};
					o[$(responParamsNames[i]).text()] = $(responParamsInputs[i]).val();
					currentStep.responseParams.push(o);
				}
			});
			
			$('#guanlianParamsView').html('');
			currentStep.gxParams = currentStep.gxParams ? currentStep.gxParams : [];
			for(var i=0 ; i< currentStep.gxParams.length; i++){
				var item = currentStep.gxParams[i];
				for(var t in item){
					addGxParamsInputNoIf(t,item[t]);
				}
			}
			addGxParamsInputNoIf('参数名');
		}

    $('.stepRowClass').click(stepRowClickFunc);

	var stepArray = [];
    var currentStep = {};

    var dbXmlConfig = ${xmlConfigJSON};
	if(dbXmlConfig.detail){
		for(var i = 0;i < dbXmlConfig.detail.length ;i++ ){
			var t = dbXmlConfig.detail[i];
			stepArray.push({
				'orderNum':t.orderNum,
				'stepName':t.stepName,
				'description':t.description,
				'requestContent':t.requestContent,
				'responseContent':t.responseContent,
				'reqParams':eval(t.requestParams),
				'responseParams':eval(t.responseParams),
				'gxParams':eval(t.gxParams)
				});
		}
	}
	

	function addStepFunc(stepName,requestContent,responseContent){
		var maxStepNum = getMaxStepNum();
		var rowNum = maxStepNum * 1 + 1;

		$('<tr><td>' + rowNum + '</td><td>步骤' + rowNum + '</td><td></td><td><a href="#">删除</a></td></tr>')
		.click(stepRowClickFunc)	
		.appendTo('#stepTbody');

		$('<a href="#" class="stepClass" data-type="text" data-pk="1" data-title="请输入备注">' + stepName + '</a>')
			   .editable({
			   type: 'text',
			   title: '请输入步骤名',
			   validate: function (value) { //字段验证
					if (!$.trim(value)) {
						return '不能为空';
					}
					setTimeout(function() {
						currentStep.description = value;
					}, 1000);
			   }
		   }).appendTo($('#stepTbody').find('tr:last>td:eq(2)'));

		var it = {
			'orderNum':rowNum,
			'stepName':'步骤' + rowNum,
			'description':stepName,
			'requestContent':requestContent,
			'responseContent':responseContent,
			'reqParams':[],
			'responseParams':[],
			'gxParams':[]
			};
		stepArray.push(it);
	}
	
	function getMaxStepNum(){
	    var rows = $('#stepTbody').find('tr');
		if(rows && rows.length > 0){
		    return $(rows[rows.length - 1]).find('td:first').text();
		}
		return 0;
	}

	$('#submit_btn').click(function(){
	    console.log(stepArray);
		var sendInfo = {};
		sendInfo['title'] = $('#xml_config_title').val();
		sendInfo['description'] = $('#xml_config_discription').val();

		var detail = [];
		for(var i = 0;i < stepArray.length ;i++ ){
			var it = stepArray[i];
			detail.push({
				orderNum:it.orderNum,
				stepName:it.stepName,
				description:it.description,
				requestContent:it.requestContent,
				responseContent:it.responseContent,
				requestParams:$.toJSON(it.reqParams),
				responseParams:$.toJSON(it.responseParams),
				gxParams:$.toJSON(it.gxParams)
			});
		}
		sendInfo['detail'] = detail;
		
		var method = 'create';
		if(dbXmlConfig.id){
		    method = 'update';
			sendInfo['id'] = dbXmlConfig.id;
		}
	   $.ajax({
		   type: "POST",
		   url: "${ctx}/xmlConfig/" + method,
		   contentType: "application/json; charset=utf-8",
		   dataType: "json",
		   data: $.toJSON(sendInfo),
		   success: function (msg) {
			   alert(msg);
		   }
	   });
	});

   function addGxParamsInput(){
		refreshGxParams();
	   if(!$.trim($('#guanlianParamsView').find('div:last').find('input').val())){
	       return ;
	   }
       addGxParamsInputNoIf('参数名');
   }
   
   function refreshGxParams(){
		currentStep.gxParams = [];
		var gxParamsNames = $('#guanlianParamsView').find('label');
		var gxParamsInputs = $('#guanlianParamsView').find('input');
		for(var i = 0; i < gxParamsNames.length - 1; i++){
			if($.trim($(gxParamsInputs[i]).val()) == ''){
			    continue;
			}
			var o = {};
			o[$(gxParamsNames[i]).text()] = $(gxParamsInputs[i]).val();
			currentStep.gxParams.push(o);
		}
   }
   function addGxParamsInputNoIf(pname,pvalue){
		pname = pname ? pname : '';
		pvalue = pvalue ? pvalue : '';
		$('<div class="inline"><label data-type="text" data-pk="1" data-title="请输入参数名">' + pname + '</label><input type="text" class="input-medium required gxParamClass" value="' + pvalue + '"/><a href="#" class="btn .btn-mini disabled">-</a></div>')
		   .appendTo('#guanlianParamsView');

	   $('#guanlianParamsView').find('div:last').find('input').blur(addGxParamsInput);

	   $('#guanlianParamsView').find('div:last').find('label').editable({
           type: 'text',
           title: '请输入参数名',
		   validate: function (value) { //字段验证
                if (!$.trim(value)) {
                    return '不能为空';
                }
           }
	   }).on('save',function(){
		    setTimeout(function() {
				refreshGxParams();
			}, 200);
	   });

	   $('#guanlianParamsView').find('div:last').find('a').click(function(){
		   if($(this).parent().next().length == 0){
		       return ;
		   }
	       $(this).parent().remove();
			setTimeout(function() {
				refreshGxParams();
			}, 200);
	   });
   }

   //addGxParamsInputNoIf();
   $('.gxParamClass').blur(addGxParamsInput);

	$('#selectModuleWin').modal({ show: true, backdrop: 'static' });
	$('#selectModuleWin').modal('hide');

});  
//-->
</script>
</body>
</html>
