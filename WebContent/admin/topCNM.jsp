<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="navbar navbar-default" id="navbar">
		
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="/Admin/Index/index.html" class="navbar-brand">
						<span class="logodiv">
							<span class="glyphicon glyphicon-tower"></span>
							<span class="logofont">RuLaiCRM</span>
						</span>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->
				
				<div class="navbar-header pull-right" role="navigation">
					
					<ul class="nav ace-nav">
						<s:if test="#session.liushi != null && #session.liushi != 0">
						<li >
							<a href="${ctx}/3CusManager/measure_list.action">客户流失预警 <span class="badge"><s:property value="#session.liushi"/></span></a>
						</li>
						</s:if>
						
						<li class="light-blue" style="border-right:border-top:solid 1px #646668;">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<span class="user-info">
									<small>Welcome,</small>
									<s:property value="#session.currentUser.name"/>
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">


								<li>
									<a href="${ctx}/loginAction_logout">
										<i class="icon-off"></i>
										安全退出
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>