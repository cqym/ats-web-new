<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>配置管理</title>
</head>

<body>
	<div class="row">
		<div class="span4 offset7">
			<form class="form-search" action="#">
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
			    <th>配置名称</th>
				<th>描述</th>
				<th>创建时间</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${xmlconfigs.content}" var="m">
			<tr>
			    <td><input type="radio" name="xmlConfigSelec" id="moduleSelec" value="${m.id}"></td>
				<td><a href="${ctx}/xmlConfig/update/${m.id}">${m.title}</a></td>
				<td>${m.description}</a></td>
				<td>${m.createDate}</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<tags:pagination page="${xmlconfigs}" paginationSize="5"/>

</body>
</html>
