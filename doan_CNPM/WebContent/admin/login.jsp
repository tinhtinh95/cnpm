<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
<head>
        <title>Matrix Admin</title><meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/css/bootstrap.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/css/matrix-login.css" />
        <link href="<%=request.getContextPath() %>/templates/admin/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
		<script type="text/javascript" src="<%=request.getContextPath() %>/jquery/jquery-1.12.3.min.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/jquery/jquery.validate.min.js"></script>

    </head>
    <body>
        <div id="loginbox">
            <form onsubmit="return check()" id="loginform" name="form1" class="form-vertical" action="">
				 <div class="control-group normal_text"> <h3><img src="<%=request.getContextPath() %>/templates/admin/img/logo.png" alt="Logo" /></h3></div>
				 <%
	        		int msg = 0;
	        		if(request.getParameter("msg") != null){
	        			msg = Integer.parseInt(request.getParameter("msg"));
	        			switch(msg){
	        			case 0:
	        				out.print("<span style='color:red;font-weight:bold'>Tên đăng nhập không tồn tại!</span>");
	        				break;
	        			case 1:
	        				out.print("<span style='color:red;font-weight:bold'>Nhập sai mật khẩu!</span>");
	        				break;
	        			}
	        		}
	        	%>
                <div class="control-group">
                    <div>
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"> </i></span><input type="text" name="username" placeholder="Username" />
                            <span style="color: red;font-size: 15px" id="username"></span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div>
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span><input type="password" name="password" placeholder="Password" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-right"><input style="font-size:18px" name="submit" type="submit" href="" value="Đăng nhập" class="flip-link btn btn-info" /></span>
                </div>
            </form>
            <script type="text/javascript">
	        	$(document).ready(function(){
					$("#loginform").validate({
						rules:{
							username:{
								required: true,
								maxlength: 30,
							},
							password:{
								required: true,
								maxlength: 50,
							},
						},
						messages:{
							username:{
								required: "<span style='color:red'>Tên đăng nhập không được để trống!</span>",
								maxlength: "<span style='color:red'>Nhập tên đăng nhập tối đa 30 ký tự!</span>",
							},
							password:{
								required: "<span style='color:red'>Mật khẩu không được để trống!</span>",
								maxlength: "<span style='color:red'>Nhập mật khẩu tối đa 50 ký tự!</span>",
							},
						},
					});
				});
	        	
	        	function check(){
	        		var check = true;
	        		var username = document.form1.username.value;
	        		for(var i =0;i<username.length;i++){
	        			if(username[i] == '!' || username[i] == '@' || username[i] == '#'|| username[i] == '$'|| username[i] == '%'
	        				|| username[i] == '^' || username[i] == '&'){
	        				document.getElementById("username").innerHTML = "Username không chứa ký tự đặc biệt!";
	        				check = false;
	        			}
	        			if(username[i] == ' '){
	        				document.getElementById("username").innerHTML = "Username không chứa ký tự trắng!";
	        				check =  false;
	        			}
	        		}
	        		if(check == true){
	        			document.getElementById("username").innerHTML = "";
	        		}
	        		return check;
	        	}
        	</script>

        </div>
        
        <script src="<%=request.getContextPath() %>/templates/admin/js/jquery.min.js"></script>  
		<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.validate.js"></script> 
    </body>
</html>
