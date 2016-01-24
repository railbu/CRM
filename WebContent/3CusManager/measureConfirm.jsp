<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Insert title here</title>
<%@include file="/common/header.jsp"%>
<%@include file="/common/meta.jsp"%>
	
	<script type="text/javascript">

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
			<span class="maincLabel"> <i
				class="glyphicon glyphicon-export"></i> &nbsp;客户流失管理 > 确认流失
			</span> <a href="${ctx}/3CusManager/measure_list.action">返回</a> <a href="${ctx}/3CusManager/measure_edit?cnbid=${customer.id}">暂缓流失</a> <a href="#">保存</a>
		</div>
		<s:if
			test="fieldErrors != null && fieldErrors.size > 0 || actionErrors != null && actionErrors.size > 0">
			<div class="alert alert-danger"
				style="font-size: 15px; height: 20px; line-height: 0; width: 60%; margin-left: 3%">
				<s:fielderror />
				<s:actionerror />
			</div>
		</s:if>
		<div class="col-md-12">
			<form action="${ctx}/3CusManager/measure_confirmMeasure.action" method="post" class="form-horizontal">
				<div class="table1">
					<table class="table text-center">
						<tr>
							<td class="tdlabel"><label class="control-label">编号</label></td>
							<td><s:property value="customer.id" /></td>
							<td class="tdlabel"><label class="control-label">客户</label></td>
							<td style="text-align:left">
								<s:property value="customer.name" />
							</td>
						</tr>
						<tr>
							<td><label class="control-label">客户经理</label></td>
							<td style="text-align:left"><s:property value="customer.users.name" /></td>
							<td><label class="control-label">上次下单时间</label></td>
							<td style="text-align:left"><s:property value="customer.lastShoppingTime" /></td>
						</tr>
						<tr>
							<td >暂缓措施</td>
							<td colspan=3 style="text-align:left;padding-left:15px">
								<s:iterator value="measurelist" var="item">
									<s:property value="content"/> <br/>
								</s:iterator>
							</td>
						</tr>
						<tr>
							<td>流失原因</td>
							<td colspan=3><s:textarea style="width:835px;height:190px" cssClass="form-control" name="reasonOfLost"><s:property value="customer.reasonOfLost" /></s:textarea></td>
						</tr>
					</table>
				</div>
				<input type="hidden" name="cnbid" value="${customer.id}" />
				<input type="submit" value="保存" class="btn btn-primary"/>
			</form>
		</div>

	</div>

</body>
</html>