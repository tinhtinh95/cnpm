<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean.GiangVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="javascript:void(0)" class="current">Giảng Viên</a> </div>
    <h1 style="text-align:center">Giảng Viên</h1>
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
			  				out.print("<span style='color:blue;font-weight:bold'>Thêm giảng viên thành công!</span>");
	        				break;
			  			case 2:
			  				out.print("<span style='color:blue;font-weight:bold'>Sửa giảng viên thành công!</span>");
	        				break;
			  			case 3:
			  				out.print("<span style='color:blue;font-weight:bold'>Xóa giảng viên thành công!</span>");
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
		      	<a style="color:white" href="<%=request.getContextPath() %>/admin/addGiangVien" class="templatemo-white-button">Thêm giảng viên</a>
			  </div>
		  </div>
		  <%} %>
          <div class="widget-content nopadding">
          <br />
          	<form method="post" action="">
          	
	            <table id="myTable" class="table table-hover table-bordered table-striped data-table ">
	              <thead>
	                <tr>
	                  <th style="vertical-align:middle">Mã giảng viên</th>
	                  <th style="vertical-align:middle">Tên giảng viên</th>
	                  <th style="vertical-align:middle">Ngày sinh</th>
	                  <th style="vertical-align:middle">Quê quán</th>
	                  <th style="vertical-align:middle">Giới tính</th>
	                  <th style="vertical-align:middle">Chức năng</th>
	                </tr>
	              </thead>
	              <tbody>
		              	<%
		              	
	              	ArrayList<GiangVien> listItem = (ArrayList<GiangVien>)request.getAttribute("listItem");
	              	for(GiangVien objItem : listItem){
	              %>
	              		<tr>
		                  <td width="10%" style="text-align:center;"><%=objItem.getMaGV() %></td>
		                  <td width="20%" style="text-align:center;"><%=objItem.getTenGV() %></td>
		                   <%
		                      SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
		                      String ns=sdf.format(objItem.getNgaySinh());
		                  %>
		                  <td width="17%" style="text-align:center;"><%=ns %></td>
		                  <td width="17%" style="text-align:center;"><%=objItem.getQuequan() %></td>
		                  <%
		                      if(objItem.getGioiTinh()==1){
		                  %><td width="17%" style="text-align:center;">Nam</td>
		                  <%}else{ %>
		                  <td width="17%" style="text-align:center;">Nữ</td>
		                  <%} %>
		                  <td width="20%" style="text-align:center;">
		                   <%
		                        if("ADMIN".equals(objU.getRole())){
		                    %>
		                  	<a style="color:blue" href="<%=request.getContextPath() %>/admin/editGiangVien?magv=<%=objItem.getMaGV() %>">Sửa<img src="<%=request.getContextPath() %>/templates/admin/img/pencil.gif" alt="edit" /> / </a>
							<a style="color:blue" href="<%=request.getContextPath() %>/admin/delGiangVien?magv=<%=objItem.getMaGV() %>" onclick="return confirm('Bạn có muốn xóa hay không?')">Xóa <img src="<%=request.getContextPath() %>/templates/admin/img/bin.gif" width="16" height="16" alt="delete" /></a>
							<%} %>
		                  </td>
		                </tr>
	              <%
	              	}
	              %>
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
<script type="text/javascript">
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
</script>
</body>
</html>
