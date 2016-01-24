<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<script type="text/javascript">
		function dosubmit(){
			$("#query").submit();
		}
	</script>

	<div class="mainc" id="mainc">
		<div class="navbar1">
			<span class="maincLabel"> <i
				class="glyphicon glyphicon-export"></i> &nbsp;客户流失管理
			</span> <a href="javascript:dosubmit()">查询</a>
			<!-- <a href="#" >保存</a> -->
		</div>
		<div class="col-md-12">
			<div class="table1" style="padding:18px 20px 18px">
				<div class="tableContent">
				<form action="${ctx}/3CusManager/measure_list.action" class="form-inline" method="post" id="query">
					
						  <div class="form-group" style="width:30%">
						    <div class="input-group">
						      <div class="input-group-addon">　客户　</div>
						      <s:textfield name="query_cus" cssClass="form-control" placeholder="Enter customer name" />
						    </div>
						  </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <div class="form-group" style="width:30%">
						    <div class="input-group">
						      <div class="input-group-addon">　客户经理　</div>
						      <s:textfield name="query_user" cssClass="form-control" placeholder="Enter customer manager" />
						    </div>
						  </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  <div class="form-group" style="width:18%">
						    <div class="input-group">
						      <div class="input-group-addon">　状态　</div>
						      <s:select cssClass="form-control" name="query_state" list="#{0:'全部',1:'暂缓流失',2:'确认流失'}" />
						    </div>
						    </div>&nbsp;&nbsp;&nbsp;
						    <s:submit style="width:8%" type="submit" cssClass="btn btn-primary" value="查询"/>
						  
<%-- 					<table class="table text-center">
						<tr>
							<td><label class="control-label">客户</label></td>
							<td><s:textfield type="text" name="query_cus"
									cssClass="form-control" /></td>
							<td><label class="control-label">客户经理</label></td>
							<td><s:textfield type="text" name="query_user"
									cssClass="form-control" /></td>
							<td><label class="control-label">状态</label></td>
							<td><s:select cssClass="form-control" name="query_state" list="#{0:'全部',1:'暂缓流失',2:'确认流失'}" /></td>
						</tr>
					</table> --%>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div class="table1">
				<div class="tableContent">
					<table class="table">
						<thead>
							<tr>
								<th>编号</th>
								<th>客户</th>
								<th>客户经理</th>
								<th>上次下单时间</th>
								<th>确认流失时间</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="list" var="item">
								<tr>
									<td><s:property value="id" /></td>
									<td><s:property value="name" /></td>
									<td><s:property value="user.name" /></td>
									<td><s:property value="lastShoppingTime" /></td>
									<%-- <td><s:property value="timeOfLost" /></td> --%>
									<td><fmt:formatDate value="${timeOfLost}"
											pattern="yyyy-MM-dd hh:mm:ss" /></td>
									<td><s:property value="state" /></td>
									<td><s:url value="/3CusManager/measure_confirm" id="edit">
											<s:param name="cnbid" value="id" />
										</s:url> <s:a href="%{edit}"
											cssClass="button button-flat-primary button-tiny"
											style="height:32px">确认流失</s:a> <s:url
											value="/3CusManager/measure_edit" id="delete">
											<s:param name="cnbid" value="id" />
										</s:url> <s:a href="%{delete}"
											cssClass="button button-flat-primary button-tiny"
											style="height:32px">暂缓流失</s:a></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					
					<s:set name="curPage" value="%{currentPage}"/>
					<div class="pageSelect">
						<ul class="pagination">
						
							<s:url value="/3CusManager/measure_list" id="lpage">
							 	<s:param name="currentPage" value="lastPage"/>
							 	<s:param name="query_cus" value="query_cus"/>
							 	<s:param name="query_user" value="query_user"/>
							 	<s:param name="query_state" value="query_state"/>
							 </s:url>
							<li ><s:a href="%{lpage}">&laquo;</s:a></li>
							
							<s:iterator value="pages" var="item">
								 <s:url value="/3CusManager/measure_list" id="page">
								 	<s:param name="currentPage" value="#item"/>
								 	<s:param name="query_cus" value="query_cus"/>
							 		<s:param name="query_user" value="query_user"/>
							 		<s:param name="query_state" value="query_state"/>
								 </s:url>
								 <s:if test="#curPage == #item">
								 	<li class="active"><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:if>
								 <s:else>
								 	<li ><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:else>
							</s:iterator>
							
							<s:url value="/3CusManager/measure_list" id="rpage">
								 	<s:param name="currentPage" value="nextPage"/>
								 	<s:param name="query_cus" value="query_cus"/>
							 		<s:param name="query_user" value="query_user"/>
							 		<s:param name="query_state" value="query_state"/>
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