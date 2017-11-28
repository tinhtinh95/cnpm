<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean.HocVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="" title="Học viên">HỌC VIÊN</a> </div>
    <%
    HocVien objDetail=(HocVien)request.getAttribute("objDetail");
    %>
    <h1 style="text-align:center">Học viên <%=objDetail.getTenHV() %></h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
    <script type="text/javascript">
$(document).ready(function () {
	$("#my_table").dataTable().fnDestroy();
});
</script> 

<!-- <script type="text/javascript">
$(document).ready(function() {
	$('#my_table').dataTable( {
		//"bRetrieve":true,
		"aLengthMenu": [[3,5, 10,-1], [3,5, 10,"All"]],
		"iDisplayLength": 3,
		//"bDestroy": true,
		} );
});

</script> -->
      <div class="span12">
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
		      	<a style="color:white" href="<%=request.getContextPath() %>/admin/HocVien/editHocVien?mahv=<%=objDetail.getMaHV() %>" title="Sửa học viên" class="templatemo-white-button">Sửa</a>
			  </div>
		  </div>
		  <%} %>
          <div class="widget-content nopadding">
          <br />
          
          	<form method="post" action="">
	            <table class="table table-hover table-bordered table-striped data-table ">
	              <thead>
	                <tr>
	                  <th style="vertical-align:middle">Mã bác sĩ</th>
	                  <th style="vertical-align:middle">Mã giảng viên</th>
	                  <th style="vertical-align:middle">Lịch sử</th>
	                  <th style="vertical-align:middle">Điều trị</th>
	                </tr>
	              </thead>
	              <tbody>
		              	<tr>
		                  <td width="15%" style="vertical-align:middle;text-align:center"><%=objDetail.getMaGV() %></td>
		                  <td width="15%" style="vertical-align:middle;text-align:center"><%=objDetail.getMaBS() %></td>
		                  <td width="20%" style="vertical-align:middle;text-align:center"><%=objDetail.getLichSu() %></td>
		                  <td  style="vertical-align:middle;text-align:center"><%=objDetail.getDieutri() %></td>
		                </tr>
	              </tbody>
	            </table>
            </form>
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
