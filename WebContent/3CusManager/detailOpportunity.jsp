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
					&nbsp销售机会管理
					<a href="#" class="aactive" class="aactive">销售机会详情</a>
					<a href="${ctx}/3CusManager/opportunity_add.action" >新建销售机会</a>
					<a href="${ctx}/3CusManager/opportunity_list.action">销售机会管理</a>
				</span>
			</div>
			
			
				<s:hidden name="id" value="%{optid}"/>
				<div class="table1">
					<table class="table">
						<tr>
							<td class="tdlabel">
								<label class="control-label">编号</label>
							</td>
							<td>
								<s:property value="%{opportunity.id}" />
							</td>
							<td class="tdlabel">
								<label class="control-label">机会来源</label>
							</td>
							<td>
								<s:property value="%{opportunity.source}" />
							</td>
						</tr>
						<tr>
							<td class="tdlabel">
								<label class="control-label">客户名称</label>
							</td>
							<td>
								<s:property value="%{opportunity.customerName}" />
							</td>
							<td class="tdlabel">
								<label class="control-label">成功几率</label>
							</td>
							<td>
								<s:property value="%{opportunity.successRate}" />
							</td>
						</tr>
						<tr>
							<td class="tdlabel">
								<label class="control-label">概要</label>
							</td>
							<td colspan="3">
								<s:property value="%{opportunity.summary}" />
    						</td>
						</tr>
						<tr>
							<td class="tdlabel">
								<label class="control-label">联系人</label>
							</td>
							<td>
								<s:property value="%{opportunity.contactName}" />
							</td>
							<td class="tdlabel">
								<label class="control-label">联系人电话</label>
							</td>
							<td>
								<s:property value="%{opportunity.contactPhone}" />
							</td>
						</tr>
						<tr>
							<td class="tdlabel">
								<label class="control-label">机会描述</label>
							</td>
							<td colspan="3">
								<s:property value="%{opportunity.description}" />
    						</td>
						</tr>
						<tr>
							<td class="tdlabel">
								<label class="control-label">创建人</label>
							</td>
							<td>
								<s:property value="%{opportunity.createPerson.name}" />
							</td>
							<td class="tdlabel">
								<label class="control-label">创建时间</label>
							</td>
							<td>
							<s:date name="opportunity.createTime" format="yyyy-MM-dd HH:mm:ss" />
							</td>
						</tr>
					</table>
				</div>
				<div class="table1">
					<table class="table">
						<tr>
							<td class="tdlabel">
								<label class="control-label">指派给</label>
							</td>
							<td>
								<s:property value="%{opportunity.assignPerson.name}" />
							</td>
							<td class="tdlabel">
								<label class="control-label">指派时间</label>
							</td>
							<td>
								<s:date name="opportunity.assignTime" format="yyyy-MM-dd HH:mm:ss" />
							</td>
						</tr>
					</table>					
				</div>
			</div>
</body>
</html>