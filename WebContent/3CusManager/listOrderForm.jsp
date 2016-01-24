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
					&nbsp客户信息管理 > 客户信息 > 历史订单 
				</span>
				<%-- <a href="${ctx}/3CusManager/contact_add.action?cnbid=${customer.id}" >新建</a> --%>
				<a href="#" >帮助</a>
				<a href="#" >返回</a>
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
						<s:property value="%{myid}"/>
					</div>
					<div class="col-md-3">
						<label class="control-label">客户名称</label>
					</div>
					<div class="col-md-3">
						${customer.name}
					</div>
				</div>
					<table class="table">
					<thead>
						<tr>
							<th>订单编号</th>
							<th>日期</th>
							<th>送货地址</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="list" var="item">
							<tr>
								<td><s:property value="orderNum" /></td>
								<td><s:property value="createDate" /></td>
								<td><s:property value="address" /></td>
								<td><s:property value="state" /></td>
								<td>			
									<s:url value="/3CusManager/orderform_moreinfo" id="more">
										<s:param name="cnid" value="id" />
										<s:param name="myid" value="%{myid}"/>
									</s:url> 
									<s:a href="%{more}" cssClass="button button-flat-primary button-tiny" style="height:32px"><span class="glyphicon glyphicon-list-alt"></span></s:a> 
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				</div>
				<s:set name="curPage" value="%{currentPage}"/>
				
					<div class="pageSelect">
						<ul class="pagination">
						
							<s:url value="/3CusManager/orderform_list" id="lpage">
								 	<s:param name="currentPage" value="lastPage"/>
								 	<s:param name="myid" value="%{myid}"/>
								 </s:url>
							<li ><s:a href="%{lpage}">&laquo;</s:a></li>
							
							<s:iterator value="pages" var="item">
								 <s:url value="/3CusManager/orderform_list" id="page">
								 	<s:param name="currentPage" value="#item"/>
								 	<s:param name="myid" value="%{myid}"/>
								 </s:url>
								 <s:if test="#curPage == #item">
								 	<li class="active"><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:if>
								 <s:else>
								 	<li ><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:else>
							</s:iterator>
							
							<s:url value="/3CusManager/orderform_list" id="rpage">
							 	<s:param name="currentPage" value="nextPage"/>
							 	<s:param name="myid" value="%{myid}"/>
							</s:url>
							<li ><s:a href="%{rpage}">&raquo;</s:a></li>
						</ul>
					</div>
			</div>
			</div>
		</div>
	
</body>
</html>