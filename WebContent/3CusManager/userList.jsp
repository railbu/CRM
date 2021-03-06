<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
		<title>Insert title here</title>
		<%@include file="/common/header.jsp"%>
		<%@include file="/common/meta.jsp"%>

</head>

<body>
		<%@include file="topCNM.jsp"%>
		<%@include file="naviCN.jsp"%>
		
		<script src="${ctx}/resources/js/typeahead-bs2.min.js"></script>
		<script src="${ctx}/resources/js/ace-elements.min.js"></script>
		<script src="${ctx}/resources/js/ace.min.js"></script>
	
		<div class="mainc" id="mainc">
			<div class="navbar1">
				<span class="maincLabel">
					<i class="glyphicon glyphicon-export"></i>
					&nbsp;权限管理
				</span>
			</div>
			<div class="col-md-10">
			
			</div>
			<div class="col-md-12">
			<div class="table1">
				<div class="panel panel-default">
 				<!-- Default panel contents -->
 				<div class="panel-heading" style="height:40px">
 					<div class="col-offset-lg-4 col-md-3">
						<label class="control-label">用户列表</label>
					</div>
				</div>
					<table class="table">
					<thead>
						<tr>
							<th>用户名</th>
							<th>姓名</th>
							<th>职务</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="userList" var="item">
							<tr>
								<td><s:property value="username" /></td>
								<td><s:property value="name" /></td>
								<td><s:property value="getPower(power)" /></td>
								<td>			
									<s:url value="/authority_uaDoList" id="edit">
										<s:param name="power" value="%{power}" />
									</s:url> 
									<s:a href="%{edit}" cssClass="button button-flat-primary button-tiny" style="height:32px">编辑</s:a>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				</div>
				<s:set name="curPage" value="%{currentPage}"/>
				
					<div class="pageSelect">
						<ul class="pagination">
						
							<s:url value="/3CusManager/contact_listContact" id="lpage">
								 	<s:param name="currentPage" value="lastPage"/>
								 	<s:param name="cnbid" value="%{cnbid}"/>
								 </s:url>
							<li ><s:a href="%{lpage}">&laquo;</s:a></li>
							
							<s:iterator value="pages" var="item">
								 <s:url value="/3CusManager/contact_listContact" id="page">
								 	<s:param name="currentPage" value="#item"/>
								 	<s:param name="cnbid" value="%{cnbid}"/>
								 </s:url>
								 <s:if test="#curPage == #item">
								 	<li class="active"><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:if>
								 <s:else>
								 	<li ><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:else>
							</s:iterator>
							
							<s:url value="/3CusManager/contact_listContact" id="rpage">
							 	<s:param name="currentPage" value="nextPage"/>
							 	<s:param name="cnbid" value="%{cnbid}"/>
							</s:url>
							<li ><s:a href="%{rpage}">&raquo;</s:a></li>
						</ul>
					</div>
			</div>
			</div>
		</div>
	
</body>
</html>