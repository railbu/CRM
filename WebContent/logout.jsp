<%@page import="javax.print.attribute.standard.Severity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/meta.jsp"%>
<title>退出-CRM</title>
</head>
<body>
	<%
		String ctx = request.getContextPath();
		session.invalidate();
		response.sendRedirect(ctx+"/login.jsp");
	%>
</body>
</html>