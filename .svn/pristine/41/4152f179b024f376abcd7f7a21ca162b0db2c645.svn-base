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
					&nbsp;客户信息管理 > 客户信息 > 历史订单 
				</span>
				<a href="${ctx}/3CusManager/contact_add.action?cnbid=${customer.id}" >新建</a>
				<a href="#" >帮助</a>
				<a href="#" >返回</a>
			</div>
			<div class="col-md-10">
			
			</div>
			<div class="col-md-12">
				<div class="table1">
						<table class="table text-center">
							<tr>
								<td>
									<label class="control-label">订单编号</label>
								</td>
								<td>
     								${orderForm.orderNum}
     							</td>
     							<td>
									<label class="control-label">日期</label>
								</td>
								<td>
     								${orderForm.createDate}
     							</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">送货地址</label>
								</td>
								<td>
     								${orderForm.address}
								</td>
								<td>
									<label class="control-label">总金额（元）</label>
								</td>
								<td>
     								${orderForm.priceCount}
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">状态</label>
								</td>
								<td>
     								${orderForm.state}
								</td>
								<td>
								</td>
								<td>
								</td>
							</tr>
						</table>					
					</div>
			</div>
			<div class="col-md-12">
			<div class="table1">
					<table class="table">
					<thead>
						<tr>
							<th>商品</th>
							<th>数量</th>
							<th>单位</th>
							<th>单价（元）</th>
							<th>金额（元）</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="list" var="item">
							<tr>
								<td><s:property value="goods.name" /></td>
								<td><s:property value="count" /></td>
								<td><s:property value="goods.unit" /></td>
								<td><s:property value="goods.price" /></td>
								<td><s:property value="priceCount" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				</div>
			</div>
			</div>
		</div>
	
</body>
</html>