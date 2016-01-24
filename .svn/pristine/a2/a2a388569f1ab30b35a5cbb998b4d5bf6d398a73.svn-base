<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
		<title>Insert title here</title>
		<%@include file="/common/header.jsp"%>
		<%@include file="/common/meta.jsp"%>
		<script src="${ctx}/resources/js/Chart.js"></script>
		<link href="${ctx}/resources/bootstrap/css/blue.css" rel="stylesheet">
		<script src="${ctx}/resources/bootstrap/js/zepto.js"></script>
		<script src="${ctx}/resources/bootstrap/js/icheck.js"></script>

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
					<form action="${ctx}/3CusManager/analysize_constlist.action" class="form-inline" enctype="multipart/form-data" method="post">
						  <div class="form-group" style="width:20%">
						    <div class="input-group">
						      <div class="input-group-addon">　年份　</div>
						      <select id="content" name="select" class="form-control">
								  <option value="Yahoo! U.S">全部</option>
								  <option value="UK.">2014</option>
								  <option value="FFF.">2013</option>
							      <option value="EEE.">2012</option>
							      <option value="EEE.">2011</option>
						      </select>
						    </div>
						  </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <s:submit style="width:10%" cssClass="btn btn-primary" value="Search" />
					</form>
				</div>
				
				<div class="table1" style="padding:35px 35px 35px;">
					
					<div id="canvas-holder" style="width:33%;float:left">
						<canvas id="chart-area" width="320" height="320"></canvas>
					</div>
					
					<div  style="width:58%;float:right">
						<table class="table text-center">
							<thead>
								<tr>
									<th style="text-align:center">颜色</th>
									<th style="text-align:center">条目</th>
									<th style="text-align:center">服务数量</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="list" id="l" var="item">
									<tr>
										<td><span style= " background-color:<s:property value="#item[1]"/> ;width:100%">　　　</span></td>
										<td><s:property value="#item[0]" /></td>
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

		var polarData = [
		    				{
		    					value: <s:property value="ss[0]" />,
		    					color: "#FFFF66",
		    					highlight: "#FFFF00",
		    					label: "<s:property value="types[0].title" />"
		    				},
		    				{
		    					value: <s:property value="ss[1]" />,
		    					color: "#00CCFF",
		    					highlight: "#0066FF",
		    					label: "<s:property value="types[1].title" />"
		    				},
		    				{
		    					value: <s:property value="ss[2]" />,
		    					color:"#FF0066",
		    					highlight: "#FF0000",
		    					label: "<s:property value="types[2].title" />"
		    				},
	
			];
	
		window.onload = function(){
			var ctx = document.getElementById("chart-area").getContext("2d");
			window.myPolarArea = new Chart(ctx).PolarArea(polarData, {
				responsive:true
			});
		};


	</script>
	
</body>
</html>