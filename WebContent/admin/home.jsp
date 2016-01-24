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
	
		<div class="mainc">
			<div class="navbar1">
				<span class="maincLabel">
					<i class="glyphicon glyphicon-export"></i>
					&nbsp上传
				</span>
				<a href="${ctx}/3CusManager/customer_input.action" >添加客户</a>
				<a href="#" >客户列表</a>
			</div>
			
			<div class="col-md-8">
				<div class="table1" style="margin-right:0px">
				haha
				</div>
			</div>
			<div class="col-md-4">
				<div class="table1" style="margin-left:0px">
				haha
				</div>
			</div>
		</div>
	
</body>
</html>