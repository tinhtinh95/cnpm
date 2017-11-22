<%@page import="bean.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="<%=request.getContextPath() %>/admin/home" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="javascript:void(0)" class="current">Danh mục</a> </div>
    <h1 style="text-align:center">Danh mục</h1>
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
			  				out.print("<span style='color:blue;font-weight:bold'>Có lỗi trong quá trình thực hiện!</span>");
	        				break;
			  			case 1:
			  				out.print("<span style='color:blue;font-weight:bold'>Thêm danh mục thành công!</span>");
	        				break;
			  			case 2:
			  				out.print("<span style='color:blue;font-weight:bold'>Sửa danh mục thành công!</span>");
	        				break;
			  			case 3:
			  				out.print("<span style='color:blue;font-weight:bold'>Xóa danh mục thành công!</span>");
	        				break;
			  		}
			  	}
		  	%>
        <div class="widget-box">
		  <br />
          &emsp;&ensp;
          <%
		                       // Users objU=(Users) session.getAttribute("sObjUser");
		                       // if("ADMIN".equals(objU.getRole())){
		                    %>
	      <div class="btn btn-info">
			  <!-- Button -->
			  <div>
		      	<a style="color:white" href="<%=request.getContextPath() %>/admin/add-category" title="Thêm danh mục" class="templatemo-white-button">Thêm danh mục</a>
			  </div>
		  </div>
		  <%//} %>
          <div class="widget-content nopadding">
          	<br />
            <table id="myTable" class="table table-hover table-bordered table-striped data-table ">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Tên danh mục</th>
                  <th>Chức năng</th>
                </tr>
              </thead>
              <tbody>
              <%
              	ArrayList<Category> listCat = (ArrayList<Category>)request.getAttribute("listCat");
              	for(Category objCat : listCat){
              %>
              		<tr>
	                  <td width="5%" style="text-align:center"><%=objCat.getId_cat() %></td>
	                  <td style="text-align:center"><a href="<%=request.getContextPath() %>/admin/chitiet-danhmuc?cid=<%=objCat.getId_cat() %>" ><%=objCat.getName_cat() %></a></td>
	                  <td width="13%" style="text-align:center">
	                  <%
		                       // if("ADMIN".equals(objU.getRole())){
		                    %>
	                  	<a style="color:blue" href="<%=request.getContextPath() %>/admin/edit-category?cid=<%=objCat.getId_cat() %>">Sửa<img src="<%=request.getContextPath() %>/templates/admin/img/pencil.gif" alt="edit" /> / </a>
						<a style="color:blue" href="<%=request.getContextPath() %>/admin/del-category?cid=<%=objCat.getId_cat() %>" onclick="return confirm('Xóa danh mục này sẽ xóa hết các bài viết của danh mục bạn có đồng ý?')">Xóa <img src="<%=request.getContextPath() %>/templates/admin/img/bin.gif" width="16" height="16" alt="delete" /></a>
						<%//} %>
	                  </td>
	                </tr>
              <%
              	}
              %>
              </tbody>
            </table>
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
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.dataTables.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.tables.js"></script>

</body>
</html>
