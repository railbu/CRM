<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div id="topBar">
			<div class="container">
				<div style="float:right">
					<c:if test="${sessionScope.currentUser == null}">
						<a href="${ctx}/login.jsp">登录</a>
						<a href="${ctx}/register_input.action">注册</a>
					</c:if>
					<c:if test="${sessionScope.currentUser != null}">
						<a href="${ctx}/profile.jsp">个人资料</a>
						<a href="${ctx}/logout.jsp">退出登录</a>
					</c:if>
				</div>
				<i class="icon-user"></i>
				${sessionScope.currentUser == null ? '您好' : sessionScope.currentUser.username}，
				欢迎光临成绩发布通知系统，今天是<sptags:dateOutput/>
			</div>
		</div>
		<div id="header" class="container">
			<ul id="nav" class="nav nav-tabs pull-right">
				<li class=""><a href="${ctx}${sessionScope.currentUser == null ? '/index.action' : '/secure/home.jsp'}">首页</a>
				</li>
				<li class=""><a href="${ctx}/about.jsp">关于</a>
				</li>
			</ul>
			<a id="logo" href="${ctx}${sessionScope.currentUser == null ? '/index.action' : '/secure/home.jsp'}">成绩发布通知</a>
		</div>

