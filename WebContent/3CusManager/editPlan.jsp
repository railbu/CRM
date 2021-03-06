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
					客户开发计划
					<a href="#" class="aactive">执行计划</a>
					<a href="${ctx}/3CusManager/plan_optlist.action">客户开发机会管理</a>
				</span>
			</div>
			
				
				<div class="table1">
					<div class="tabLabCon">
							<a href="#" class="tableLabel">帮　助</a>
							<s:url value="/3CusManager/plan_success" id="success">
								<s:param name="optid" value="%{optid}"/>
							</s:url> 
							<s:a href="%{success}" cssClass="tableLabel">开发成功</s:a>
							<s:url value="/3CusManager/plan_fail" id="fail">
								<s:param name="optid" value="%{optid}"/>
							</s:url> 
							<s:a href="%{fail}" cssClass="tableLabel">终止开发</s:a>
							<s:url value="/3CusManager/plan_list" id="list">
								<s:param name="optid" value="%{optid}"/>
							</s:url> 
							<s:a href="%{list}" cssClass="tableLabel">返回</s:a>
					</div>
					<s:if test="fieldErrors != null && fieldErrors.size > 0 || actionErrors != null && actionErrors.size > 0">
							<div class="alert alert-danger" style="font-size:15px;height:20px;line-height:0;width:60%;margin-left:3%">
								<s:fielderror />
								<s:actionerror />
							</div>
					</s:if>
					
					<s:if test="resTip != null">
						<div class="alert alert-success">
							<s:property value="resTip"/>
						</div>
					</s:if>
					
					<table class="table">
						<tr>
							<td>
								<label class="control-label">编号</label>
							</td>
							<td>
								<s:property value="%{planopt.id}" />
							</td>
							<td>
								<label class="control-label">机会来源</label>
							</td>
							<td>
								<s:property value="%{planopt.source}" />
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label">客户名称</label>
							</td>
							<td>
								<s:property value="%{planopt.customerName}" />
							</td>
							<td>
								<label class="control-label">成功几率(%)</label>
							</td>
							<td>
								<s:property value="%{planopt.successRate}" />
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label">概要</label>
							</td>
							<td colspan="3">
								<s:property value="%{planopt.summary}" />
    						</td>
						</tr>
						<tr>
							<td>
								<label class="control-label">联系人</label>
							</td>
							<td>
								<s:property value="%{planopt.contactName}" />
							</td>
							<td>
								<label class="control-label">联系人电话</label>
							</td>
							<td>
								<s:property value="%{planopt.contactPhone}" />
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label">机会描述</label>
							</td>
							<td colspan="3">
								<s:property value="%{planopt.description}" />
    						</td>
						</tr>
						<tr>
							<td>
								<label class="control-label">创建人</label>
							</td>
							<td>
								<s:property value="%{planopt.createPerson.name}" />
							</td>
							<td>
								<label class="control-label">创建时间</label>
							</td>
							<td>
							<s:date name="planopt.createTime" format="yyyy-MM-dd HH:mm:ss" />
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label">指派给</label>
							</td>
							<td>
								<s:property value="%{planopt.assignPerson.name}" />
							</td>
							<td>
								<label class="control-label">指派时间</label>
							</td>
							<td>
								<s:date name="planopt.assignTime" format="yyyy-MM-dd HH:mm:ss" />
							</td>
						</tr>
					</table>
				</div>
				
				<div class="table1">
					<table class="table">
						<thead>
							<tr>
								<th>日期</th>
								<th>计划项</th>
								<th>执行效果</th>
							</tr>
						</thead>
						<tbody>
						<s:iterator value="planlist" var="item">
						<form action="${ctx}/3CusManager/plan_make.action" class="form-horizontal" enctype="multipart/form-data" method="post">
						<s:hidden name="id" value="%{#item.id}"/>
						<s:hidden name="optid" value="%{optid}"/>
							<tr>
								<td>
								<s:textfield name="createTime" cssClass="form-control" id="createTime" readonly="true">
									<s:param name="value"><s:date name="createTime" format="yyyy年MM月dd日" /></s:param>
								</s:textfield>
								</td>
								<td>
									<s:textfield name="content" cssClass="form-control" id="content" value="%{#item.content}" readonly="true"/>
								</td>
								<td>
									<s:textfield name="result" cssClass="form-control" id="content" value="%{#item.result}"/>
								</td>
								<td>
								    <s:submit cssClass="btn btn-primary" value="保存"/>
								</td>
							</tr>
						</form>
						</s:iterator>
						</tbody>
					</table>		
				</div>
			</div>
</body>
</html>