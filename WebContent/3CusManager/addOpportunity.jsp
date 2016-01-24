<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
		<title>Insert title here</title>
		<%@include file="/common/header.jsp"%>
		<%@include file="/common/meta.jsp"%>
			
		<link type="text/css" href="${ctx}/resources/jquery_ui/css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet">
		<script src="${ctx}/resources/jquery_ui/assets/js/jquery-1.9.0.min.js" type="text/javascript"></script>
		<script src="${ctx}/resources/jquery_ui/assets/js/bootstrap.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="${ctx}/resources/jquery_ui/assets/js/jquery-ui-1.10.0.custom.min.js"></script>
		
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
					销售机会管理
					
					<a href="${ctx}/3CusManager/opportunity_add.action" class="aactive">新建销售机会</a>
					<c:if test="${fn:contains(sessionScope.authority,'opportunity_list')}">
					<a href="${ctx}/3CusManager/opportunity_list.action">销售机会管理</a>
					</c:if>
				</span>
			</div>
			
			<s:if test="fieldErrors != null && fieldErrors.size > 0 || actionErrors != null && actionErrors.size > 0">
							<div class="alert alert-danger" style="font-size:15px;height:20px;line-height:0;width:60%;margin-left:3%">
								<s:fielderror />
								<s:actionerror />
							</div>
			</s:if>
			
			<form id="addForm" action="${ctx}/3CusManager/opportunity_save.action" class="form-horizontal" enctype="multipart/form-data" method="post">
				<div class="table1">
					<div class="tabLabCon">
							<a href="#" class="tableLabel">帮　助</a>
							<a href="opportunity_list" class="tableLabel">返回</a>
							<a href="javascript:formSubmit()" class="tableLabel">保存</a>
					</div>
					
					<table class="table text-center">
						<tr>
							<td>
								<label class="control-label">机会来源</label>
							</td>
							<td colspan="2">
    							<s:textfield type="text" name="source" cssClass="form-control"/>
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label">客户名称</label>
							</td>
							<td>
    							<s:textfield type="text" name="customerName" placeholder="必填" cssClass="form-control"/>
							</td>
							<td>
								<label class="control-label">成功几率</label>
							</td>

							<td style="width:400px;text-align:left">
									<input id="successRate" type="text" name="successRate" readonly
									    class="form-control" style="float:left;width:100px;"/>
									<div id="h-slider" style="width:250px;float:right;line-height:0;margin-top:14px"></div>
									<script type="text/javascript">
									$(function () {
										// Horizontal slider
										$("#h-slider").slider({
										    orientation: "horizontal",
										    range: "min",
										    min: 0,
										    max: 100,
										    value: 50,
										    slide: function (event, ui) {
										        $("#successRate").val(ui.value);
										    },
										});
										
										$("#successRate").val($("#h-slider").slider("value"));
									});
									</script>
							</td>
							
						</tr>
						<tr>
							<td>
								<label class="control-label">概要</label>
							</td>
							<td colspan="2">
    							<s:textfield type="text" name="summary" cssClass="form-control" placeholder="必填"/>
    						</td>
    						<td>
    						</td>
						</tr>
						<tr>
							<td>
								<label class="control-label">联系人</label>
							</td>
							<td>
    								<s:textfield type="text" name="contactName" cssClass="form-control"/>
							</td>
							<td>
								<label class="control-label">联系人电话</label>
							</td>
							<td>
    								<s:textfield type="text" name="contactPhone" cssClass="form-control"/>
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label">机会描述</label>
							</td>
							<td colspan="2">
    								<textarea class="form-control" name="description" rows="3" wrap="virtual"></textarea>
    						</td>
						</tr>
						<tr>
							<td>
								<label class="control-label">创建人</label>
							</td>
							<td>
								<s:hidden name="userId"  value="%{#session.currentUser.id}"/>
								<s:textfield name="username" cssClass="form-control" id="contactPhone" value="%{#session.currentUser.name}"/>
								<%-- <s:select list="users" cssClass="form-control" name="userId" listValue="name" listKey="id"></s:select> --%>
							</td>
							<td>
								<label class="control-label">创建时间</label>
							</td>
							<td>
								<% String datetime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()); //获取系统时间 %>
    							<input type="text" name="createTime" class="form-control" value="<%=datetime%>" readonly>
							</td>
						</tr>
					</table>
				</div>
				<div class="table1">
					<table class="table text-center">
						<tr>
							<td>
								<label class="control-label">指派给</label>
							</td>
							<td>
								<select class="form-control" disabled>
    								<option value="" disabled selected>请选择...</option>
    							</select>
							</td>
							<td>
								<label class="control-label">指派时间</label>
							</td>
							<td>
    							<input type="text" name="assignTime" class="form-control" disabled>
							</td>
						</tr>
					</table>					
				</div>
				
				<div class="col-sm-offset-5 col-sm-8">
				</div>
			</form>
		</div>
	
</body>
</html>