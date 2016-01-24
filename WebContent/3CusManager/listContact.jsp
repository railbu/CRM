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
					&nbsp;客户信息管理 > 客户信息 > 联系人 
				</span>
				<c:if test="${fn:contains(sessionScope.authority,'contact_add')}">
				<a href="${ctx}/3CusManager/contact_add.action?cnbid=${customer.id}" >新建</a>
				</c:if>
				<!-- <a href="#" >保存</a> -->
			</div>
			<div class="col-md-10">
			
			</div>
			<div class="col-md-12">
			<div class="table1">
				<div class="panel panel-default">
 				<!-- Default panel contents -->
 				<div class="panel-heading" style="height:40px">
 					<div class="col-md-3">
						<label class="control-label">客户编号</label>
					</div>
					<div class="col-md-3">
					${customer.id}
					</div>
					<div class="col-md-3">
						<label class="control-label">客户名称</label>
					</div>
					<div class="col-md-3">${customer.name}</div>
				</div>
					<table class="table">
					<thead>
						<tr>
							<th>姓名</th>
							<th>性别</th>
							<th>职位</th>
							<th>办公电话</th>
							<th>手机</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="list" var="item">
							<tr>
								<td><s:property value="name" /></td>
								<td>
								<s:if test="gender==0">男</s:if>
								<s:else>女</s:else>
								</td>
								<td><s:property value="position" /></td>
								<td><s:property value="officePhone" /></td>
								<td><s:property value="mobilePhone" /></td>
								<td><s:property value="remark" /></td>
								<td>			
									<c:if test="${fn:contains(sessionScope.authority,'contact_edit')}">
									<s:url value="/3CusManager/contact_edit" id="edit">
										<s:param name="contactId" value="id" />
										<s:param name="cnbid" >${customer.id}</s:param>
									</s:url> 
									<s:a href="%{edit}" cssClass="button button-flat-primary button-tiny" style="height:32px">编辑</s:a>
									</c:if>
									<c:if test="${fn:contains(sessionScope.authority,'contact_del')}">
									<s:url value="/3CusManager/contact_del" id="delete">
										<s:param name="contactId" value="id" />
										<s:param name="cnbid" >${customer.id}</s:param>
									</s:url> 
									<s:a href="%{delete}" cssClass="button button-flat-primary button-tiny" style="height:32px">删除</s:a>
									</c:if> 
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