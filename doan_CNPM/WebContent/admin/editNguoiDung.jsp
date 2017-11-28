<%@page import="bean.Users"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="<%=request.getContextPath() %>/admin/home" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="<%=request.getContextPath() %>/admin/users">Người dùng</a> <a href="javascript:void(0)" class="current">Sửa người dùng</a> </div>
    <h1 style="text-align:center">Sửa người dùng</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-user"></i> </span>
            <h5>Người dùng</h5>
          </div>
          <div class="widget-content nopadding">
          <%
          	Users objUser = (Users)request.getAttribute("objUser");
          %>
			<form class="form-horizontal" method="post" action="" id="editUser" name="form1" onsubmit="return check()">
	              <div class="control-group">
	                <div class="controls">
		                <div class="span4 m-wrap">
		                	<label style="font-weight:bold">Username(*)</label>
			                <span style="color:blue;font-size:25px;font-weight:bold" ><%=objUser.getUsername() %></span>
		                </div>
		                
		                <div class="span4 m-wrap">
		                	<label style="font-weight:bold">Fullname(*)</label>
			                <input type="text" name="fullname" value="<%=objUser.getFullname() %>" placeholder="Nhập tên đầy đủ" class="span12 m-wrap">
			                <p style="color: red;font-size: 15px" id="fullname"></p>
		                </div>
	              	</div>
	              </div>
	              
	              <div class="control-group">
	                <div class="controls">
		                <div class="span6 m-wrap">
		                	<label style="font-weight:bold">Password(*)</label>
			                <input type="password" name="password" placeholder="********************" class="span12 m-wrap" id="password">
		                </div>
		                
		                <div class="span6 m-wrap">
		                	<label style="font-weight:bold">Confirm password(*)</label>
			                <input type="password" name="confirmpassword" placeholder="********************" class="span10 m-wrap">
		                </div>
	              	</div>
	              </div>
	              <div class="control-group">
								<div class="controls">
									<div class="span4 m-wrap">
										<label style="font-weight: bold">Role(*)</label>
										<%
											String selected = "";
											String selected1 = "";
											String selected2 = "";
											if("ADMIN".equals(objUser.getRole())){
												selected = "selected='selected'";
											}
											else if("MOD".equals(objUser.getRole())){
												selected1 = "selected='selected'";
											}
											else{
												selected = "selected='selected'";
											}
										%>
										<select name="role">
											<option <%=selected %> value="ADMIN">ADMIN</option>
											<option <%=selected1 %> value="MOD">MOD</option>
											<option <%=selected2 %> value="MEMBER">MEMBER</option>
										</select>
									</div>
								</div>
							</div>
	              
	           	  <div class="control-group">
	                <div class="controls">
		                <input type="submit" name="sua" value="Sửa người dùng" class="btn btn-success">
		                <a href="<%=request.getContextPath() %>/admin/users" class="btn btn-success">Hủy</a>
	                </div>
	              </div>
	         </form>
	         <script type="text/javascript">
				$(document).ready(function(){
					$("#editUser").validate({
						rules:{
							fullname:{
								required: true,
								maxlength: 50,
							},
							confirmpassword:{
								equalTo: "#password",
							},
						},
						messages:{
							fullname:{
								required: "<span style='color:red'>Tên đầy đủ không được để trống!</span>",
								maxlength: "<span style='color:red'>Tối đa 50 kí tự!</span>",
							},
							confirmpassword:{
								equalTo: "<span style='color:red'>Mật khẩu không trùng!</span>",
							},
						},
					});
				});
				
				function check(){
	        		var check = true;
	        		var fullname = document.form1.fullname.value;
	        		for(var i =0;i<fullname.length;i++){
	        			if(fullname[i] == '!' || fullname[i] == '@' || fullname[i] == '#'|| fullname[i] == '$'|| fullname[i] == '%'
	        				|| fullname[i] == '^' || fullname[i] == '&'){
	        				document.getElementById("fullname").innerHTML = "Fullname không chứa ký tự đặc biệt!";
	        				document.form1.fullname.focus();
	        				check = false;
	        			}
	        		}
	        		if(check == true){
	        			document.getElementById("fullname").innerHTML = "";
	        		}
	        		return check;
	        	}
			</script>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="/templates/admin/inc/footer.jsp" %>
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.ui.custom.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/bootstrap.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.uniform.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/select2.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.validate.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.form_validation.js"></script>
</body>
</html>
