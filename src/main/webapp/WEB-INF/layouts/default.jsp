<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>QuickStart示例:<sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">
<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/bootstrap/2.3.2/css/bootstrap-responsive.min.css" type="text/css" rel="stylesheet" />

<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/styles/default.css" type="text/css" rel="stylesheet" />

<link href="${ctx}/static/bootstrap-datetimepicker/css/datetimepicker.css" rel="stylesheet" />
<link href="${ctx}/static/bootstrap-editable/css/bootstrap-editable.css" rel="stylesheet" />

<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${ctx}/static/bootstrap/2.3.2/js/bootstrap.min.js" type="text/javascript"></script>


<script src="${ctx}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
<script src="${ctx}/static/bootstrap-editable/js/bootstrap-editable.min.js"></script>

<script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery-validation/1.11.1/messages_bs_zh.js" type="text/javascript"></script>

<sitemesh:head/>
</head>

<body>
	<%@ include file="/WEB-INF/layouts/header.jsp"%>
    <div class="container-fluid">
			  <div class="row-fluid" style="margin-top:40px;">
					<div class="span3">
						 <shiro:user>
							  <div class="well sidebar-nav">
							 
								<ul id="daohangcaidan" class="nav nav-list">
								  <li class="nav-header">导航</li>
								  <li value="module"><a href="${ctx}/module">模板管理</a></li>
								  <li value="xmlConfig"><a href="${ctx}/xmlConfig">配置管理</a></li>
								  <li value="case"><a href="${ctx}/case/view">用例管理</a></li>
								  <li value="verTask"><a href="${ctx}/verTask/view">版本任务</a></li>
								</ul>
								
							  </div><!--/.well -->
						  </shiro:user>
					</div><!--/span-->
					<div class="span9">
							<sitemesh:body/>
					</div><!--/span-->
			  </div><!--/row-->
	</div><!--container-fluid-->
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	
</body>
</html>
<script type="text/javascript">
<!--
	$('#daohangcaidan').find('li').each(function(index,li){
	   var url = document.location.href.replace('http://' + document.location.host + '/','');

	   if(url.startsWith($(li).attr('value'))){
	       $(li).addClass('active');
	   }
	});
//-->
</script>