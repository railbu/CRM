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
				<form action="${ctx}/3CusManager/leftgoods_searchlist.action" class="form-inline" role="form" enctype="multipart/form-data" method="post">
						  <div class="form-group" style="width:43%">
						    <div class="input-group">
						      <div class="input-group-addon">　产品　</div>
						      <s:textfield name="productName" cssClass="form-control" placeholder="Enter product name" />
						    </div>
						  </div>&nbsp;
						  <div class="form-group" style="width:43%">
						    <div class="input-group">
						      <div class="input-group-addon">　仓库　</div>
						      <s:textfield name="respoitoryName" cssClass="form-control" placeholder="Enter respoitory" />
						    </div>
						  </div>&nbsp;
						  <s:submit style="width:10%" type="submit" cssClass="btn btn-primary" value="Search"/>
					</form>
				</div>
			
			
			<div class="table1">
					<table class="table">
					<thead>
						<tr>
							<th>编号</th>
							<th>产品</th>
							<th>仓库</th>
							<th>货位</th>
							<th>件数</th>
							<th>备注</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="list" var="item">
							<tr>
								<td><s:property value="id" /></td>
								<td><s:property value="goods.name" />-
								<s:property value="goods.type" />-
								<s:property value="goods.level" /></td>
								<td><s:property value="respoitory" /></td>
								<td><s:property value="location" /></td>
								<td><s:property value="numbers" /></td>
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