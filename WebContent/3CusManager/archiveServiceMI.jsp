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
					&nbsp;服务处理
				</span>
				<a href="#" class="aactive">添加服务</a>
				<a href="service_listItem.action" >服务列表</a>
			</div>
		
			<div class="col-md-12">
				
				<s:hidden name="cnmid" value="%{cnmid}"/>
					<div class="table1" style="padding-top:0px">
						<div class="tabLabCon">
							<a href="#" class="tableLabel">帮　助</a>
							<a href="service_arList" class="tableLabel">返回</a>
						</div>
						
						<table class="table text-center">
							<tr>
								<td class="tdMI" style="border-top:0px">
									<label class="control-label">编号</label>
								</td>
								<td style="border-top:0px">
									<s:textfield value="%{cs.id}" cssClass="form-control" readonly="true"/>
								</td>
								
								<td style="border-top:0px">
									<label class="control-label">服务类型</label>
								</td>
								<td style="border-top:0px">
									<s:textfield value="%{cs.serviceItem.type}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<label class="control-label">概要</label>
								</td>
								<td>
									<s:textfield value="%{cs.serviceItem.summary}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<label class="control-label">客户</label>
								</td>
								<td>
									<s:textfield value="%{cs.customer.name}" cssClass="form-control" readonly="true"/>
								</td>
								<td>
									<label class="control-label">状态</label>
								</td>
								<td>
									<s:textfield value="%{cs.serviceItem.assignState}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">服务请求</label>
								</td>
								<td>
									<s:textfield value="%{cs.serviceRequest}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">创建人</label>
								</td>
								<td>
									<s:textfield value="%{cs.createPerson.name}" cssClass="form-control" readonly="true"/>
								</td>
								<td>
									<label class="control-label">创建时间</label>
								</td>
								<td>
									<s:textfield value="%{cs.createTime}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
						</table>
					</div>
					<div class="table1">	
						<table class="table text-center">
							<tr>
								<td style="border-top:0px">
									<label class="control-label">分配给</label>
								</td>
								<td style="border-top:0px">
									<s:textfield value="%{cs.serviceItem.assignedPerson.name}" cssClass="form-control" readonly="true"/>
								</td>
								<td style="border-top:0px">
									<label class="control-label">分配时间</label>
								</td>
								<td style="border-top:0px">
									<s:textfield value="%{formatTime(cs.serviceItem.assignTime)}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
						</table>
						
					</div>
					
					<div class="table1">
						<table class="table text-center">
							<tr>
								<td style="border-top:0px">
									<label class="control-label">服务处理</label>
								</td>
								<td style="border-top:0px">
									<s:textfield value="%{cs.serviceDeal}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">处理人</label>
								</td>
								<td>
									<s:textfield value="%{#session.currentUser.name}" cssClass="form-control" readonly="true"/>
								</td>
								<td>
									<label class="control-label">处理时间</label>
								</td>
								<td>
									<s:textfield value="%{currentTime}" cssClass="form-control" readonly="true"/>
								</td>
							</tr>
						</table>
					</div>
						
					<div class="table1" >
						<table class="table text-center">
							<tr >
								<td style="border-top:0px">
									<label class="control-label">处理结果</label>
								</td>
								<td style="border-top:0px">
									<s:textfield cssClass="form-control" value="%{cs.result}"  readonly="true"></s:textfield>
								</td>
								<td style="border-top:0px">
									<label class="control-label">满意度</label>
								</td>
								<td style="text-align:left;border-top:0px">
     								<div id="QuacorGrading">
										<input name="1" type="button"/>
										<input name="2" type="button"/>
										<input name="3" type="button"/>
										<input name="4" type="button"/>
										<input name="5" type="button"/>
										<span id="QuacorGradingValue">　<b><font size="5" color="#fd7d28"><s:property value="%{cs.satisfication}"/></font></b>分</span>
										
									</div>
									<script type="text/javascript">
										var GradList = document.getElementById("QuacorGrading").getElementsByTagName("input");
										for(var di=0;di<parseInt(document.getElementById("QuacorGradingValue").getElementsByTagName("font")[0].innerHTML);di++){
											GradList[di].style.backgroundPosition = 'left center';
										}
									</script>
									<%-- <s:textfield value="%{cs.satisfication}" cssClass="form-control"  readonly="true"></s:textfield> --%>
								</td>
							</tr>
						</table>
					</div>
			</div>
		</div>

</body>
</html>