<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
			<span class="maincLabel"> <i
				class="glyphicon glyphicon-export"></i> &nbsp客户信息管理 > 客户信息 > 联系人 >
				编辑联系人
			</span>
			<!--  <a href="${ctx}/3CusManager/contact_add.action" >保存</a>-->
			<a href="${ctx}/3CusManager/contact_listContact.action?cnbid=${cnbid}">返回</a>
		</div>
		<s:if
			test="fieldErrors != null && fieldErrors.size > 0 || actionErrors != null && actionErrors.size > 0">
			<div class="alert alert-danger"
				style="font-size: 15px; height: 20px; line-height: 0; width: 60%; margin-left: 3%">
				<s:fielderror />
				<s:actionerror />
			</div>
		</s:if>
		<form action="${ctx}/3CusManager/contact_editContact.action"
			method="post" class="form-horizontal">
			<div class="table1">
				<table class="table text-center">
					<tr>
						<td><label class="control-label">姓名</label></td>
						<td><s:textfield type="text" name="name"
								cssClass="form-control" value="%{contact.name}" /></td>
						<td><label class="control-label">性别</label></td>
						<td style="text-align: left"><s:if
								test="%{contact.gender == 0}">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="male" value="0" checked="checked"> 男
								</label>
								<label class="radio-inline"> <input type="radio"
									name="gender" id="female" value="1"> 女
								</label>
							</s:if> <s:else>
								<label class="radio-inline"> <input type="radio"
									name="gender" id="male" value="0"> 男

								</label>
								<label class="radio-inline"> <input type="radio"
									name="gender" id="female" value="1" checked="checked">
									女
								</label>
							</s:else></td>
					</tr>
					<tr>
						<td><label class="control-label">职位</label></td>
						<td><s:textfield type="text" name="position"
								cssClass="form-control" value="%{contact.position}" /></td>
						<td><label class="control-label">办公电话</label></td>
						<td><s:textfield type="text" name="officePhone"
								cssClass="form-control" value="%{contact.officePhone}" /></td>
					</tr>
					<tr>
						<td><label class="control-label">手机</label></td>
						<td><s:textfield type="text" name="mobilePhone"
								cssClass="form-control" value="%{contact.mobilePhone}" /></td>
						<td><label class="control-label">备注</label></td>
						<td><s:textfield type="text" name="remark"
								cssClass="form-control" value="%{contact.remark}" /></td>
					</tr>
				</table>
				<s:textfield type="hidden" name="cnbid" value="%{cnbid}" />
				<s:textfield type="hidden" name="contactId" value="%{contact.id}" />
				<div class="col-sm-offset-5 col-sm-7">
					<input type="submit" class="btn btn-primary" value="保存"> <input
						type="reset" class="btn btn-default" value="重置"> <input
						type="button" class="btn btn-default" value="返回"
						onclick="window.location.href('${ctx}/3CusManager/contact_listContact.action')">
				</div>
			</div>
		</form>
	</div>

</body>
</html>