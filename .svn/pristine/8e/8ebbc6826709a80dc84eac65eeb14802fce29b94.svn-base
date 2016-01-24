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
					数据字典管理
				</span>
				<a href="${ctx}/3CusManager/addData.jsp">新建条目</a>
			</div>
		<div class="col-md-12">
			<form action="${ctx}/3CusManager/data_search.action" class="form-horizontal" enctype="multipart/form-data" method="post">
				<div class="table1" style="margin-right:0px">
					<table class="table">
						<tr>
							<td style="border-top: 0px">
								<label class="control-label">类别</label>
							</td>
							<td style="border-top: 0px">
    							<input type="text" name="dataType" class="form-control">
							</td>
							<td style="border-top: 0px">
								<label class="control-label">条目</label>
							</td>
							<td style="border-top: 0px">
    							<input type="text" name="dataName" class="form-control">
							</td>
							<td style="border-top: 0px">
								<label class="control-label">值</label>
							</td>
							<td style="border-top: 0px">
    							<input type="text" name="dataValue" class="form-control">
							</td>
							<td style="border-top: 0px"><s:submit cssClass="btn btn-primary" value="搜索"></s:submit></td>
						</tr>
					</table>
				</div>
			</form>
			</div>
			<div class="col-md-12">
				<div class="table1" style="margin-right:0px">
					<s:if test="fieldErrors != null && fieldErrors.size > 0 || actionErrors != null && actionErrors.size > 0">
							<div class="alert alert-danger alert-dismissible">
								<s:fielderror />
								<s:actionerror />
							</div>
						</s:if>
						
					<table class="table">
					<thead>
						<tr>
							<th>编号</th>
							<th>类别</th>
							<th>条目</th>
							<th>值</th>
							<th>是否可编辑</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="datalist" var="item">
							<tr>
								<td><s:property value="id" /></td>
								<td><s:property value="type" /></td>
								<td><s:property value="name" /></td>
								<td><s:property value="value" /></td>
								<td><s:property value="remark" /></td>
								
								<td>
										<s:url value="/3CusManager/data_edit" id="edit">
											<s:param name="dataid" value="id" />
										</s:url> 
										<s:a href="%{edit}" cssClass="button button-flat-primary button-tiny" style="height:32px">编辑</s:a>
									
										<s:url value="/3CusManager/data_delete" id="delete">
											<s:param name="dataid" value="id" />
										</s:url> 
										<s:a href="%{delete}" cssClass="button button-flat-primary button-tiny" style="height:32px">删除</s:a>
									
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				
				<s:set name="curPage" value="%{currentPage}"/>
				
					<div class="pageSelect">
						<ul class="pagination">
						
							<s:url value="/3CusManager/data_list" id="lpage">
								 	<s:param name="currentPage" value="lastPage"/>
								 </s:url>
							<li ><s:a href="%{lpage}">&laquo;</s:a></li>
							
							<s:iterator value="pages" var="item">
								 <s:url value="/3CusManager/data_list" id="page">
								 	<s:param name="currentPage" value="#item"/>
								 </s:url>
								 <s:if test="#curPage == #item">
								 	<li class="active"><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:if>
								 <s:else>
								 	<li ><s:a href="%{page}"><s:property value="#item"/></s:a></li>
								 </s:else>
							</s:iterator>
							
							<s:url value="/3CusManager/data_list" id="rpage">
								 	<s:param name="currentPage" value="nextPage"/>
								 </s:url>
							<li ><s:a href="%{rpage}">&raquo;</s:a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	
</body>
</html>