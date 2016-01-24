<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
		<title>Insert title here</title>
		<%@include file="/common/header.jsp"%>
		<%@include file="/common/meta.jsp"%>
		
		<script src="${ctx}/resources/bootstrap/js/bootstrap-switch.js"></script>
		<link href="${ctx}/resources/bootstrap/css/bootstrap-switch.css" rel="stylesheet">
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
					&nbsp;权限管理
				</span>
			</div>
			<div class="col-md-10">
			
			</div>
			<div class="col-md-12">
			<div class="table1">
				<div class="panel panel-default">
 				<!-- Default panel contents -->
 				<div class="panel-heading" style="height:40px">
 					<div class="col-offset-lg-4 col-md-3">
						<label class="control-label">权限列表</label>
					</div>
				</div>
					<form action="${ctx}/authority_save" method="post">
						<table class="table">
							<thead>
								<tr>
									<th>序号</th>
									<th>姓名</th>
									<th>权限描述2</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								
								<s:iterator value="uaList" var="item" status="st">
									<tr>
										<s:hidden name="uaList[%{#st.index}].id" value="%{#item.id}"/>
										<td><s:property value="id" /></td>
										<td><s:textfield name="uaList[%{#st.index}].user.name" value="%{user.name}"/></td>
										
										<td><s:textfield name="uaList[%{#st.index}].authority.description" value="%{authority.description}" cssClass="form-control"/></td>
										
										<td><s:checkbox id="switch" name="uaList[%{#st.index}].onoff"/>
											<script type="text/javascript">
												$("[id='switch']").bootstrapSwitch();
											</script>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
						<s:submit value="提交" cssClass="btn btn-primary"></s:submit>
					</form>
				</div>
				
				<s:set name="curPage" value="%{currentPage}"/>
				
					<div class="pageSelect">
						<ul class="pagination">
						
							<s:url value="/3CusManager/contact_listContact" id="lpage">
								 	<s:param name="currentPage" value="lastPage"/>
								 	<s:param name="cnbid" value="%{cnbid}"/>
								 </s:url>
							<li ><s:a href="%{lpage}">&laquo;</s:a></li>
							
							<s:iterator value="pages" var="item">
								 <s:url value="/3CusManager/contact_listContact" id="page">
								 	<s:param name="currentPage" value="#item"/>
								 	<s:param name="cnbid" value="%{cnbid}"/>
								 </s:url>
								 <s:if test="#curPage == #item">
								 	<li class="active"><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:if>
								 <s:else>
								 	<li ><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:else>
							</s:iterator>
							
							<s:url value="/3CusManager/contact_listContact" id="rpage">
							 	<s:param name="currentPage" value="nextPage"/>
							 	<s:param name="cnbid" value="%{cnbid}"/>
							</s:url>
							<li ><s:a href="%{rpage}">&raquo;</s:a></li>
						</ul>
					</div>
			</div>
			</div>
		</div>
	
</body>
</html>