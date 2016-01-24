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
					客户开发计划
				</span>
				<a href="${ctx}/3CusManager/plan_optlist.action" class="aactive">客户开发计划管理</a>
			</div>
			<div class="col-md-12">
			<form action="${ctx}/3CusManager/plan_optlist.action" class="form-horizontal" enctype="multipart/form-data" method="post">
				<div class="table1" style="margin-right:0px">
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
				<div class="table1" style="margin-right:0px">
					<table class="table">
					<thead>
						<tr>
							<th>编号</th>
							<th>客户名称</th>
							<th>概要</th>
							<th>联系人</th>
							<th>联系人电话</th>
							<th>创建时间</th>
							<th>开发状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="optlist" var="item">
							<tr>
								<td><s:property value="id" /></td>
								<td><s:property value="customerName" /></td>
								<td><s:property value="summary" /></td>
								<td><s:property value="contactName" /></td>
								<td><s:property value="contactPhone" /></td>
								<td><s:date name="createTime" format="yyyy-MM-dd HH:mm:ss" /></td>
								<td><s:property value="developState" /></td>
								<td>
								<s:if test="#item.developState!='开发成功'&&#item.developState!='开发失败'">
									<s:url value="/3CusManager/plan_list" id="list">
										<s:param name="optid" value="id" />
									</s:url> 
									<s:a href="%{list}" cssClass="button button-flat-primary button-tiny" style="height:32px">制定计划</s:a>
									
									<c:if test="${fn:contains(sessionScope.authority,'plan_edit')}">
									<s:url value="/3CusManager/plan_edit" id="edit">
										<s:param name="optid" value="id" />
									</s:url> 
									<s:a href="%{edit}" cssClass="button button-flat-primary button-tiny" style="height:32px">执行计划</s:a>
									</c:if>
									
								</s:if>
								<s:if test="#item.developState=='开发成功'">
									<s:url value="/3CusManager/plan_moreinfo" id="moreinfo">
										<s:param name="optid" value="id" />
									</s:url> 
									<s:a href="%{moreinfo}" cssClass="button button-flat-primary button-tiny" style="height:32px">详情</s:a>
									<c:if test="${fn:contains(sessionScope.authority,'customer_add')}">
									<s:url value="/3CusManager/customer_add" id="add">
										<s:param name="optid" value="id" />
									</s:url> 
									<s:a href="%{add}" cssClass="button button-flat-primary button-tiny" style="height:32px">创建客户</s:a>
									</c:if>		
								</s:if>
								<s:if test="#item.developState=='开发失败'">
									<s:url value="/3CusManager/plan_moreinfo" id="moreinfo">
										<s:param name="optid" value="id" />
									</s:url> 
									<s:a href="%{moreinfo}" cssClass="button button-flat-primary button-tiny" style="height:32px">详情</s:a>	
								</s:if>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				
				<s:set name="curPage" value="%{currentPage}"/>
				
					<div class="pageSelect">
						<ul class="pagination">
						
							<s:url value="/3CusManager/plan_optlist" id="lpage">
								 	<s:param name="currentPage" value="lastPage"/>
								 	<s:param name="cusName" value="cusName"/>
								 	<s:param name="sum" value="sum"/>
								 	<s:param name="contName" value="contName"/>
								 </s:url>
							<li ><s:a href="%{lpage}">&laquo;</s:a></li>
							
							<s:iterator value="pages" var="item">
								 <s:url value="/3CusManager/plan_optlist" id="page">
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
							
							<s:url value="/3CusManager/plan_optlist" id="rpage">
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