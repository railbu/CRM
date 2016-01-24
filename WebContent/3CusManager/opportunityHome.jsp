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
				</span>
				<c:if test="${fn:contains(sessionScope.authority,'opportunity_add')}">
				<a href="${ctx}/3CusManager/opportunity_add.action" >新建销售机会</a>
				</c:if>
				<c:if test="${fn:contains(sessionScope.authority,'opportunity_list')}">
				<a href="${ctx}/3CusManager/opportunity_list.action" class="aactive">销售机会管理</a>
				</c:if>
			</div>
		<s:if test="fieldErrors != null && fieldErrors.size > 0 || actionErrors != null && actionErrors.size > 0">
							<div class="alert alert-danger" style="font-size:15px;height:20px;line-height:0;width:60%;margin-left:3%">
								<s:fielderror />
								<s:actionerror />
							</div>
		</s:if>
		<div class="col-md-12">
			<form action="${ctx}/3CusManager/opportunity_list.action" class="form-horizontal" enctype="multipart/form-data" method="post">
				<div class="table1">
					<table class="table">
						<tr>
							<td style="border-top: 0px">
								<label class="control-label">客户名称</label>
							</td>
							<td style="border-top: 0px">
    							<s:textfield type="text" name="cusName" cssClass="form-control"/>
							</td>
							<td style="border-top: 0px">
								<label class="control-label">概要</label>
							</td>
							<td style="border-top: 0px">
    							<s:textfield type="text" name="sum" cssClass="form-control"/>
							</td>
							<td style="border-top: 0px">
								<label class="control-label">联系人</label>
							</td>
							<td style="border-top: 0px">
    							<s:textfield type="text" name="contName" cssClass="form-control"/>
							</td>
							<td style="border-top: 0px"><s:submit cssClass="btn btn-primary" value="搜索"></s:submit></td>
						</tr>
					</table>
				</div>
			</form>
			</div>
			<div class="col-md-12">
				<div class="table1">
					<table class="table">
					<thead>
						<tr>
							<th>编号</th>
							<th>客户名称</th>
							<th>概要</th>
							<th>联系人</th>
							<th>联系人电话</th>
							<th>创建时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="optlist" var="item">
							<s:if test="#item.successRate > 80">
								<tr class="success">
							</s:if>
							<s:elseif test="#item.successRate < 30 && #item.successRate != 0">
								<tr class="danger">
							</s:elseif>
							<s:else>
								<tr>
							</s:else>
							<!-- <tr > -->
								<td><s:property value="id" /></td>
								<td><s:property value="customerName" /></td>
								<td><s:property value="summary" /></td>
								<td><s:property value="contactName" /></td>
								<td><s:property value="contactPhone" /></td>
								<td><s:date name="createTime" format="yyyy-MM-dd HH:mm:ss" /></td>
								<td><s:property value="assignState" /></td>
								<td>
									<s:url value="/3CusManager/opportunity_moreinfo" id="moreinfo">
										<s:param name="optid" value="id" />
									</s:url> 
									<s:a href="%{moreinfo}" cssClass="button button-flat-primary button-tiny" style="height:32px">详情</s:a>
								
									<s:if test="#item.assignState=='未分配'">
									
									<c:if test="${fn:contains(sessionScope.authority,'opportunity_assign')}">
									<s:url value="/3CusManager/opportunity_assign" id="assign">
										<s:param name="optid" value="id" />
									</s:url> 
									<s:a href="%{assign}" cssClass="button button-flat-primary button-tiny" style="height:32px">指派</s:a>
									</c:if>
									
									<c:if test="${fn:contains(sessionScope.authority,'opportunity_edit')}">
									<s:url value="/3CusManager/opportunity_edit" id="edit">
										<s:param name="optid" value="id" />
									</s:url> 
									<s:a href="%{edit}" cssClass="button button-flat-primary button-tiny" style="height:32px">编辑</s:a>
									</c:if>
								
									<s:url value="/3CusManager/opportunity_delete" id="delete">
										<s:param name="optid" value="id" />
									</s:url> 
									<s:a href="%{delete}" cssClass="button button-flat-primary button-tiny" style="height:32px">删除</s:a>
									</s:if> 
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				
				<s:set name="curPage" value="%{currentPage}"/>
				
					<div class="pageSelect">
						<ul class="pagination">
						
							<s:url value="/3CusManager/opportunity_list" id="lpage">
								 	<s:param name="currentPage" value="lastPage"/>
								 	<s:param name="cusName" value="cusName"/>
								 	<s:param name="sum" value="sum"/>
								 	<s:param name="contName" value="contName"/>
								 </s:url>
							<li ><s:a href="%{lpage}">&laquo;</s:a></li>
							
							<s:iterator value="pages" var="item">
								 <s:url value="/3CusManager/opportunity_list" id="page">
								 	<s:param name="currentPage" value="#item"/>
								 	<s:param name="cusName" value="cusName"/>
								 	<s:param name="sum" value="sum"/>
								 	<s:param name="contName" value="contName"/>
								 </s:url>
								 <s:if test="#curPage == #item">
								 	<li class="active"><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:if>
								 <s:else>
								 	<li ><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:else>
							</s:iterator>
							
							<s:url value="/3CusManager/opportunity_list" id="rpage">
								 	<s:param name="currentPage" value="nextPage"/>
								 	<s:param name="cusName" value="cusName"/>
								 	<s:param name="sum" value="sum"/>
								 	<s:param name="contName" value="contName"/>
								 </s:url>
							<li ><s:a href="%{rpage}">&raquo;</s:a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	
</body>
</html>