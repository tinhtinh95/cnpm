<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="javascript:void(0)" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a></div>
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
  <div class="container-fluid">
    <div class="quick-actions_homepage">
      <ul class="quick-actions">
      	<li class="bg_lb span2"> <a href="<%=request.getContextPath() %>/admin/HocVien"> <i class="icon-user"></i> Học viên</a> </li>
        <li class="bg_lg span3"> <a href="<%=request.getContextPath() %>/admin/category"> <i class="icon-folder-open"></i>Danh mục tin</a> </li>
        <li class="bg_ly span2"> <a href="<%=request.getContextPath() %>/admin/NhanSu"> <i class="icon-user"></i>Nhân sự</a> </li>
        <%-- <li class="bg_ly span2"> <a href="<%=request.getContextPath() %>/admin/BacSi"> <i class="icon-user"></i>Bác sĩ</a> </li>
        <li class="bg_lo span3"> <a href="<%=request.getContextPath() %>/admin/GiangVien"> <i class="icon-user"></i> Giảng viên</a> </li> --%>
        <li class="bg_ls span3"> <a href="<%=request.getContextPath() %>/admin/news"> <i class="icon-book"></i>Tin tức</a> </li>
        <li class="bg_lo span2"> <a href="<%=request.getContextPath() %>/admin/question"> <i class="icon-envelope-alt"></i>Câu hỏi</a>
        <li class="bg_lb span3"> <a href="<%=request.getContextPath() %>/admin/users"> <i class="icon-user"></i>Người dùng</a>
        <%-- <li class="bg_lg"> <a href="<%=request.getContextPath() %>/admin/calendar"> <i class="icon-calendar"></i>Lịch</a> </li> --%>

      </ul>
    </div>
<!--End-Action boxes-->    

<!--Chart-box-->    
    <div class="row-fluid">
      <div class="widget-box">
        <div class="widget-content" >
          <div class="row-fluid">
            <div class="span7">
            		<table width="100%" style="background: #99FFFF; height: 100px; border-radius:15px">
					<tr>
						<td><h1
								style="text-transform: uppercase; color: red">
								<marquee behavior="alternate" style="font-size:50px">SE04</marquee>
							</h1></td>
					</tr>
				</table> 
				<p style="margin-top:12px"></p>
				<table  class="table table-bordered table-striped">
					<tr>
							<th>STT</th>
		                    <th>Họ tên</th>
                  			<th>Đơn vị</th>
                  			<th>Ngày sinh</th>
                  			<th>Lớp</th>
		                </tr>
		              <tbody>
			              		<tr>
			              		  <td width="5%" style="text-align:center">1</td>
				                  <td width="25%" style="text-align:center">Nguyễn Thị Tình</td>
				                  <td style="text-align:center">Đại học Bách Khoa Đà Nẵng</td>
				                  <td width="13%" style="text-align:center">01/01/1995 </td>
				                  <td width="13%" style="text-align:center">13T3</td>
				                </tr>
				                <tr>
			              		  <td width="5%" style="text-align:center">2</td>
				                  <td width="25%" style="text-align:center">Văn Phú Sơn</td>
				                  <td style="text-align:center">Đại học Bách Khoa Đà Nẵng</td>
				                  <td width="13%" style="text-align:center">01/01/1995 </td>
				                  <td width="13%" style="text-align:center">13T3</td>
				                </tr>
				                <tr>
			              		  <td width="5%" style="text-align:center">3</td>
				                  <td width="25%" style="text-align:center">Ngô Đức Nhân</td>
				                  <td style="text-align:center">Đại học Bách Khoa Đà Nẵng</td>
				                  <td width="13%" style="text-align:center">01/01/1995 </td>
				                  <td width="13%" style="text-align:center">13T2</td>
				                </tr>
				                <tr>
			              		  <td width="5%" style="text-align:center">4</td>
				                  <td width="25%" style="text-align:center">Đặng Ngọc Vũ</td>
				                  <td style="text-align:center">Đại học Bách Khoa Đà Nẵng</td>
				                  <td width="13%" style="text-align:center">01/01/1995 </td>
				                  <td width="13%" style="text-align:center">13T2</td>
				                </tr>
				                <tr>
			              		  <td width="5%" style="text-align:center">5</td>
				                  <td width="25%" style="text-align:center">Trương Công Toàn</td>
				                  <td style="text-align:center">Đại học Bách Khoa Đà Nẵng</td>
				                  <td width="13%" style="text-align:center">01/01/1995 </td>
				                  <td width="13%" style="text-align:center">13T3</td>
				                </tr>
		              </tbody>
				</table> 
            </div>
            <%
                int countHv=(Integer)request.getAttribute("countHv");
            	int countUsers = (Integer)request.getAttribute("countUsers");
            	int countQues = (Integer)request.getAttribute("countQues");
            	int countDoc = (Integer)request.getAttribute("countDoc");
            	int countTeacher = (Integer)request.getAttribute("countTeacher");
            	int countNews = (Integer)request.getAttribute("countNews");
            	
            %>
            <div class="span3">
              <ul class="site-stats">
                <li class="bg_lh"><a style="color:white" href="<%=request.getContextPath() %>/admin/users"><i class="icon-user"></i><strong><%=countUsers %></strong> <small>Người dùng</small></a></li>
                <li class="bg_lh"><a style="color:white" href="<%=request.getContextPath() %>/admin/question"><i class="icon-envelope-alt"></i> <strong><%=countQues %></strong> <small>Câu hỏi</small></a></li>
                <li class="bg_lh"><a style="color:white" href="<%=request.getContextPath() %>/admin/news"><i class="icon-book"></i> <strong><%=countNews %></strong> <small>Tin tức</small></a></li>
                <li class="bg_lh"><a style="color:white" href="<%=request.getContextPath() %>/admin/HocVien"><i class="icon-user"></i> <strong><%=countHv %></strong> <small>Học viên</small></a></li>
                <li class="bg_lh"><a style="color:white" href="<%=request.getContextPath() %>/admin/BacSi"><i class="icon-user"></i> <strong><%=countDoc %></strong> <small>Bác sĩ</small></a></li>
                <li class="bg_lh"><a style="color:white" href="<%=request.getContextPath() %>/admin/GiangVien"><i class="icon-user"></i> <strong><%=countTeacher %></strong> <small>Giảng viên</small></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
