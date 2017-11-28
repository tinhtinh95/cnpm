<%@page import="bean.News"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="<%=request.getContextPath() %>/admin/home" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="javascript:void(0)" class="current">Tin tức</a> </div>
    <h1 style="text-align:center">Tin tức</h1>
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
			  				out.print("<span style='color:blue;font-weight:bold'>Thêm tin tức thành công!</span>");
	        				break;
			  			case 2:
			  				out.print("<span style='color:blue;font-weight:bold'>Sửa tin tức thành công!</span>");
	        				break;
			  			case 3:
			  				out.print("<span style='color:blue;font-weight:bold'>Xóa tin tức thành công!</span>");
	        				break;
			  		}
			  	}
		  	%>
        <div class="widget-box">
          <br />
          &emsp;&ensp;
	      <div class="btn btn-info">
			  <!-- Button -->
			  <div>
		      	<a style="color:white" href="<%=request.getContextPath() %>/admin/add-news" title="Thêm tin tức" class="templatemo-white-button">Thêm tin tức</a>
			  </div>
		  </div>
          <div class="widget-content nopadding">
          <br />
          	<form method="post" action="">
	            <table id="myTable" class="table table-hover table-bordered table-striped data-table ">
	              <thead>
	                <tr>
	                  <th style="vertical-align:middle">ID</th>
	                  <th style="vertical-align:middle">Tên tin tức</th>
	                  <th style="vertical-align:middle">Mô tả</th>
	                  <th style="vertical-align:middle">Danh mục</th>
	                  <th style="vertical-align:middle">Hình ảnh</th>
	                  <th style="vertical-align:middle">Ngày đăng</th>
	                  <th style="vertical-align:middle">Chức năng</th>
	                </tr>
	              </thead>
	              <tbody>
	              <%
	              	ArrayList<News> listNews = (ArrayList<News>)request.getAttribute("listNews");
	              	for(News objNews : listNews){
	              %>
	              		<tr>
		                  <td width="5%" style="text-align:center;vertical-align:middle"><%=objNews.getId_news() %></td>
		                  <td width="20%" style="vertical-align:middle;"><%=objNews.getName_news() %></td>
		                  <td width="30%" style="vertical-align:middle;"><%=objNews.getMota() %></td>
						  <td width="10%" style="text-align:center;vertical-align:middle"><%=objNews.getName_cat() %></td>
		                  <td width="11%" style="text-align:center;vertical-align:middle">
		                	  <img style="width:100px;height:60px" src="<%=request.getContextPath() %>/files/<%=objNews.getHinhanh() %>">
		                  </td>
		                  <td width="10%" style="vertical-align:middle;text-align:center"><%=objNews.getNgaydang() %></td>
		                  <td width="15%" style="text-align:center;vertical-align:middle">
		                  	<a style="color:blue" href="<%=request.getContextPath() %>/admin/edit-news?nid=<%=objNews.getId_news() %>">Sửa<img src="<%=request.getContextPath() %>/templates/admin/img/pencil.gif" alt="edit" /> / </a>
							<a style="color:blue" href="<%=request.getContextPath() %>/admin/del-news?nid=<%=objNews.getId_news() %>" onclick="return confirm('Bạn có muốn xóa hay không?')">Xóa <img src="<%=request.getContextPath() %>/templates/admin/img/bin.gif" width="16" height="16" alt="delete" /></a>
							<%} %>
		                  </td>
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
