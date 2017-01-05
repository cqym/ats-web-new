<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>配置管理</title>
</head>

<body>
<fieldset>
		<legend><small>配置管理</small></legend>
	<c:if test="${not empty message}">
		<div id="message" class="alert alert-success"><button data-dismiss="alert" class="close">×</button>${message}</div>
	</c:if>
	<div class="row">
		<div class="span4 offset6">
			<form class="form-search" action="#">
				<tags:sort/><label>名称：</label> <input type="text" name="search_LIKE_title" class="input-medium" value="${param.search_LIKE_title}"> 
				<button type="submit" class="btn" id="search_btn">Search</button>
		    </form>
	    </div>
	</div>
	
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		    <tr>
			    <th>配置名称</th>
				<th>描述</th>
				<th>创建时间</th>
				<th>管理</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${xmlconfigs.content}" var="m">
			<tr>
				<td><a href="${ctx}/xmlConfig/update/${m.id}">${m.title}</a></td>
				<td>${m.description}</a></td>
				<td>${m.createDate}</a></td>
				<td><a href="${ctx}/xmlConfig/delete/${m.id}">删除</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<tags:pagination page="${xmlconfigs}" paginationSize="5"/>

	<div><a class="btn" href="${ctx}/xmlConfig/create">创建配置</a></div>
	</fieldset>
</body>
</html>
