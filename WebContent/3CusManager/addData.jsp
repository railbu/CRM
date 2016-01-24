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
		<script src="${ctx}/resources/bootstrap/js/bootstrap-switch.js"></script>
		<link href="${ctx}/resources/bootstrap/css/bootstrap-switch.css" rel="stylesheet">
		<link href="${ctx}/resources/jquery/jquery-ui.css" rel="stylesheet">
		<script src="${ctx}/resources/jquery/jquery-ui.js"></script>
		
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
					<a href="#" class="aactive">新建数据字典条目</a>
					<a href="${ctx}/3CusManager/data_list.action">数据字典管理</a>
				</span>
			</div>
			
			<s:if test="fieldErrors != null && fieldErrors.size > 0 || actionErrors != null && actionErrors.size > 0">
							<div class="alert alert-danger" style="font-size:15px;height:20px;line-height:0;width:60%;margin-left:3%">
								<s:fielderror />
								<s:actionerror />
							</div>
			</s:if>
			<form action="${ctx}/3CusManager/data_save.action" class="form-horizontal" enctype="multipart/form-data" method="post">
				<div class="table1">
					<table class="table text-center">
						<tr>
							<td>
								<label class="control-label">条目</label>
							</td>
							<td>
    							<s:textfield type="text" name="name" cssClass="form-control" placeholder="必填"/>
							</td>
							<td>
								<label class="control-label">类别</label>
							</td>
							<td>
								<div class="ui-widget" id="ui-front">
    								<input type="text" id="type" name="type" class="form-control"/>
    							</div>
    							<script type="text/javascript">
    								$("#type").autocomplete({
    									source:"autocomplete2.action"
    								});
    							</script>
							</td>
						</tr>
						<tr>
							<td>
								<label class="control-label">值</label>
							</td>
							<td>
    							<s:textfield type="text" name="value" cssClass="form-control" placeholder="必填"/>
							</td>
							<td>
								<label class="control-label">是否可编辑</label>
							</td>
							<td style="text-align:left">
								<input type="checkbox" id="switch" name="dataRemark" checked />
							</td>
						</tr>
					</table>					
				</div>
				
				<div class="col-sm-offset-5 col-sm-8">
					<s:submit cssClass="btn btn-primary" value="保存"/>
					<s:reset cssClass="btn btn-default" value="重置"/>
				</div>
			</form>
		</div>
	<script type="text/javascript">
		$("[id='switch']").bootstrapSwitch();
	</script>
</body>
</html>