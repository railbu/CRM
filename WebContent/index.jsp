<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<%@include file="/common/header.jsp"%>
		<%@include file="/common/meta.jsp"%>
		<title>小补的家</title>
</head>
<body>
	<div style="margin-left:300px; margin-top:300px">
	<form action="${ctx}/loginAction_login" enctype="multipart/form-data" method="post">
		用户名：
		<s:textfield name="username"></s:textfield>
		</br>
		密码:
		<s:password name="password"></s:password>
		<input type="submit" value="登录">
	</form>
	</div>
</body>
</html>