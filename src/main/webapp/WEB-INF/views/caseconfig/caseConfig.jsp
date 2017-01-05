<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>用例管理</title>
</head>

<body>
<style type="text/css">
	.demo { overflow:auto; border:1px solid silver; min-height:100px; }
	body .modal {
		width:70%;
		margin-left: -480px;
    }
</style>
<link rel="stylesheet" href="${ctx}/static/jstree/css/style.min.css" />
<script src="${ctx}/static/jstree/js/jstree.min.js"></script>
<script src="${ctx}/static/jquery-json/jquery.json.min.js"></script>

	<div class="container">
	<div class="row">
		<div class="span4"><!--用例树-->
			<fieldset>
						<legend><small>需求用例树</small></legend>
					<div id="lazy" class="demo"></div>
			</fieldset>
		</div>
		<div class="span6">
			<div class="row">
				<div class="span12">
					<form id="inputForm" action="${ctx}/module/${action}" method="post" class="form-horizontal">
						<input type="hidden" id="case_id" name="id"/>
						<input type="hidden" id="xml_config_id" name="xmlConfigId"/>
						<fieldset>
							<legend><small>用例信息</small></legend>
							<div class="control-group">
								<label for="module_title" class="control-label">用例名称：</label>
								<div class="controls">
									<input type="text" id="case_title" name="title" readonly   class="input-large required" minlength="3"/>
								</div>
							</div>
							<div class="control-group">
								<label for="module_title" class="control-label">优先级：</label>
								<div class="controls">
									<input type="text" id="case_priority" name="priority"   class="input-large required" minlength="3"/>
								</div>
							</div>							
							<div class="control-group">
								<label for="description" class="control-label">备注：</label>
								<div class="controls">
									<textarea id="case_discription" name="discription" class="form-control" ></textarea>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="span12">
				<fieldset>
					<legend><small>步骤信息</small></legend>
					<div class="tabbable" id="tabs-39121">
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#panel-208909" data-toggle="tab">用例步骤</a>
								</li>
								<li>
									<a href="#panel-934205" data-toggle="tab">配置步骤</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="panel-208909">
									<textarea id="case_case_step" name="caseStep" class="form-control" ></textarea>
								</div>
								<div class="tab-pane" id="panel-934205">
									<table class="table table-hover table-condensed">
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
													 <button class="btn btn-small btn-success" id="selectXmlConfig" type="button">选配置</button>
													 <button class="btn btn-small btn-success" id="viewXmlConfig" type="button">查看配置</button>
												</th>
											</tr>
										</thead>
										<tbody id="stepTbody">
												
										</tbody>
									</table>
								</div>
							</div>
							</fieldset>
					</div>
				</div>
					<div class="row">
							<div class="control-group">
								<input id="submit_btn" class="btn btn-primary" type="submit" value="保存"/>&nbsp;	
							</div>
					</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="selectXmlConfigWin">  
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
		$('#lazy').jstree({
		  "core" : {
			"animation" : 0,
			"check_callback" : true,
			"themes" : { "stripes" : true },
			'data' : {
			  'url' : function (node) {
				return '${ctx}/case/getChildren';
			  },
			  'data' : function (node) {
				var parentId = node.id;
				  if(parentId == '#'){
				      parentId = '0';
				  }
				return { 'parentId' : parentId};
			  }
			}
		  },
		  "types" : {
			"#" : {
			  "max_children" : 1,
			  "max_depth" : 100,
			  "valid_children" : ["root"]
			},
			"root" : {
			  "icon" : "${ctx}/static/jstree/css/tree_icon.png",
			  "valid_children" : ["folder"]
			},
			"folder" : {
			  "icon" : "jstree-folder",
			  "valid_children" : ["folder","default"]
			},
			"default" : {
			  "icon" : "jstree-file",
			  "valid_children" : ["default"]
			}
		  },
		  'contextmenu' : {
						'items' : function(node) {
							var tmp = $.jstree.defaults.contextmenu.items();
							delete tmp.ccp;
							delete tmp.create.action;
							tmp.create.label = "创建";
							tmp.rename.label = "修改";
							tmp.remove.label = "删除";
							

							tmp.create.submenu = {
								"create_folder" : {
									"separator_after"	: true,
									"label"				: "创建需求",
									"action"			: function (data) {
										var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);
										inst.create_node(obj, { type : "folder" }, "last", function (new_node) {
											setTimeout(function () { inst.edit(new_node); },0);
										});
									}
								},
								"create_file" : {
									"label"				: "创建用例",
									"action"			: function (data) {
										var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);
										inst.create_node(obj, { type : "default" }, "last", function (new_node) {
											setTimeout(function () { inst.edit(new_node); },0);
										});
									}
								}
							};

							if(this.get_type(node) === "root"){
								delete tmp.create.submenu.create_file;
								delete tmp.rename;
								delete tmp.remove;
							}else if(this.get_type(node) === "folder") {
								
							}else if(this.get_type(node) === "default"){
								delete tmp.create;
							}
							
							return tmp;
						}
					},
		  "plugins" : [
			"contextmenu", "dnd", "search",
			"state", "types", "wholerow"
		  ]
		}).bind("create_node.jstree",function(event,data){
            console.log(data);
			createNode(data);
        }).bind("rename_node.jstree",function(event,data){
            console.log(data);
			renameNode(data);
        }).bind("delete_node.jstree",function(event,data){
            console.log(data);
			delNode(data);
        }).bind("select_node.jstree",function(event,data){
            console.log(data);
			selectNode(data);
        });

		function createNode(data){
			var sendInfo = {};
			sendInfo['text'] = data.node.text;
			sendInfo['parentId'] = data.parent;
			sendInfo['leaf'] = data.node.type == "folder" ? 0 : 1;
		    $.ajax({
			   type: "POST",
			   url: "${ctx}/case/createNode",
			   contentType: "application/json; charset=utf-8",
			   dataType: "json",
			   data: $.toJSON(sendInfo),
			   success: function (d) {
				  data.instance.set_id(data.node, d.id);
			   },
			   error : function(){
			      data.instance.refresh();
			   }
		   });
		}

		function renameNode(data){
			var sendInfo = {};
			sendInfo['id'] = data.node.id;
			sendInfo['text'] = data.node.text;

			$.ajax({
			   type: "POST",
			   url: "${ctx}/case/renameNode",
			   contentType: "application/json; charset=utf-8",
			   dataType: "json",
			   data: $.toJSON(sendInfo),
			   success: function (msg) {

			   },
			   error : function(){
			      data.instance.refresh();
			   }
		   });
		}

		function delNode(data){
			var sendInfo = {};
			sendInfo['id'] = data.node.id;
			$.ajax({
			   type: "POST",
			   url: "${ctx}/case/delNode",
			   contentType: "application/json; charset=utf-8",
			   dataType: "json",
			   data: $.toJSON(sendInfo),
			   success: function (msg) {
				  data.instance.refresh();
			   },
			   error : function(){
			      data.instance.refresh();
			   }
		   });
		}

		function selectNode(data){
		    if(data.node.type == 'default'){//

				$.ajax({
				   type: "GET",
				   url: "${ctx}/case/getCaseNodeById/" + data.node.id,
				   contentType: "application/json; charset=utf-8",
				   dataType: "json",
				   success: function (dbData) {
					    $('#case_id').val(dbData.id);
						$('#case_title').val(dbData.text);
						$('#case_priority').val(dbData.priority);
						$('#case_discription').val(dbData.discription);
				        $('#case_case_step').val(dbData.caseStep);
						
						$('#stepTbody').html('');
						console.log(dbData.xmlConfig);

						addStepFunc(dbData.xmlConfig);
						
				   },
				   fail:function(){
				       cleanForm();
				   }
			   });
			}else{//非叶子节点，非用例
			    cleanForm();
			}
		}

		function cleanForm(){
				$('#case_title').val('');
				$('#case_priority').val('');
				$('#case_discription').val('');
				$('#case_case_step').val('');
				$('#stepTbody').html('');
		}
		
		function stepRowClickFunc(){
		
		}

		$('#selectXmlConfig').click(function(){
			var frameSrc = "${ctx}/xmlConfig/select";  
			$("#NoPermissioniframe").attr("src", frameSrc);  
			$('#selectXmlConfigWin').modal({ show: true, backdrop: 'static' });  
		});
		
		setTimeout(function(){
		    $('#selectXmlConfigWin').modal({ show: true, backdrop: 'static' });
			$('#selectXmlConfigWin').modal('hide');
		},20);

		$('#viewXmlConfig').click(function(){
		    
		});

		$('#selectModuleConfirm').click(function(){
			var id = $($('#NoPermissioniframe')[0].contentWindow.document.body).find('input[name="xmlConfigSelec"]:checked').val();
			$.ajax({ url: "${ctx}/xmlConfig/getXmlConfigById/" + id, context: document.body, success: function(rt){
				$('#stepTbody').html('');
				addStepFunc(rt)
			}});
		});

		$('#submit_btn').click(function(){
		    var sendInfo = {};
				sendInfo['id'] = $('#case_id').val();
				sendInfo['text'] = $('#case_title').val();
				sendInfo['priority'] = $('#case_priority').val();
				sendInfo['discription'] = $('#case_discription').val();
				sendInfo['caseStep'] = $('#case_case_step').val();
				sendInfo['xmlConfig'] = {id:$('#xml_config_id').val()};

		    $.ajax({
			   type: "POST",
			   url: "${ctx}/case/saveCaseInfo",
			   contentType: "application/json; charset=utf-8",
			   dataType: "json",
			   data: $.toJSON(sendInfo),
			   success: function (msg) {
				  alert('保存成功');
			   }
		   });

		});

		function addStepFunc(xmlConfig){
			if(!xmlConfig){
				return ;
			}
			$('#xml_config_id').val(xmlConfig.id);
			var stepDetail = xmlConfig.detail;
			if(!stepDetail){
				return ;
			}

			for(var i = 0;i < stepDetail.length ;i++ ){
				$('<tr><td>' + stepDetail[i].orderNum + '</td><td>' + stepDetail[i].stepName + '</td><td>' + stepDetail[i].description + '</td><td><a href="#"></a></td></tr>')
				.click(stepRowClickFunc)	
				.appendTo('#stepTbody');
			}
		}
//-->
</script>
</body>
</html>
