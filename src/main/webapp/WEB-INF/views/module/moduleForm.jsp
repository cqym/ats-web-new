<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>模板管理</title>
</head>

<body>
	<form id="inputForm" action="${ctx}/module/${action}" method="post" class="form-horizontal">
		<input type="hidden" name="id" value="${module.id}"/>
		<fieldset>
			<legend><small>创建模板</small></legend>
			<div class="control-group">
				<label for="module_title" class="control-label">模板名称：</label>
				<div class="controls">
					<input type="text" id="module_title" name="title"  value="${module.title}" class="input-large required" minlength="3"/>
				</div>
			</div>	
			<div class="control-group">
				<label for="task_title" class="control-label">客户端类型：</label>
				<div class="controls">
					<input type="text" id="clientType" name="clientType"  value="${module.clientType}" class="input-large required" minlength="3"/>
				</div>
			</div>
			<div class="control-group">
				<label for="description" class="control-label">请求信令：</label>
				<div class="controls">
					<textarea id="requestCmd" name="requestCmd" class="input-large">${module.requestCmd}</textarea>
				</div>
			</div>	
			<div class="control-group">
				<label for="description" class="control-label">应答信令：</label>
				<div class="controls">
					<textarea id="responseCmd" name="responseCmd" class="input-large">${module.responseCmd}</textarea>
				</div>
			</div>
			<div class="form-actions">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back()"/>
			</div>
		</fieldset>
	</form>
	<script>
		$(document).ready(function() {
			//聚焦第一个输入框
			$("#module_title").focus();
			//为inputForm注册validate函数
			$("#inputForm").validate();
		});
	</script>
</body>
</html>
