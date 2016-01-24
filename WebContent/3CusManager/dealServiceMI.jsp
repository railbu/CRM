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
					&nbsp;服务处理
				</span>
				<a href="#" class="aactive">添加服务</a>
				<a href="service_listItem.action" >服务列表</a>
			</div>
		
			<div class="col-md-12">
				<form id="addForm" action="${ctx}/3CusManager/service_saveDealMI.action" class="form-horizontal" enctype="multipart/form-data" method="post">
					<s:hidden name="cnmid" value="%{cnmid}"/>
					<div class="table1" style="padding-top:0px">
						<div class="tabLabCon">
							<a href="#" class="tableLabel">帮　助</a>
							<a href="service_dealList" class="tableLabel">返回</a>
							<a href="javascript:formSubmit()" class="tableLabel">保存</a>
						</div>
						
						<table class="table text-center">
							<tr>
								<td class="tdMI">
									<label class="control-label">编号</label>
								</td>
								<td>
									<s:textfield value="%{cs.id}" cssClass="form-control" readonly="true"/>
								</td>
								
								<td>
									<label class="control-label">服务类型</label>
								</td>
								<td>
									<s:textfield value="%{cs.serviceItem.type}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<label class="control-label">概要</label>
								</td>
								<td>
									<s:textfield value="%{cs.serviceItem.summary}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<label class="control-label">客户</label>
								</td>
								<td>
									<s:textfield value="%{cs.customer.name}" cssClass="form-control" readonly="true"/>
								</td>
								<td>
									<label class="control-label">状态</label>
								</td>
								<td>
									<s:textfield value="%{cs.serviceItem.assignState}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">服务请求</label>
								</td>
								<td>
									<s:textfield value="%{cs.serviceRequest}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">创建人</label>
								</td>
								<td>
									<s:textfield value="%{cs.createPerson.name}" cssClass="form-control" readonly="true"/>
								</td>
								<td>
									<label class="control-label">创建时间</label>
								</td>
								<td>
									<s:textfield value="%{cs.createTime}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
						</table>
					</div>
					<div class="table1" style="padding-top:0px">	
						<table class="table text-center">
							<tr>
								<td >
									<label class="control-label">分配给</label>
								</td>
								<td>
									<s:textfield value="%{cs.serviceItem.assignedPerson.name}" cssClass="form-control" readonly="true"/>
								</td>
								<td>
									<label class="control-label">分配时间</label>
								</td>
								<td>
									<s:textfield value="%{formatTime(cs.serviceItem.assignTime)}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
						</table>
						
					</div>
					
					<div class="table1" style="padding-top:0px">
						<table class="table text-center">
							<tr>
								<td>
									<label class="control-label">服务处理</label>
								</td>
								<td>
									<s:textarea cssClass="form-control" name="serviceDeals" 
									     value="%{cs.serviceDeal}"></s:textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">处理人</label>
								</td>
								<td>
									<s:textfield value="%{#session.currentUser.name}" cssClass="form-control" readonly="true"/>
								</td>
								<td>
									<label class="control-label">处理时间</label>
								</td>
								<td>
									<s:textfield value="%{currentTime}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
						</table>
					</div>
					
				</form>
			</div>
		</div>

</body>
</html>