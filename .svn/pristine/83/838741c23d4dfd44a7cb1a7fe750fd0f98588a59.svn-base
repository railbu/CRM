<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
		<title>Insert title here</title>
		<%@include file="/common/header.jsp"%>
		<%@include file="/common/meta.jsp"%>
		<script src="${ctx}/resources/js/Chart.js"></script>

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
					<form action="${ctx}/3CusManager/analysize_contributsearch.action" class="form-inline" enctype="multipart/form-data" method="post">
						  <div class="form-group" style="width:35%">
						    <div class="input-group">
						      <div class="input-group-addon">　客户名称　</div>
						      <s:select list="cslist" cssClass="form-control" name="customerId" listValue="name" listKey="id" headerKey="0" headerValue="全部" value="%{customerId}"></s:select>
						    </div>
						  </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <div class="form-group" style="width:17%">
						    <div class="input-group">
						      <div class="input-group-addon">　年份　</div>
						      <s:select list="#{2014:'2014',2013:'2013',2012:'2012',2011:'2011',2010:'2010',2009:'2009'}" value="%{year}" cssClass="form-control" name="year" listKey="key" listValue="value"  headerKey="全部" headerValue="全部" />   
						    </div>
						  </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <s:submit style="width:9%" cssClass="btn btn-primary" value="查询" />
					</form>
				</div>
				
				<div class="table1" style="padding:20px 35px 5px;">
					
					<div id="canvas-holder" style="width:45%;float:left">
						<canvas id="canvas" width="700" height="650"></canvas>
					</div>
					
					<div  style="width:50%;float:right">
						<table class="table text-center">
							<thead>
								<tr>
									<th style="text-align:center">年份</th>
									<th style="text-align:center">客户名称</th>
									<th style="text-align:center">年订单总额（元）</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="list" var="item">
									<tr>
										<td><s:property value="#item[0]" /></td>
										<td><s:property value="#item[1]"/></td>
										<td><s:property value="#item[2]" /></td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
					<div style="clear:both">
					</div>
				</div>

			</div>
			</div>
			
	<script type="text/javascript">
	var randomScalingFactor = function(){ return Math.round( Math.random()*100 ); };
	var lineChartData = {
		labels : ["<s:property value="s[0]" />年",
		          "<s:property value="s[1]" />年",
		          "<s:property value="s[2]" />年",
		          "<s:property value="s[3]" />年",
		          "<s:property value="s[4]" />年",
		          "<s:property value="s[5]" />年"],
		datasets : [
					{
						label: "Customer's dataset",
						fillColor : "rgba(151,187,205,0.2)",
						strokeColor : "rgba(151,187,205,1)",
						pointColor : "rgba(151,187,205,1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(151,187,205,1)",
						data : [<s:property value="priceCount[0]"/>,
						        <s:property value="priceCount[1]"/>,
						        <s:property value="priceCount[2]"/>,
						        <s:property value="priceCount[3]"/>,
						        <s:property value="priceCount[4]"/>,
						        <s:property value="priceCount[5]"/>]
					}
				]
		
			};

			window.onload = function(){
				var ctx = document.getElementById("canvas").getContext("2d");
				window.myLine = new Chart(ctx).Line(lineChartData, {
					responsive: true
				});
			};

	</script>
	
</body>
</html>