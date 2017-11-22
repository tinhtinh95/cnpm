<%@page import="bean.Users"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Admin</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/css/fullcalendar.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/css/uniform.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/css/select2.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/css/matrix-style.css" />
	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/css/matrix-media.css" />
<%-- 	<link rel="stylesheet" href="<%=request.getContextPath() %>/templates/admin/css/jquery.dataTables.min.css" /> --%>
	<link href="<%=request.getContextPath() %>/templates/admin/font-awesome/css/font-awesome.css" rel="stylesheet" />
	
	<!-- <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script> -->
	
	
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
	<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js" ></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/ckfinder/ckfinder.js" ></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/jquery/jquery-1.12.3.min.js" ></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/jquery/jquery.validate.min.js"></script>
</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Admin</a></h1>
</div>
<!--close-Header-part--> 

<!--top-Header-menu-->
<%
	Users objUserSession = (Users)session.getAttribute("sObjUser");
%>
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" >
    <a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Welcome <%=objUserSession.getFullname() %></span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="<%=request.getContextPath() %>/admin/edit-user?uid=<%=objUserSession.getId_user() %>"><i class="icon-user"></i> My Profile</a></li>
        <li class="divider"></li>
        <li><a href="<%=request.getContextPath() %>/logout"><i class="icon-key"></i>Đăng xuất</a></li>
      </ul>
    </li>
  </ul>
</div>
<!--close-top-Header-menu-->
<!--start-top-serch-->
<!--close-top-serch-->
<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i></a>
  <ul>
    <li><a href="<%=request.getContextPath() %>/admin/home"><i class="icon icon-home"></i> <span>Trang chủ</span></a> </li>
    <li><a href="<%=request.getContextPath() %>/admin/HocVien"><i class="icon icon-user"></i> <span>Học viên</span></a></li>
    <li> <a href="<%=request.getContextPath() %>/admin/NhanSu"><i class="icon icon-user"></i> <span>Nhân sự</span></a> </li>
    <li> <a href="<%=request.getContextPath() %>/admin/category"><i class="icon icon-folder-open"></i> <span>Danh mục tin</span> <span class="label label-important"></span></a> 
		<ul>
			<li><a href=""></a></li>
	    </ul>    
    </li>
    <li><a href="<%=request.getContextPath() %>/admin/news"><i class="icon icon-book"></i> <span>Tin tức</span></a></li>
    <li><a href="<%=request.getContextPath() %>/admin/users"><i class="icon icon-user"></i> <span>Người dùng</span> <span class="label label-important"></span></a>
    <li><a href="<%=request.getContextPath() %>/admin/question"><i class="icon icon-envelope-alt"></i> <span>Câu hỏi</span></a></li>
    <%-- <li><a href="<%=request.getContextPath() %>/admin/calendar"><i class="icon icon-calendar"></i> <span>Lịch</span></a></li> --%>
  </ul>
</div>