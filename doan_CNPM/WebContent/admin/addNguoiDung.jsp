<%@page import="bean.NhanSu"%>
<%@page import="model.ModelNhanSu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp"%>
<div id="content">
	<div id="content-header">
		<div id="breadcrumb">
			<a href="<%=request.getContextPath() %>/admin/home" title="Về trang chủ" class="tip-bottom"><i
				class="icon-home"></i>Trang chủ</a> <a href="<%=request.getContextPath() %>/admin/users">Người dùng</a> <a href="javascript:void(0)" class="current">Thêm
				người dùng</a>
		</div>
		<h1 style="text-align: center">Thêm người dùng</h1>
	</div>
	<div class="container-fluid">
		<hr>
		<div class="row-fluid">
			<div class="span12">
				<%
				  	int msg = 0;
				  	if(request.getParameter("msg") != null){
				  		msg = Integer.parseInt(request.getParameter("msg"));
				  		switch(msg){
				  			case 0:
				  				out.print("<span style='color:blue;font-weight:bold'>Tên người dùng đã tồn tại!</span>");
		        				break;
				  		}
				  	}
				  	ModelNhanSu mNS=new ModelNhanSu();
				  	ArrayList<NhanSu> listNhanSu=mNS.getListNoAccount();
			  	%>
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"> <i class=icon-user></i>
						</span>
						<h5>Người dùng</h5>
					</div>
					<div class="widget-content nopadding">
						<form onsubmit="return check()" class="form-horizontal"
							method="post" action="" id="addUser" name="form1">
							<div class="control-group">
								<div class="controls">
									<div class="span4 m-wrap">
										<label style="font-weight: bold">Tạo tài khoản cho(*)</label>
										<select onchange="change(this)"  id="maNS" name="maNS">
											<option value="khac">Khác</option>
											<% for(NhanSu objNS:listNhanSu){ %>
											<option value="<%=objNS.getMa() %>"><%=objNS.getMa() %></option>
											<%} %>
										</select>
									</div>
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<div class="span4 m-wrap">
										<label style="font-weight: bold">Username(*)</label> <input
											type="text" name="username" value=""
											placeholder="Nhập tên đăng nhập" class="span12 m-wrap">
											<p style="color: red;font-size: 15px" id="username"></p>

									</div>
									
									<script type="text/javascript">
									   function change(ma){
										   var maNhanSu=ma.value;
										   var html="";
										   if(maNhanSu=="khac"){
											   html="<label style='font-weight: bold'>Fullname(*)</label> <input type='text' name='fullname' placeholder='Nhập tên đầy đủ' class='span12 m-wrap'><p style='color: red;font-size: 15px' id='fullname'></p>";
										   }else{
											   html="";
										   }
										   document.getElementById("result").innerHTML=html;
									   }
									</script>

									<div id="result" class="span4 m-wrap">
										<label style="font-weight: bold">Fullname(*)</label> <input
											type="text" name="fullname" value=""
											placeholder="Nhập tên đầy đủ" class="span12 m-wrap">
											<p style="color: red;font-size: 15px" id="fullname"></p>

									</div>
								</div>
							</div>

							<div class="control-group">
								<div class="controls">
									<div class="span6 m-wrap">
										<label style="font-weight: bold">Password(*)</label> <input
											type="password" name="password" value="" id="password"
											placeholder="********************" class="span11 m-wrap">
									</div>

									<div class="span6 m-wrap">
										<label style="font-weight: bold">Confirm password(*)</label>
										<input type="password" name="confirmpassword" value=""
											placeholder="********************" class="span11 m-wrap">
									</div>
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<div class="span4 m-wrap">
										<label style="font-weight: bold">Role(*)</label>
										<select name="role">
											<option value="ADMIN">ADMIN</option>
											<option selected="selected" value="MOD">MOD</option>
										</select>
									</div>
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<input type="submit" name="them" value="Thêm người dùng"
										class="btn btn-success">
									<a href="<%=request.getContextPath() %>/admin/users" class="btn btn-success">Hủy</a>
								</div>
							</div>
						</form>
						<script type="text/javascript">
							$(document)
							.ready(
							function() {
								$("#addUser")
									.validate(
										{
											rules : {
												username : {
													required : true,
													maxlength : 30,
												},
												fullname : {
													required : true,
													maxlength : 50,
												},
												password : {
													required : true,
													maxlength : 50,
												},
												confirmpassword : {
													required : true,
													equalTo : "#password",
												},
											},
											messages : {
												username : {
													required : "<span style='color:red'>Tên đăng nhập không được để trống!</span>",
													maxlength : "<span style='color:red'>Tối đa 30 kí tự!</span>",
												},
												fullname : {
													required : "<span style='color:red'>Tên đầy đủ không được để trống!</span>",
													maxlength : "<span style='color:red'>Tối đa 50 kí tự!</span>",
												},
												password : {
													required : "<span style='color:red'>Mật khẩu không được để trống!</span>",
													maxlength : "<span style='color:red'>Tối đa 50 kí tự!</span>",
												},
												confirmpassword : {
													required : "<span style='color:red'>Nhập lại mật khẩu!</span>",
													equalTo : "<span style='color:red'>Mật khẩu không trùng!</span>",
												},
											},
										});
							});
							
							function check(){
				        		var check = true;
				        		var check1 = true;
				        		var username = document.form1.username.value;
				        		var fullname = document.form1.fullname.value;
				        		for(var i =0;i<username.length;i++){
				        			if(username[i] == '!' || username[i] == '@' || username[i] == '#'|| username[i] == '$'|| username[i] == '%'
				        				|| username[i] == '^' || username[i] == '&'){
				        				document.getElementById("username").innerHTML = "Username không chứa ký tự đặc biệt!";
				        				document.form1.username.focus();
				        				check = false;
				        			}
				        			if(username[i] == ' '){
				        				document.getElementById("username").innerHTML = "Username không chứa ký tự trắng!";
				        				document.form1.username.focus();
				        				check = false;
				        			}
				        		}
				        		if(check == true) document.getElementById("username").innerHTML = "";
				        		for(var i =0;i<fullname.length;i++){
				        			if(fullname[i] == '!' || fullname[i] == '@' || fullname[i] == '#'|| fullname[i] == '$'|| fullname[i] == '%'
				        				|| fullname[i] == '^' || fullname[i] == '&'){
				        				document.getElementById("fullname").innerHTML = "Fullname không chứa ký tự đặc biệt!";
				        				document.form1.fullname.focus();
				        				check1 = false;
				        			}
				        		}
				        		if(check == true && check1 == false){
				        			check = false;
				        		}
				        		else if(check1 == true) document.getElementById("fullname").innerHTML = "";
				        		return check;
				        	}
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--Footer-part-->
<%@include file="/templates/admin/inc/footer.jsp"%>
<script
	src="<%=request.getContextPath()%>/templates/admin/js/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/templates/admin/js/jquery.ui.custom.js"></script>
<script
	src="<%=request.getContextPath()%>/templates/admin/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/templates/admin/js/jquery.uniform.js"></script>
<script
	src="<%=request.getContextPath()%>/templates/admin/js/select2.min.js"></script>
<script
	src="<%=request.getContextPath()%>/templates/admin/js/jquery.validate.js"></script>
<script
	src="<%=request.getContextPath()%>/templates/admin/js/matrix.js"></script>
<script
	src="<%=request.getContextPath()%>/templates/admin/js/matrix.form_validation.js"></script>
</body>
</html>