<!--End-Chart-box--> 
    <hr/>
    <div class="row-fluid">
    
      <div class="span6">
      	<div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-ok"></i></span>
            <h5>Admin</h5>
          </div>
          <div class="widget-content nopadding">
            <ul class="activity-list">
              <li><a href=""><i class="icon-user"></i>Website được thực hiện bởi <strong>Nhóm SE04</strong></a></li>
              <li><a><i class="icon-envelope"></i>Email <strong>SE04@gmail.com</strong></a></li>
              <li><a><i class="icon-phone"></i>Điện thoại <strong>0935.815.255</strong></a></li>
            </ul>
          </div>
        </div>
        
      </div>
      
      <div class="span6">
        <div class="widget-box">
        	<div class="widget-title"> <span class="icon"><i class="icon-folder-open"></i></span>
            	<h5>Thống kê danh mục</h5>
         	 </div>
			<br />
			<p style="text-align:center;color:blue;font-weight:bold;font-size:20px;">DANH MỤC TIN</p>
			<div class="templatemo-flex-row flex-content-row">
				<div class="templatemo-content-widget white-bg col-2">
					<i class="fa fa-times"></i>
					<div id="columnchart_values"></div>
				</div>
				<div class="templatemo-content-widget white-bg col-2">
					<i class="fa fa-times"></i>
					<table class="table table-bordered table-striped">
		              <thead>
		                <tr>
		                    <th>ID</th>
                  			<th>Tên danh mục</th>
                  			<th>Sửa</th>
                  			<th>Xóa</th>
		                </tr>
		              </thead>
		              <tbody>
			              <%
			              	ArrayList<Category> listCat = (ArrayList<Category>)request.getAttribute("listCat");
			              	for(Category objCat : listCat){
			              %>
			              		<tr>
				                  <td width="5%" style="text-align:center"><%=objCat.getId_cat() %></td>
				                  <td style="text-align:center"><%=objCat.getName_cat() %></td>
				                  <td width="13%" style="text-align:center">
				                  	<a style="color:blue" href="<%=request.getContextPath() %>/admin/edit-category?cid=<%=objCat.getId_cat() %>">Sửa<img src="<%=request.getContextPath() %>/templates/admin/img/pencil.gif" alt="edit" /> </a>
				                  </td>
				                  <td width="13%" style="text-align:center">
									<a style="color:blue" href="<%=request.getContextPath() %>/admin/del-category?cid=<%=objCat.getId_cat() %>" onclick="return confirm('Xóa danh mục này sẽ xóa hết các bài viết của danh mục bạn có đồng ý?')">Xóa <img src="<%=request.getContextPath() %>/templates/admin/img/bin.gif" width="16" height="16" alt="delete" /></a>
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
</div>

<!--end-main-container-part-->
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
