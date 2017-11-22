<%@page import="bean.News"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="<%=request.getContextPath() %>/admin/home" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="<%=request.getContextPath() %>/admin/news">Tin tức</a> <a href="" class="javascript:void(0)" class="current">Sửa tin tức</a> </div>
    <h1 style="text-align:center">Sửa tin tức</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-book"></i> </span>
            <h5>Tin tức</h5>
          </div>
          <div class="widget-content nopadding">
          	<%
          		News objNews = (News)request.getAttribute("objNews");
          	%>
            <form onsubmit="return check()" class="form-horizontal" enctype="multipart/form-data" method="post" action="" name="form1" id="editNews">
              <div class="control-group">
	              <label class="control-label">Tên tin tức(*)</label>
	              <div class="controls">
	                <input class="span8" type="text" name="name_news" value="<%=objNews.getName_news() %>" placeholder="">
	              </div>
              </div>
              <div class="control-group">
	              <label class="control-label">Danh mục(*)</label>
	              <div class="controls">
	                <select class="span4" name="category" >
	                	<option value="0">--Danh mục--</option>
	                <%
	                	ArrayList<Category> listCat = (ArrayList<Category>)request.getAttribute("listCat");
	                	for(Category objCat : listCat){
	                		String selected = "";
	                		if(objCat.getId_cat() == objNews.getId_cat()){
	                			selected = "selected='selected'";
	                		}
	                		else{
	                			selected = "";
	                		}
	                %>
	                		<option <%=selected %> value="<%=objCat.getId_cat() %>"><%=objCat.getName_cat() %></option>
	                <%
	                	}
	                %>
					</select>
	              </div>
              </div>
              <div class="controls">
              		<p style="color: red;font-size: 15px" id="danhmuc"></p>
              </div>
              <div class="control-group">
                <div class="controls">
                	<img style="width:200px;height:200px" src="<%=request.getContextPath() %>/files/<%=objNews.getHinhanh() %>">
              	</div>
              </div>
              <div class="control-group">
	              <label class="control-label">Hình ảnh</label>
	              <div class="controls">
	                <input type="file" name="picture" value="" />
	              </div>
              </div>
              <div class="control-group">
	              <label class="control-label">Mô tả(*)</label>
	              <div class="controls">
	                <textarea class="span11" name="preview" ><%=objNews.getMota() %></textarea>
	              </div>
              </div>
              <div class="control-group">
	              <label class="control-label">Chi tiết(*)</label>
	              <div class="controls">
	                <textarea name="detail" id="detail"><%=objNews.getChitiet() %></textarea>
	                <script type="text/javascript">
						CKEDITOR.replace("detail",{
							width: '810px',
							filebrowserBrowseUrl : '../ckfinder/ckfinder.html',
							filebrowserImageBrowseUrl : '../ckfinder/ckfinder.html?type=Images',
							filebrowserFlashBrowseUrl : '../ckfinder/ckfinder.html?type=Flash',
							filebrowserUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
							filebrowserImageUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
							filebrowserFlashUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
						});	                	
	                </script>
	              </div>
              </div>
              <div class="control-group">
                <div class="controls">
	                <input type="submit" name="sua" value="Sửa tin tức" class="btn btn-success">
	                <a href="<%=request.getContextPath() %>/admin/news" class="btn btn-success">Hủy</a>
                </div>
              </div>
            </form>
            <script type="text/javascript">
				$(document).ready(function(){
					$("#editNews").validate({
						rules:{
							name_news:{
								required: true,
								maxlength: 100,
							},
							preview:{
								required: true,
								maxlength: 100
							},
							detail:{
								required: true,
							},
						},
						messages:{
							name_news:{
								required: "<span style='color:red'>Tên tin tức không được để trống!</span>",
								maxlength: "<span style='color:red'>Tối đa 100 kí tự!</span>",
							},
							preview:{
								required: "<span style='color:red'>Mô tả không được để trống!</span>",
								maxlength: "<span style='color:red'>Tối đa 100 kí tự!</span>",
							},
							detail:{
								required: "<span style='color:red'>Chi tiết không được để trống!</span>",
							},
						},
					});
				});
				
				function check(){
					var check = true;
					var danhmuc = document.form1.category.value;
					if(danhmuc == 0){
						document.getElementById("danhmuc").innerHTML = "Chưa chọn danh mục!";
						check = false;
					}
					if(check == true) document.getElementById("danhmuc").innerHTML = "";
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
