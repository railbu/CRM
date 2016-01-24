<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
		<title>Insert title here</title>
		<%@include file="/common/header.jsp"%>
		<%@include file="/common/meta.jsp"%>
		
		<script type="text/javascript">
			function formSubmit(){
				$("#addForm").submit();
			}
		</script>
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
					&nbsp;服务管理
				</span>
				<c:if test="${fn:contains(sessionScope.authority,'service_addItem')}">
				<a href="#" class="aactive">添加服务</a>
				</c:if>
				<c:if test="${fn:contains(sessionScope.authority,'service_listItem')}">
				<a href="service_listItem.action" >服务列表</a>
				</c:if>
				
			</div>
		
			<div class="col-md-12">
				<form id="addForm" action="${ctx}/3CusManager/service_save.action" class="form-horizontal" enctype="multipart/form-data" method="post">
					<div class="table1" style="padding-top:0px">
						<div class="tabLabCon">
							<a href="#" class="tableLabel">帮　助</a>
							<a href="#" class="tableLabel">返回</a>
							<a href="javascript:formSubmit();" class="tableLabel">保存</a>
						</div>
						<table class="table text-center">
							<tr>
								<td>
									<label class="control-label">概要</label>
								</td>
								<td>
									<s:select list="services" cssClass="form-control" name="serviceId" listValue="summary" listKey="id"></s:select>
								</td>
								<td>
									<a href="service_addItem.action" class="btn btn-primary">新创建</a>
								</td>	
							</tr>
							<tr>
								
								<td>
									<label class="control-label">状态</label>
								</td>
								<td>
									<s:textfield name="state" cssClass="form-control" value="新创建" readonly="true"></s:textfield>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">客户</label>
								</td>
								<td>
									<s:select list="customers" cssClass="form-control" name="customerId" listValue="name" listKey="id"></s:select>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">服务请求</label>
								</td>
								<td>
									<s:textarea name="serviceRequest" cssClass="form-control"></s:textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">创建人</label>
								</td>
								<td>
									<s:textfield cssClass="form-control" name="cp"
										value="%{#session.currentUser.name}" class="form-control" readonly="true"></s:textfield>
								<%-- 	<label class="control-label"><s:property value="#session.currentUser.name"/></label> --%>
								</td>
								<td>
									<label class="control-label">创建时间</label>
								</td>
								<td>
	    							<s:textfield cssClass="form-control" name="currentTime" class="form-control" readonly="true"></s:textfield>
								</td>
							</tr>
						</table>
						
					</div>
				</form>
			</div>
		</div>

</body>
</html>