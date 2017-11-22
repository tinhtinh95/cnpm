<%@page import="bean.Users"%>
<%@page import="java.sql.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="<%=request.getContextPath() %>/admin/home" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="javascript:void(0)" class="current">Người dùng</a> </div>
    <h1 style="text-align:center">Người dùng</h1>
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
			  				out.print("<span style='color:blue;font-weight:bold'>Thêm người dùng thành công!</span>");
	        				break;
			  			case 2:
			  				out.print("<span style='color:blue;font-weight:bold'>Sửa người dùng thành công!</span>");
	        				break;
			  			case 3:
			  				out.print("<span style='color:blue;font-weight:bold'>Xóa người dùng thành công!</span>");
	        				break;
			  		}
			  	}
		  	%>
        <div class="widget-box">
		  <br />
          &emsp;&ensp;
          <%
		                        Users objU=(Users) session.getAttribute("sObjUser");
		                        if("ADMIN".equals(objU.getRole())){
		                    %>
	      <div class="btn btn-info">
			  <!-- Button -->
			  <div>
		      	<a style="color:white" href="<%=request.getContextPath() %>/admin/add-user" title="Thêm người dùng" class="templatemo-white-button">Thêm người dùng</a>
			  </div>
		  </div>
		  <%} %>
          <div class="widget-content nopadding">
          	<br />
            <table id="myTable" class="table table-hover table-bordered table-striped data-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Username</th>
                  <th>Fullname</th>
                  <th>Role</th>
                  <th>Chức năng</th>
                </tr>
              </thead>
              <tbody>
              		<%
              			ArrayList<Users> listUsers = (ArrayList<Users>)request.getAttribute("listUsers");
              			for(Users objUser:listUsers){
              		%>
              				<tr>
			                  <td width="5%" style="text-align:center"><%=objUser.getId_user() %></td>
			                  <td style="text-align:center"><a href="javascript:void(0)" style="color:blue"><%=objUser.getUsername() %></a></td>
			                  <td style="text-align:center"><a href="" ><%=objUser.getFullname() %></a></td>
			                  <td style="text-align:center"><%=objUser.getRole() %></td>
			                  <td width="13%" style="text-align:center">
			                  <%
		                        if("ADMIN".equals(objU.getRole())){
		                    %>
		               				<a style="color:blue" href="<%=request.getContextPath() %>/admin/edit-user?uid=<%=objUser.getId_user() %>">Sửa<img src="<%=request.getContextPath() %>/templates/admin/img/pencil.gif" alt="edit" /> / </a>
									<a style="color:blue" href="<%=request.getContextPath() %>/admin/del-user?uid=<%=objUser.getId_user() %>" onclick="return confirm('Bạn có muốn xóa hay không?')">Xóa <img src="<%=request.getContextPath() %>/templates/admin/img/bin.gif" width="16" height="16" alt="delete" /></a>
									<%} %>
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
