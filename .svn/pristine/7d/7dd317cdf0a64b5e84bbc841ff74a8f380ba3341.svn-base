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
					&nbsp;客户信息管理 > 客户信息 > 交往记录  > 新建
				</span>
				<a href="#" class="aactive">添加</a>

				<a href="record_list.action" >交往记录</a>
			</div>
		
		<div class="col-md-12">
			<form action="${ctx}/3CusManager/record_save.action" class="form-horizontal" enctype="multipart/form-data" method="post">
					<s:hidden name="myid" value="%{myid}"/>
					<s:hidden name="id" />
					<div class="table1" style="padding-top:0px">
						<div class="tabLabCon">
							<a href="#" class="tableLabel">帮　助</a>
							<%-- <a href="${ctx}/3CusManager/contact_listContact.action" class="tableLabel">联系人</a> --%>
							<a href="#" class="tableLabel">交往记录</a>
							<a href="#" class="tableLabel">历史订单</a>
							<a href="#" class="tableLabel">返回</a>
							<a href="#" class="tableLabel">保存</a>
						</div>
						
						<table class="table text-center">
							<tr>
								<td>
									<label class="control-label">时间</label>
								</td>
								<td>
									<s:textfield name="d" cssClass="form-control" id="ctime"/>
								</td>
								<td>
									<label class="control-label">地区</label>
								</td>
								<td>
									<s:textfield name="location" cssClass="form-control" id="location" value="%{contactRecord.location}"/>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">概要</label>
								</td>
								<td>
     								<s:textfield name="summary" cssClass="form-control" id="summary" value="%{contactRecord.summary}"/>
								</td>
								<td>
									<label class="control-label">备注</label>
								</td>
								<td>
									<s:textfield name="remark" cssClass="form-control" id="remark" value="%{contactRecord.remark}"/>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">详细信息</label>
								</td>
								<td>
     								<s:textarea width="400px" height="320px" name="content" cssClass="form-control" id="content" value="%{contactRecord.content}"/>
								</td>
							</tr>
						</table>
					</div>

					
					<div class="col-sm-offset-5 col-sm-7">
						<s:submit cssClass="btn btn-primary" value="添加"/>
						<s:reset cssClass="btn btn-default" value="重置"/>
					</div>
					
					
				</form>
				
				
			</div>
		</div>

</body>
</html>