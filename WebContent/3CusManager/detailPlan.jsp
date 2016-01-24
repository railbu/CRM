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
					<a href="#" class="aactive">计划详情</a>
					<a href="${ctx}/3CusManager/plan_optlist.action">客户开发机会管理</a>
				</span>
			</div>
				<div class="table1">
					<table class="table">
						<tr>
							<td class="tdlabel">
								<label class="control-label">编号</label>
							</td>
							<td>
								<s:property value="%{planopt.id}" />
							</td>
							<td class="tdlabel">
								<label class="control-label">机会来源</label>
							</td>
							<td>
								<s:property value="%{planopt.source}" />
							</td>
						</tr>
						<tr>
							<td class="tdlabel">
								<label class="control-label">客户名称</label>
							</td>
							<td>
								<s:property value="%{planopt.customerName}" />
							</td>
							<td class="tdlabel">
								<label class="control-label">成功几率(%)</label>
							</td>
							<td>
								<s:property value="%{planopt.successRate}" />
							</td>
						</tr>
						<tr>
							<td class="tdlabel">
								<label class="control-label">概要</label>
							</td>
							<td colspan="3">
								<s:property value="%{planopt.summary}" />
    						</td>
						</tr>
						<tr>
							<td class="tdlabel">
								<label class="control-label">联系人</label>
							</td>
							<td>
								<s:property value="%{planopt.contactName}" />
							</td>
							<td class="tdlabel">
								<label class="control-label">联系人电话</label>
							</td>
							<td>
								<s:property value="%{planopt.contactPhone}" />
							</td>
						</tr>
						<tr>
							<td class="tdlabel">
								<label class="control-label">机会描述</label>
							</td>
							<td colspan="3">
								<s:property value="%{planopt.description}" />
    						</td>
						</tr>
						<tr>
							<td class="tdlabel">
								<label class="control-label">创建人</label>
							</td>
							<td>
								<s:property value="%{planopt.createPerson.name}" />
							</td>
							<td class="tdlabel">
								<label class="control-label">创建时间</label>
							</td>
							<td>
							<s:date name="planopt.createTime" format="yyyy-MM-dd HH:mm:ss" />
							</td>
						</tr>
						<tr>
							<td class="tdlabel">
								<label class="control-label">指派给</label>
							</td>
							<td>
								<s:property value="%{planopt.assignPerson.name}" />
							</td>
							<td class="tdlabel">
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
						<s:hidden name="id" value="%{#item.id}"/>
						<s:hidden name="optid" value="%{optid}"/>
							<tr>
								<td>
									<s:date name="createTime" format="yyyy年MM月dd日" />
								</td>
								<td>
									<s:property value="content"/>
								</td>
								<td>
									<s:property value="result"/>
								</td>
							</tr>
						</s:iterator>
						</tbody>
					</table>		
				</div>
			</div>
</body>
</html>