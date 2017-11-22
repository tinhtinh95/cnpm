<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="<%=request.getContextPath() %>/admin/home" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="<%=request.getContextPath() %>/admin/category">Danh mục</a> <a href="javascript:void(0)" class="current">Thêm danh mục</a> </div>
    <h1 style="text-align:center">Thêm danh mục</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
      	<%
		  	int msg = 0;
		  	if(request.getParameter("msg") != null){
		  		msg = Integer.parseInt(request.getParameter("msg"));
		  		switch(msg){
		  			case 0:
		  				out.print("<span style='color:blue;font-weight:bold'>Tên danh mục đã tồn tại!</span>");
        				break;
		  		}
		  	}
	  	%>
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-folder-open"></i> </span>
            <h5>Danh mục</h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="" name="form1" id="addCategory" onsubmit="return check()">
              <div class="control-group">
                <label class="control-label">Tên danh mục(*)</label>
                <div class="controls">
                  <input type="text" name="name_cat" class="span8"/>
                  <p style="color: red;font-size: 15px" id="namecat"></p>
              	</div>
              </div>
              <div class="control-group">
                <div class="controls">
	                <input type="submit" name="them" value="Thêm danh mục" class="btn btn-success">
	                <a><button class="btn btn-success">Hủy</button></a>
                </div>
              </div>
            </form>
            <script type="text/javascript">
				$(document).ready(function(){
					$("#addCategory").validate({
						rules:{
							name_cat:{
								required: true,
								maxlength: 50,
							},
						},
						messages:{
							name_cat:{
								required: "<span style='color:red'>Tên danh mục không được để trống!</span>",
								maxlength: "<span style='color:red'>Tối đa 50 kí tự!</span>",
							},
						},
					});
				});
				
				function check(){
					var check = true;
	        		var namecat = document.form1.name_cat.value;
	        		for(var i =0;i<namecat.length;i++){
	        			if(namecat[i] == '!' || namecat[i] == '@' || namecat[i] == '#'|| namecat[i] == '$'|| namecat[i] == '%'
	        				|| namecat[i] == '^' || namecat[i] == '&'){
	        				document.getElementById("namecat").innerHTML = "Tên danh mục không chứa ký tự đặc biệt!";
	        				document.form1.name_cat.focus();
	        				check = false;
	        			}
	        		}
	        		if(check == true) document.getElementById("namecat").innerHTML = "";
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
