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
					&nbsp;服务处理
				</span>
				<a href="service_add.action">添加服务</a>
				<a href="#" class="aactive">服务列表</a>
			</div>
			
			<div class="col-md-12">
			<div class="table1" style="padding-bottom:15px">
				 	<form action="service_fbList" method="get">
						<div class="form-inline">
				 		  <div class="form-group" style="width:29%">
						    <div class="input-group">
						      <div class="input-group-addon">　客户　</div>
						      <s:textfield name="scusName" cssClass="form-control" placeholder="Enter name" />
						    </div>
						  </div>&nbsp;&nbsp;&nbsp;
						  <div class="form-group" style="width:29%">
						    <div class="input-group">
						      <div class="input-group-addon">　概要　</div>
						      <s:textfield name="ssum" cssClass="form-control" placeholder="Enter name" />
						    </div>
						  </div>&nbsp;&nbsp;&nbsp;
						  <div class="form-group" style="width:29%">
						    <div class="input-group">
						      <div class="input-group-addon">　服务类型　</div>
						      <s:textfield name="stype" cssClass="form-control" placeholder="Enter name" />
						    </div>
						  </div>&nbsp;&nbsp;&nbsp;
						</div>  
						
						<br>
						<div class="form-inline">
						 <div class="form-group" style="width:29%">
						    <div class="input-group">
						      <div class="input-group-addon">创建日期</div>
						      <s:hidden id="stv" value="%{st}"/>
						      <input name="st" id="st" size="16" type="text" value="2014-01-01 00:01" readonly 
										class="form_datetime"
										style="width:100%;height:100%">
									<script type="text/javascript">
								    	$(".form_datetime").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
								    </script>
								    <script type="text/javascript">
								    	var stv = document.getElementById("stv").value;
								    	var st = document.getElementById("st");
								    	if(stv != "")
								    		st.value = stv;
								    </script>
						    </div>
						  </div>&nbsp;&nbsp;&nbsp;
						  
						   <div class="form-group" style="width:29%">
						    <div class="input-group">
						      <div class="input-group-addon"> 至   </div>
						      <s:hidden id="etv" value="%{et}"/>
									<input name="et" id="et" size="16" type="text" value="2050-01-01 00:01" readonly 
										class="form_datetime2" style="width:100%;height:100%">
								    <script type="text/javascript">
								    	$(".form_datetime2").datetimepicker({format: 'yyyy-mm-dd hh:ii'});
								    </script>
								    <script type="text/javascript">
								    	var etv = document.getElementById("etv").value;
								    	var et = document.getElementById("et");
								    	if(etv != "")
								    		et.value = etv;
								    </script>
						    </div>
						  </div>&nbsp;&nbsp;&nbsp;
						  <s:submit value="search" cssClass="btn btn-primary"/>
						</div>
					</form>
				</div>
			
			
				<div class="table1">
					<div class="tableContent">
					<table class="table">
						<thead>
							<tr>
								<th>编号</th>
								<th>客户</th>
								<th>概要</th>
								<th>服务类型</th>
								<th>创建人</th>
								<th>创建日期</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="cslist" var="item" status="st">
								<tr>
									<td><s:property value="id" /></td>
									<td><s:property value="customer.name" /></td>
									<td><s:property value="serviceItem.summary" /></td>
									<td><s:property value="serviceItem.type" /></td>
									<td><s:property value="createPerson.name" /></td>
									<td><s:property value="formatTime(createTime)" /></td>
									
									<td>
										<s:url value="/3CusManager/service_fbMI" id="feedback">
											<s:param name="cnmid" value="id" />
										</s:url> 
										<s:a href="%{feedback}" cssClass="button button-flat-primary button-tiny" style="height:32px">反馈</s:a> 
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					</div>
					<s:set name="curPage" value="%{currentPage}"/>
				
					<div class="pageSelect">
						<ul class="pagination">
						
							<s:url value="/3CusManager/customer_list" id="lpage">
								 	<s:param name="currentPage" value="lastPage"/>
								 	<s:param name="scusName" value="scusName"/>
								 	<s:param name="ssum" value="ssum"/>
								 	<s:param name="stype" value="stype"/>
								 	<s:param name="st" value="st"/>
								 	<s:param name="et" value="et"/>
								 </s:url>
							<li ><s:a href="%{lpage}">&laquo;</s:a></li>
							
							<s:iterator value="pages" var="item">
								 <s:url value="/3CusManager/customer_list" id="page">
								 	<s:param name="currentPage" value="#item"/>
								 	<s:param name="scusName" value="scusName"/>
								 	<s:param name="ssum" value="ssum"/>
								 	<s:param name="stype" value="stype"/>
								 	<s:param name="st" value="st"/>
								 	<s:param name="et" value="et"/>
								 </s:url>
								 <s:if test="#curPage == #item">
								 	<li class="active"><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:if>
								 <s:else>
								 	<li ><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:else>
							</s:iterator>
							
							<s:url value="/3CusManager/customer_list" id="rpage">
								 	<s:param name="currentPage" value="nextPage"/>
								 	<s:param name="scusName" value="scusName"/>
								 	<s:param name="ssum" value="ssum"/>
								 	<s:param name="stype" value="stype"/>
								 	<s:param name="st" value="st"/>
								 	<s:param name="et" value="et"/>
								 </s:url>
							<li ><s:a href="%{rpage}">&raquo;</s:a></li>
						</ul>
					</div>
				</div>
			</div>
			</div>
		</div>

</body>
</html>