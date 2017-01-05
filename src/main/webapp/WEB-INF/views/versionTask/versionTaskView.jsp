<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>版本任务</title>
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
<link rel="stylesheet" href="${ctx}/static/jquery-dropdown/css/jquery.dropdown.min.css" />

<script src="${ctx}/static/jstree/js/jstree.min.js"></script>
<script src="${ctx}/static/jquery-json/jquery.json.min.js"></script>
<script src="${ctx}/static/jquery-dropdown/js/jquery.dropdown.min.js"></script>

<div class="container">
	<div class="row">
		<div class="span5">
			<fieldset>
						<legend><small>版本任务树</small></legend>
					<div id="lazy" class="demo"></div>
			</fieldset>
		</div>
		<div class="span7">
			<div class="row">
				<div class="span12">
				<fieldset>
						<legend><small>任务详情</small></legend>
						<button class="btn btn-success btn-sm" id="selectXmlConfig" data-jq-dropdown="#jq-dropdown-6" type="button">添加用例</button>
						<button class="btn btn-danger btn-sm" id="deleteCaseBt" type="button">删除用例</button>
						<input type="hidden" id="current_task_id" name="taskId" />
						<table class="table table-hover table-condensed">
							<thead>
								<tr>
								    <th>
										
									</th>
									<th>
										用例名
									</th>
									<th>
										任务名
									</th>
									<th>
										执行状态
									</th>
									<th>
										执行结果
									</th>
									<th>
										 
									</th>
								</tr>
							</thead>
							<tbody id="verTaskCaseTbody">
								
							</tbody>
						</table>
					</fieldset>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="jq-dropdown-6" class="jq-dropdown jq-dropdown-tip has-icons">
        <div class="jq-dropdown-panel">
           <div id="caseTree" class="demo"></div>
        </div>
    </div>


<script type="text/javascript">
<!--


$('#jq-dropdown-6').on('hide', function(event, dropdownData) {
    $('#caseTree').jstree(true).uncheck_all();
});

$('#caseTree').jstree({
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
		   "checkbox": {       
			  three_state : false, // to avoid that fact that checking a node also check others
			  whole_node : false,  // to avoid checking the box just clicking the node 
			  tie_selection : false // for checking without selecting and selecting without checking
			},
		  "plugins" : [
			"checkbox", "search",
			"state", "types", "wholerow"
		  ]
		}).bind("check_node.jstree",function(e,data){
			  if(!data.node){
			      return ;
			  }
			  var sendInfo = {};
			    sendInfo['versionTask'] = {id:$('#current_task_id').val()};
				sendInfo['caseNode'] = {id:data.node.id};

		      $.ajax({
			   type: "POST",
			   url: "${ctx}/verTask/addCase",
			   contentType: "application/json; charset=utf-8",
			   dataType: "json",
			   data: $.toJSON(sendInfo),
			   success: function (msg) {
					refreshVerTaskCaseTable();
			   },
			   error : function(){
				   refreshVerTaskCaseTable();
			   }
		       });
		});

		function refreshVerTaskCaseTable(){
				$.ajax({
				   type: "GET",
				   url: "${ctx}/verTask/getVersionTaskById/" + $('#current_task_id').val(),
				   contentType: "application/json; charset=utf-8",
				   dataType: "json",
				   success: function (dbData) {
						$('#verTaskCaseTbody').html('');
						var caseList = dbData.taskCases;
						for(var i = 0;i < caseList.length ;i++ ){
							$('<tr><td><input type="checkbox" name="taskCaseBox" value="' + caseList[i].id + '"></td><td>' + caseList[i].text + '</td><td>' + dbData.text + '</td><td>' + getCaseStatus(caseList[i].status) + '</td><td>' + getCaseRunResult(caseList[i].runResult) + '</td></tr>')
							.appendTo('#verTaskCaseTbody');
						}
				   },
				   fail:function(){
				       cleanForm();
				   }
			   });
		}
		
		function getCaseStatus(s){
			var str = '<div class="progress progress-striped active"><div class="bar" style="width: {}%;"></div></div>';
			if(s * 1 == 0){
			    return str.replace('{}',0);
			}
			if(s * 1 == 1){
			    return str.replace('{}',50);
			}
			if(s * 1 == 2){
			    return str.replace('{}',100);
			}
			return str.replace('{}',0);
		}

		function getCaseRunResult(s){
		    if(s * 1 == 2){
			    return '<span class="label label-success">成功</span>';
			}
			if(s * 1 == 3){
			    return '<span class="label label-important">失败</span>';
			}
			return '<span class="label">无</span>';
		}

		$('#lazy').jstree({
		  "core" : {
			"animation" : 0,
			"check_callback" : true,
			"themes" : { "stripes" : true },
			'data' : {
			  'url' : function (node) {
				return '${ctx}/verTask/getChildren';
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
									"label"				: "创建版本",
									"action"			: function (data) {
										var inst = $.jstree.reference(data.reference),
											obj = inst.get_node(data.reference);
										inst.create_node(obj, { type : "folder" }, "last", function (new_node) {
											setTimeout(function () { inst.edit(new_node); },0);
										});
									}
								},
								"create_file" : {
									"label"				: "创建任务",
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

								tmp.run_task = {
										"label"				: "运行",
										"action"			: function (data) {
											
										}
									}
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
			   url: "${ctx}/verTask/createNode",
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
			   url: "${ctx}/verTask/renameNode",
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
			   url: "${ctx}/verTask/delNode",
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
				$('#current_task_id').val(data.node.id);
				refreshVerTaskCaseTable();
				
			}else{//非叶子节点，非用例
				$('#current_task_id').val('');
				$('#verTaskCaseTbody').html('');
			}
		}

		$('#deleteCaseBt').click(function(){
			var idArr = [];
		    $('#verTaskCaseTbody').find('input[name="taskCaseBox"]:checked').each(function (index,it){
			    idArr.push($(it).val());
			});
			$.ajax({
				   type: "POST",
				   url: "${ctx}/verTask/delTaskCaseByIds",
				   contentType: "application/json; charset=utf-8",
				   dataType: "json",
				   data: $.toJSON(idArr),
				   success: function (d) {
					  refreshVerTaskCaseTable();
				   },
				   error : function(){
					  
				   }
			   });
			});

		
//-->
</script>
</body>
</html>
