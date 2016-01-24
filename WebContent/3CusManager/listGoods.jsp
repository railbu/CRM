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
					&nbsp;查询产品信息 
				</span>
				<a href="#" >帮助</a>
				<a href="#" >查询</a>
			</div>
			<div class="col-md-10">
			
			</div>
			<div class="col-md-12">
			
				<div class="table1" style="padding:15px 30px 15px">
				<form action="${ctx}/3CusManager/goods_searchlist.action" class="form-inline" role="form" enctype="multipart/form-data" method="post">
						  <div class="form-group" style="width:29%">
						    <div class="input-group">
						      <div class="input-group-addon">　名称　</div>
						      <s:textfield name="goodsName" cssClass="form-control" placeholder="Enter name" />
						    </div>
						  </div>&nbsp;
						  <div class="form-group" style="width:29%">
						    <div class="input-group">
						      <div class="input-group-addon">　型号　</div>
						      <s:textfield name="goodsType" cssClass="form-control" placeholder="Enter type" />
						    </div>
						  </div>&nbsp;
						  <div class="form-group" style="width:29%">
						    <div class="input-group">
						      <div class="input-group-addon">　等级/批次　</div>
						      <s:textfield name="goodsLevel" cssClass="form-control" placeholder="Enter level" />
						    </div>
						  </div>&nbsp;
						  <s:submit style="width:9%" cssClass="btn btn-primary" value="Search" />
					</form>
				</div>
			
			
			<div class="table1">
					<table class="table">
					<thead>
						<tr>
							<th>编号</th>
							<th>名称</th>
							<th>型号</th>
							<th>等级/批次</th>
							<th>单位</th>
							<th>单价（元）</th>
							<th>备注</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="list" var="item">
							<tr>
								<td><s:property value="id" /></td>
								<td><s:property value="name" /></td>
								<td><s:property value="type" /></td>
								<td><s:property value="level" /></td>
								<td><s:property value="unit" /></td>
								<td><s:property value="price" /></td>
								<td><s:property value="remark" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				</div>
				
				<s:set name="curPage" value="%{currentPage}"/>
				
					<div class="pageSelect">
						<ul class="pagination">
						
							<s:url value="/3CusManager/goods_list" id="lpage">
								 	<s:param name="currentPage" value="lastPage"/>
								 </s:url>
							<li ><s:a href="%{lpage}">&laquo;</s:a></li>
							
							<s:iterator value="pages" var="item">
								 <s:url value="/3CusManager/goods_list" id="page">
								 	<s:param name="currentPage" value="#item"/>
								 </s:url>
								 <s:if test="#curPage == #item">
								 	<li class="active"><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:if>
								 <s:else>
								 	<li ><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:else>
							</s:iterator>
							
							<s:url value="/3CusManager/goods_list" id="rpage">
							 	<s:param name="currentPage" value="nextPage"/>
							</s:url>
							<li ><s:a href="%{rpage}">&raquo;</s:a></li>
						</ul>
					</div>
			</div>
			</div>
	
</body>
</html>