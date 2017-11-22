<%@page import="bean.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="<%=request.getContextPath() %>/admin/home" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="<%=request.getContextPath() %>/admin/category">Danh mục</a> <a href="javascript:void(0)" class="current">Sửa danh mục</a> </div>
    <h1 style="text-align:center">Sửa danh mục</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-folder-open"></i> </span>
            <h5>Danh mục</h5>
          </div>
          <div class="widget-content nopadding">
          <%
          	Category objCat = (Category)request.getAttribute("objCat");
          %>
            <form class="form-horizontal" method="post" action="" name="form1" id="editCategory" onsubmit="return check()">
              <div class="control-group">
                <label class="control-label">Tên danh mục(*)</label>
                <div class="controls">
                  <input type="text" class="span8" name="name_cat" value="<%=objCat.getName_cat() %>">
                  <p style="color: red;font-size: 15px" id="namecat"></p>
                </div>
              </div>
              <div class="control-group">
                <div class="controls">
	                <input type="submit" name="sua" value="Sửa danh mục" class="btn btn-success">
	                <a href="<%=request.getContextPath() %>/admin/category" class="btn btn-success">Hủy</a>
                </div>
              </div>
            </form>
            <script type="text/javascript">
				$(document).ready(function(){
					$("#editCategory").validate({
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
<%@include file="/templates/admin/inc/footer.jsp" %>
<script src="<%=request.getContextPath() %>/templates/admin/js/excanvas.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.ui.custom.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/bootstrap.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.flot.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.flot.resize.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.peity.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/fullcalendar.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.dashboard.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.interface.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.validate.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.form_validation.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.uniform.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/select2.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.popover.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.dataTables.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.tables.js"></script>
</body>
</html>
