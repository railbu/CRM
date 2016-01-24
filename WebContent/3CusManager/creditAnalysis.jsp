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
						  <div class="form-group" style="width:60%">
						    <div class="input-group">
						      <label style="font-size:20px;bold:true">　报表方式　</label>
						      <input id="iCheck" type="radio" value="1" name="check">
						      <label>　按等级　　</label>
							  <input id="iCheck" type="radio" value="2" name="check" checked>
							  <label>　按信用度　　</label>
							  <input id="iCheck" type="radio" value="3" name="check">
							  <label>　按满意度　　</label>
						      <%-- <s:select list="ranks" cssClass="form-control" name="rank" listValue="title"/> --%>
						    </div>
						  </div>&nbsp;&nbsp;&nbsp;
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
									<th style="text-align:center">客户信用度</th>
									<th style="text-align:center">客户数量</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="list" id="l" var="item">
									<tr>
										<td><span style="background-color:<s:property value="#item[1]"/>;width:100%;vertical-align:-moz-middle-with-baseline">　　　</span></td>
										<td><div id="QuacorGrading<s:property value="#item[0]" />">
											<input name="1" type="button"/>
											<input name="2" type="button"/>
											<input name="3" type="button"/>
											<input name="4" type="button"/>
											<input name="5" type="button"/>
										</div></td>
										<td style="vertical-align:middle"><s:property value="#item[2]" /></td>
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
	for(var i=1;i<6;i++){
		var GradList = document.getElementById("QuacorGrading"+i).getElementsByTagName("input");
		for(var di=0;di<i;di++){
			GradList[di].style.backgroundPosition = 'left center';
		}
	}
	
	var pieData = [
					{
						value: <s:property value="ss[0]" />,
						color:"<s:property value="color[0]" />",
						highlight: "<s:property value="highlight[0]" />",
						label: "一颗星"
					},
					{
						value: <s:property value="ss[1]" />,
						color:"<s:property value="color[1]" />",
						highlight: "<s:property value="highlight[1]" />",
						label: "二颗星"
					},
					{
						value: <s:property value="ss[2]" />,
						color:"<s:property value="color[2]" />",
						highlight: "<s:property value="highlight[2]" />",
						label: "三颗星"
					},
					{
						value: <s:property value="ss[3]" />,
						color:"<s:property value="color[3]" />",
						highlight: "<s:property value="highlight[3]" />",
						label: "四颗星"
					},
					{
						value: <s:property value="ss[4]" />,
						color:"<s:property value="color[4]" />",
						highlight: "<s:property value="highlight[4]" />",
						label: "五颗星"
					}

				];

				window.onload = function(){
					var ctx = document.getElementById("chart-area").getContext("2d");
					window.myPie = new Chart(ctx).Pie(pieData);
				};

	</script>
	
</body>
</html>