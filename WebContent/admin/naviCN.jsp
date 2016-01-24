<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<div class="sidebar" id="sidebar">
					<ul class="nav nav-list">
						
						<c:if test="${fn:contains(sessionScope.authority,'opportunity_list')}">
						<div class="hr_black"></div>
						
						<li >
						
							<a href="#" class="dropdown-toggle">
								<span class="naviLab">
								<span class="glyphicon glyphicon-shopping-cart"></span>
								</span>
								<span class="menu-text">　营销管理　　</span>
								<span class="forhide">
								<span class="glyphicon glyphicon-chevron-down"  style="font-size:10px"></span>
								</span>
							</a>

							<ul class="submenu">
								<li>
									<a href="${ctx}/3CusManager/opportunity_list.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										销售机会管理
									</a>
								</li>
								<li>
									<a href="${ctx}/3CusManager/plan_optlist.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										客户开发计划
									</a>
								</li>
							</ul>
						</li>
						</c:if>
						
						<c:if test="${fn:contains(sessionScope.authority,'customer')}">
						<li >
							<div class="hr_black"></div>
							<a href="#" class="dropdown-toggle">
								<span class="naviLab">
								<span class="glyphicon glyphicon-adjust"></span>
								</span>
								<span class="menu-text">　客户管理　　</span>
								<span class="forhide">
								<span class="glyphicon glyphicon-chevron-down" style="font-size:10px"></span>
								</span>
							</a>

							<ul class="submenu">
								<c:if test="${fn:contains(sessionScope.authority,'customer_list')}">
								<li>
									<a href="${ctx}/3CusManager/customer_list.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										客户信息管理
									</a>
								</li>
								</c:if>
								<li>
									<a href="${ctx}/3CusManager/measure_list.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										客户流失管理
									</a>
								</li>
							</ul>

						</li>	
						</c:if>
						
						<c:if test="${fn:contains(sessionScope.authority,'service')}">
						<li >
							<div class="hr_black"></div>
							<a href="${ctx}/3CusManager/service_listItem" class="dropdown-toggle">
								<span class="naviLab">
								<span class="glyphicon glyphicon-share"></span>
								</span>
								<span class="menu-text">　服务管理　　</span>
								<span class="forhide">
								<span class="glyphicon glyphicon-chevron-down" style="font-size:10px"></span>
								</span>
							</a>

							<ul class="submenu">
								<c:if test="${fn:contains(sessionScope.authority,'service_add')}">
								<li>
									<a href="${ctx}/3CusManager/service_add">
										<i class="glyphicon glyphicon-pushpin"></i>
										服务创建
									</a>
								</li>
								</c:if>
								
								<c:if test="${fn:contains(sessionScope.authority,'service_allocatelist')}">
								<li>
									<a href="${ctx}/3CusManager/service_allocatelist.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										服务分配
									</a>
								</li>
								</c:if>
								
								<c:if test="${fn:contains(sessionScope.authority,'service_deal')}">
								<li>
									<a href="${ctx}/3CusManager/service_dealList.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										服务处理
									</a>
								</li>
								</c:if>
								
								<c:if test="${fn:contains(sessionScope.authority,'service_fb')}">
								<li>
									<a href="${ctx}/3CusManager/service_fbList.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										服务反馈
									</a>
								</li>
								</c:if>
								
								<c:if test="${fn:contains(sessionScope.authority,'service_ar')}">
								<li>
									<a href="${ctx}/3CusManager/service_arList.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										服务归档
									</a>
								</li>
								</c:if>
							</ul>
						</li>
						</c:if>
						
						<c:if test="${fn:contains(sessionScope.authority,'analysize')}">
						<li >
							<div class="hr_black"></div>
							<a href="#" class="dropdown-toggle">
								<span class="naviLab">
								<span class="glyphicon glyphicon-usd"></span>
								</span>
								<span class="menu-text">　统计报表　　</span>
								<span class="forhide">
								<span class="glyphicon glyphicon-chevron-down" style="font-size:10px"></span>
								</span>
							</a>

							<ul class="submenu">
								<li >
									<a href="${ctx}/3CusManager/analysize_contributlist.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										客户贡献分析
									</a>
								</li>	
								
								<li>
									<a href="${ctx}/3CusManager/analysize_constlist.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										客户构成分析
									</a>
								</li>
								
								<li>
									<a href="${ctx}/3CusManager/analysize_servicelist.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										客户服务分析
									</a>
								</li>
								
								<li>
									<a href="${ctx}/3CusManager/analysize_lostlist.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										客户流失分析
									</a>
								</li>
							</ul>
						</li>
						</c:if>
						
						<c:if test="${fn:contains(sessionScope.authority,'data')}">
						<li >
							<div class="hr_black"></div>
							<a href="#" class="dropdown-toggle">
								<span class="naviLab">
								<span class=" glyphicon glyphicon-briefcase"></span>
								</span>
								<span class="menu-text">　基础数据　　</span>
								<span class="forhide">
								<span class="glyphicon glyphicon-chevron-down" style="font-size:10px"></span>
								</span>
							</a>

							<ul class="submenu">
								<li>
									<a href="${ctx}/3CusManager/data_list.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										数据字典管理
									</a>
								</li>
								<li>
									<a href="${ctx}/3CusManager/goods_list.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										查询产品信息
									</a>
								</li>
								<li>
									<a href="${ctx}/3CusManager/leftgoods_list.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										查询库存
									</a>
								</li>
																
							</ul>
						</li>
						</c:if>
						
						<c:if test="${fn:contains(sessionScope.authority,'authority')}">
						<li >
							<div class="hr_black"></div>
							<a href="#" class="dropdown-toggle">
								<span class="naviLab">
								<span class=" glyphicon glyphicon-briefcase"></span>
								</span>
								<span class="menu-text">　权限管理　　</span>
								<span class="forhide">
								<span class="glyphicon glyphicon-chevron-down" style="font-size:10px"></span>
								</span>
							</a>

							<ul class="submenu">
								<li>
									<a href="${ctx}/admin/authority_listUser.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										查看权限列表
									</a>
								</li>
								<li>
									<a href="${ctx}/admin/iniuserList.action">
										<i class="glyphicon glyphicon-pushpin"></i>
										初始化权限
									</a>
								</li>
								
							</ul>
						</li>
						</c:if>
						
					</ul><!-- /.nav-list -->
					<div class="hr_black"></div>
					
					<div style="height:auto;display:block;padding-top:300px;">
					</div>
					
					<div class="sidebar-collapse" id="sidebar-collapse" style="height:30px;">
						<i class="glyphicon glyphicon-chevron-left" onclick="changeMargin()"
						 data-icon1="glyphicon glyphicon-chevron-left" data-icon2="glyphicon glyphicon-chevron-right"></i>
					</div>
				</div>
				
				<script type="text/javascript">
					function changeMargin(){						
						var mainc = document.getElementById("mainc");
						var mar = mainc.style.margin;
						if(mar == '50px 0px 0px 6%'){
							mainc.style.margin ='50px 0px 0px 17%';
							mainc.style.width='83%';
						}
						else{
							mainc.style.margin ='50px 0px 0px 6%';
							mainc.style.width='94%';
						}
					}
				</script>
				
				