<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
		<title>Insert title here</title>
		<%@include file="/common/header.jsp"%>
		<%@include file="/common/meta.jsp"%>
		
		<script type="text/javascript">
			function formSubmit(){
				$("#addForm").submit();
			}
		</script>
		
</head>

<body>
		<%@include file="topCNM.jsp"%>
		<%@include file="naviCN.jsp"%>
	
		<div class="mainc" id="mainc">
			<div class="navbar1">
				<span class="maincLabel">
					<i class="glyphicon glyphicon-export"></i>
					&nbsp;客户信息管理
				</span>
				<a href="#" class="aactive">添加客户</a>
				
				<c:if test="${fn:contains(sessionScope.authority,'customer_list')}">
				<a href="customer_list.action" >客户列表</a>
				</c:if>
			</div>
		
		<div class="col-md-12">
			<form id="addForm" action="${ctx}/3CusManager/customer_save.action" class="form-horizontal" enctype="multipart/form-data" method="post">
					
					<div class="table1" style="padding-top:0px">
						<div class="tabLabCon">
							<a href="#" class="tableLabel">帮　助</a>
							<a href="customer_list" class="tableLabel">返回</a>
							<a href="javascript:formSubmit()" class="tableLabel">保存</a>
						</div>
						
						<s:if test="fieldErrors != null && fieldErrors.size > 0 || actionErrors != null && actionErrors.size > 0">
							<div class="alert alert-danger alert-dismissible">
								<s:fielderror />
								<s:actionerror />
							</div>
						</s:if>
						
						<table class="table text-center">
							<tr>
								<td  style="border-top:0px;width:120px">
									<label class="control-label">名称</label>
								</td>
								<td  style="border-top:0px;width:350px">
     								<s:textfield name="name" cssClass="form-control" id="name"/>
								</td>
								<td  style="border-top:0px;width:120px">
								</td>
								<td  style="border-top:0px;width:350px">
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">地区</label>
								</td>
								<td>
     								<s:select list="locations" cssClass="form-control" name="location" 
     								   listValue="title" value="nmg"></s:select>
								</td>
								<td>
									<label class="control-label">客户经理</label>
								</td>
								<td>
     								<s:select list="users" cssClass="form-control" name="userId" listValue="name" listKey="id"></s:select>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">客户等级</label>
								</td>
								<td>
     								<s:select list="ranks" cssClass="form-control" name="rank" listValue="title"></s:select>
     							</td>
								<td>
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">客户满意度</label>
								</td> 
								<td style="text-align:left">
     								<s:textfield style="display:none" name="satisfication" cssClass="form-control" id="satisfication"/>
     								<div id="QuacorGrading">
										<input name="1" type="button"/>
										<input name="2" type="button"/>
										<input name="3" type="button"/>
										<input name="4" type="button"/>
										<input name="5" type="button"/>
										<span id="QuacorGradingValue">　<b><font size="5" color="#fd7d28">3</font></b>分</span>
										
									</div>
								</td>
								
								<td>
									<label class="control-label">客户信用度</label>
								</td>
								<td style="text-align:left">
     								<s:textfield style="display:none" name="credit" cssClass="form-control" id="credit"/>
     								<div id="QuacorGrading1">
										<input name="1" type="button" />
										<input name="2" type="button" />
										<input name="3" type="button" />
										<input name="4" type="button" />
										<input name="5" type="button" />
										<span id="QuacorGradingValue1">　<b><font size="5" color="#fd7d28">3</font></b>分</span>
										
									</div>
								</td>
							</tr>
						</table>
					</div>
					
					<div class="table1">
						<table class="table text-center">
							<tr>
								<td style="width:120px">
									<label class="control-label">地址</label>
								</td>
								<td style="width:350px">
     								<s:textfield name="address" cssClass="form-control" id="address"/>
     							</td>
     							<td style="width:120px">
									<label class="control-label">邮政编码</label>
								</td>
								<td style="width:350px">
     								<s:textfield name="zipcode" cssClass="form-control" id="zipcode"/>
     							</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">电话</label>
								</td>
								<td>
     								<s:textfield name="phone" cssClass="form-control" id="phone"/>
								</td>
								<td>
									<label class="control-label">传真</label>
								</td>
								<td>
     								<s:textfield name="fax" cssClass="form-control" id="fax"/>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">网址</label>
								</td>
								<td>
     								<s:textfield name="website" cssClass="form-control" id="website"/>
								</td>
								<td>
								</td>
								<td>
								</td>
							</tr>
						</table>					
					</div>
					
					<div class="table1">
						<table class="table text-center">
							<tr>
								<td style="width:120px">
									<label class="control-label">营业执照注册号</label>
								</td>
								<td style="width:350px">
     								<s:textfield name="businessLicence" cssClass="form-control" id="businessLicence"/>
     							</td>
     							<td style="width:120px">
									<label class="control-label">法人</label>
								</td>
								<td style="width:350px">
     								<s:textfield name="corporation" cssClass="form-control" id="corporation"/>
     							</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">注册资金(万元)</label>
								</td>
								<td>
     								<s:textfield name="property" cssClass="form-control" id="property"/>
								</td>
								<td>
									<label class="control-label">年营业额</label>
								</td>
								<td>
     								<s:textfield name="SalesVolume" cssClass="form-control" id="SalesVolume"/>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">开户银行</label>
								</td>
								<td>
     								<s:textfield name="bankName" cssClass="form-control" id="bankName"/>
								</td>
								<td>
									<label class="control-label">银行账号</label>
								</td>
								<td>
     								<s:textfield name="bankAccount" cssClass="form-control" id="bankAccount"/>
								</td>
							</tr>
							<tr>
								<td>
									<label class="control-label">地税登记号</label>
								</td>
								<td>
     								<s:textfield name="NumAddress" cssClass="form-control" id="NumAddress"/>
								</td>
								<td>
									<label class="control-label">国税登记号</label>
								</td>
								<td>
     								<s:textfield name="NTRU" cssClass="form-control" id="NTRU"/>
								</td>
							</tr>
						</table>					
					</div>
					
					<div class="col-sm-offset-5 col-sm-7">
						<%-- <s:submit cssClass="btn btn-primary" value="添加"/>
						<s:reset cssClass="btn btn-default" value="重置"/> --%>
					</div>
					
					
				</form>
				
				
			</div>
		</div>
		<script type="text/javascript">

		
		var GradList = document.getElementById("QuacorGrading").getElementsByTagName("input");
		for(var di=0;di<parseInt(document.getElementById("QuacorGradingValue").getElementsByTagName("font")[0].innerHTML);di++){
			GradList[di].style.backgroundPosition = 'left center';
		}
		
		for(var i=0;i < GradList.length;i++){
			GradList[i].onmouseover = function(){
				for(var Qi=0;Qi<GradList.length;Qi++){
					GradList[Qi].style.backgroundPosition = 'right center';
				}
				for(var Qii=0;Qii<this.name;Qii++){
					GradList[Qii].style.backgroundPosition = 'left center';
				}
				document.getElementById("QuacorGradingValue").innerHTML = '　<b><font size="5" color="#fd7d28">'+this.name+'</font></b>分';
				document.getElementById("satisfication").value = this.name;
			};
		}
		
		
		var GradList1 = document.getElementById("QuacorGrading1").getElementsByTagName("input");
		
		for(var di=0;di<parseInt(document.getElementById("QuacorGradingValue1").getElementsByTagName("font")[0].innerHTML);di++){
			GradList1[di].style.backgroundPosition = 'left center';
		}
		
		for(var i=0;i < GradList1.length;i++){
			GradList1[i].onmouseover = function(){
				for(var Qi=0;Qi<GradList1.length;Qi++){
					GradList1[Qi].style.backgroundPosition = 'right center';
				}
				for(var Qii=0;Qii<this.name;Qii++){
					GradList1[Qii].style.backgroundPosition = 'left center';
				}
				document.getElementById("QuacorGradingValue1").innerHTML = '　<b><font size="5" color="#fd7d28">'+this.name+'</font></b>分';
				document.getElementById("credit").value = this.name;
			};
		}
		</script>
		
		
		<script src="${ctx}/resources/js/typeahead-bs2.min.js"></script>
		<script src="${ctx}/resources/js/ace-elements.min.js"></script>
		<script src="${ctx}/resources/js/ace.min.js"></script>
</body>
</html>