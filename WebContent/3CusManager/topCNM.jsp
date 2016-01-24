<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="navbar navbar-default" id="navbar">
		
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="/Admin/Index/index.html" class="navbar-brand">
						<span class="logodiv">
							<img src="${ctx}/resources/images/logo.png" width=80px;/>
						</span>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->
				
				<div class="navbar-header pull-right" role="navigation">
					
					<ul class="nav ace-nav">
						<s:if test="#session.liushi != null && #session.liushi != 0">
						
						<li>
							<a href="${ctx}/3CusManager/measure_list.action" style="margin-right:10px;">
							   <span class="glyphicon glyphicon-envelope" id="envelope" 
							   style="font-size:23px;color:#FFFFFF;line-height:1.5;margin-right:5px;"></span> 
							   <span class="badge" style="float:right;z-index:2;position:absolute;
							                     margin:12px 0 0 28px;"
							      ><s:property value="#session.liushi"/></span>
							   
							   <s:if test="#session.liushiyikan == null">
							   <script type="text/javascript">
							   		var count = 0;
							   		var flag = 0;
							   		var timeout;
							   		var enve = document.getElementById("envelope");
							   		function flash(){
							   			if(flag == 1){
							   				enve.style.color='#FFCC33';
							   				flag = 0;
							   			}
							   			else{
							   				enve.style.color='white';
							   				flag = 1;
							   			}
							   			setTimeout(flash,500);
							   		}
							   		flash();
							   </script>
							  <!--  <script type="text/javascript">
							   		var count = 0;
							   		var i = 14;
							   		var timeout;
							   		var flag = 0
							   		var enve = document.getElementById("envelope");
							   		var colors = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];
							   		function flash(){
							   			enve.style.color = '#FF'+colors[i]+colors[i]+colors[i]+colors[i];
							   			setTimeout(flash,50);
							   			if(flag == 0)
							   				i--;
							   			else 
							   				i++;
							   			if(i == 0)
							   				flag = 1;
							   			if(i == 14)
							   				flag = 0;
							   			
							   		}
							   		flash();
							   </script> -->
							   </s:if>
							</a>
						</li>
						</s:if>
						<s:else>
						<li >
							<span class="glyphicon glyphicon-envelope" 
							   style="font-size:23px;color:#FFFFFF;line-height:2;margin-right:20px;"></span>
						</li>
						</s:else>
						
						<li class="light-blue" style="border-right:border-top:solid 1px #646668;">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<span class="user-info">
									<img src="${ctx}/resources/images/0.png" width=30px height=30px/>
									　
									<s:property value="#session.currentUser.name"/>
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">


								<li>
									<a href="${ctx}/logout.jsp">
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