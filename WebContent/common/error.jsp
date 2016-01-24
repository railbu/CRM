<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@include file="/common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>首页</title>
		<%@include file="/common/meta.jsp"%>
	</head>
	<body>
		<%@include file="/common/top.jsp"%>
		<div class="alert alert-danger" style="text-align:center;margin:20px auto;width:300px;">
			<p>系统异常：</p><br/>
			<div>
				${exception.message}
			</div>
		</div>

		<%@include file="/common/footer.jsp"%>
	</body>
</html>


