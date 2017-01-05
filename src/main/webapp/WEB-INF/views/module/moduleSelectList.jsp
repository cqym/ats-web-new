<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>模板管理</title>
</head>

<body>
	
	<div class="row">
		<div class="span4 offset7">
			<form class="form-search" action="${ctx}/module/select">
				<label>名称：</label> <input type="text" name="search_LIKE_title" class="input-medium" value="${param.search_LIKE_title}"> 
				<button type="submit" class="btn" id="search_btn">Search</button>
		    </form>
	    </div>
	    <tags:sort/>
	</div>
	
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		    <tr>
			    <th>选择</th>
			    <th>模板名称</th>
				<th>客户端类型</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${modules.content}" var="m">
			<tr>
			    <td><input type="radio" name="moduleSelec" id="moduleSelec" value="${m.id}"></td>
				<td>${m.title}</td>
				<td>${m.clientType}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<tags:pagination page="${modules}" paginationSize="5"/>
</body>
</html>
