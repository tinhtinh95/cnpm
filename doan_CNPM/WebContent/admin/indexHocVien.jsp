<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean.HocVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="" title="Học viên"></i>HỌC VIÊN</a> </div>
    <h1 style="text-align:center">HỌC VIÊN</h1>
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
      <%
          		int msg = 0;
          		if(request.getParameter("msg") != null){
          			msg = Integer.parseInt(request.getParameter("msg"));
          			switch(msg){
          			case 0:
		  				out.print("<span style='color:blue;font-weight:bold'>Có lỗi trong quá trình thực hiện!</span>");
        				break;
		  			case 1:
		  				out.print("<span style='color:blue;font-weight:bold'>Thêm học viênthành công!</span>");
        				break;
		  			case 2:
		  				out.print("<span style='color:blue;font-weight:bold'>Sửa học viênthành công!</span>");
        				break;
		  			case 3:
		  				out.print("<span style='color:blue;font-weight:bold'>Xóa học viênthành công!</span>");
        				break;
          			}}
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
		      	<a style="color:white" href="<%=request.getContextPath() %>/admin/addHocVien" title="Thêm tin tức" class="templatemo-white-button">Thêm học viên</a>
			  </div>
		  </div>
		  <%} %>
          <div class="widget-content nopadding">
          <br />
          
          	<form method="post" action="">
	            <table id="my_table" class="table table-hover table-bordered table-striped data-table ">
	              <thead>
	                <tr>
	                  <th style="vertical-align:middle">Mã học viên</th>
	                  <th style="vertical-align:middle">Tên học viên</th>
	                  <th style="vertical-align:middle">Ngày sinh</th>
	                  <th style="vertical-align:middle">Giới tính</th>
	                  <th style="vertical-align:middle">Quê quán</th>
	                  <th style="vertical-align:middle">Mức độ</th>
	                  <th style="vertical-align:middle">Ngày vào</th>
	                  <th style="vertical-align:middle">Ngày ra</th>
	                  <%
		                        if("ADMIN".equals(objU.getRole())){
		                    %>
	                  <th style="vertical-align:middle">Chức năng</th>
	                  <%} %>
	                </tr>
	              </thead>
	              <tbody>
	              <%
	              int i=1;
				ArrayList<HocVien> listItem =(ArrayList<HocVien>) request.getAttribute("listItem");
				for (HocVien objItem : listItem){ 
				%>
		              	<tr>
		                  <td style="text-align:center;vertical-align:middle"><%=objItem.getMaHV() %></td>
		                  <td  style=""><%=objItem.getTenHV() %></td>
		                  <%
		                      SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
		                      String ns=sdf.format(objItem.getNgaySinh());
		                      String nv=sdf.format(objItem.getNgayVao());
		                      String nr="";
		                      if(objItem.getNgayRa()==null){
		                    	  nr="Chưa xác định";
		                      }else{
		                    	  nr=sdf.format(objItem.getNgayRa());
		                      }
		                  %>
		                  <td  style="text-align:center"><%=ns %></td>
		                  <%
		                      if(objItem.getGioitinh()==1){
		                  %>
		                  <td style="text-align:center">Nam</td>
		                  <%}else{ %>
		                  <td style="text-align:center">Nữ</td>
		                  <%} %>
		                  <td  style="text-align:center"><%=objItem.getQueQuan() %></td>
		                  <td style="text-align:center"><%=objItem.getMucDo() %></td>
		                  <td style="text-align:center"><%=nv %></td>
		                  <td style="text-align:center"><%=nr %></td>
		                  <%
		                        if("ADMIN".equals(objU.getRole())){
		                    %>
		                  <td style="text-align:center;=">
		                  	<a style="color:blue" href="<%=request.getContextPath() %>/admin/HocVien/chitietHocVien?mahv=<%=objItem.getMaHV() %>">Chi tiết<img src="<%=request.getContextPath() %>/templates/admin/img/pencil.gif" alt="edit" /> / </a>
							<a style="color:blue" href="<%=request.getContextPath() %>/admin/HocVien/delHocVien?mahv=<%=objItem.getMaHV() %>" onclick="return confirm('Bạn có muốn xóa hay không?')">Xóa <img src="<%=request.getContextPath() %>/templates/admin/img/bin.gif" width="16" height="16" alt="delete" /></a>
						  </td>
							<%} %>
		                </tr>
		              <% i++;} %>
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
<%-- <script type="text/javascript">
	function setActive(nid, active){
		$.ajax({
			url: '<%=request.getContextPath()%>/active',
			type: 'POST',
			cache: false,
			data: {
				anid: nid, aactive: active
			},
			success: function(data){
				$('#setactive-' + nid).html(data);
			},
			error: function (){
				alert('Có lỗi xảy ra');
			}
		});
		return false;
	}
	
	function valDels(){
		var checked = false;
	    $('input[type="checkbox"][name="checkbox"]').each(function() {
	        if($(this).is(":checked")) {
	        	checked = true;
	        }
	    });
	    
	    if (checked == true){
			return confirm('Bạn có muốn xóa các mẫu tin đã chọn?');
	    } else {
	    	alert('Chọn ít nhất một tin để xóa!!');
	    	return false;
	    }
	}
</script> --%>
</body>
</html>
