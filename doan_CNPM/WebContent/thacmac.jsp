<%@page import="bean.News"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ModelCategory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/templates/public/inc/header2.jsp" %>
		<!-- <div id="breadcrumb">
			<div class="container">
				<div role="navigation" aria-label="Breadcrumbs"
					class="breadcrumb-trail breadcrumbs" itemprop="breadcrumb">
					<ul class="trail-items" itemscope
						itemtype="http://schema.org/BreadcrumbList">
						<meta name="numberOfItems" content="2" />
						<meta name="itemListOrder" content="Ascending" />
						<li itemprop="itemListElement" itemscope
							itemtype="http://schema.org/ListItem"
							class="trail-item trail-begin"><a href="index.html"
							rel="home"><span itemprop="name">Home</span></a>
						<meta itemprop="position" content="1" /></li>
						<li itemprop="itemListElement" itemscope
							itemtype="http://schema.org/ListItem"
							class="trail-item trail-end"><span itemprop="name">Đặt câu hỏi thắc mắc</span>
						<meta itemprop="position" content="2" /></li>
					</ul>
				</div>
			</div>
		</div> -->
		<div id="content" class="site-content">
			<div class="container">
				<div class="inner-wrapper">
					<div id="primary" class="content-area">
						<main id="main" class="site-main" role="main">
						<article id="post-47"
							class="post-47 page type-page status-publish hentry">
							<div class="entry-content-wrapper">
								<div class="entry-content">
										<form action="" method="post" id="addQues" onsubmit="return check()" name="form1">
											<p>
												<label> Tên của bạn (Bắt buộc)<br /> <input
														type="text" name="yourname" value="" size="40"
														 />
														 <span style="color: red;font-size: 15px" id="yourname"></span>
												</label>
											</p>
											<p>
												<label> Địa chỉ mail của bạn (Bắt buộc)<br /><input
														type="text" name="youremail" value="" size="40"
														 />
														 <span style="color: red;font-size: 15px" id="youremail"></span>
												</label>
											</p>
											<p>
												<label> Nội dung câu hỏi<br /> <textarea
															name="yourquestion" cols="40" rows="10"
															></textarea>
												</label>
											</p>
											<p>
												<input type="submit" value="Gửi"
													 name="submit" />
											</p>
										</form>
										<script type="text/javascript">
											$(document).ready(function(){
												$("#addQues").validate({
													rules:{
														yourname:{
															required: true,
															maxlength: 50,
														},
														youremail:{
															required: true,
															maxlength: 50,
															email: true, 
														},
														yourquestion:{
															required: true,
														},
													},
													messages:{
														yourname:{
															required: "<span style='color:red'>Tên người hỏi không được để trống!</span>",
															maxlength: "<span style='color:red'>Tối đa 50 kí tự!</span>",
														},
														youremail:{
															required: "<span style='color:red'>Email không được để trống!</span>",
															maxlength: "<span style='color:red'>Tối đa 50 kí tự!</span>",
															email:  "<span style='color:red'>Email phải đúng định dạng!</span>",
														},
														yourquestion:{
															required: "<span style='color:red'>Nội dung câu hỏi không được để trống!</span>",
														},
													},
												});
											});
											
											function check(){
								        		var check = true;
								        		//var check1 = true;
								        		var yourname = document.form1.yourname.value;
								        		//var youremail = document.form1.youremail.value;
								        		for(var i =0;i<yourname.length;i++){
								        			if(yourname[i] == '!' || yourname[i] == '@' || yourname[i] == '#'|| yourname[i] == '$'|| yourname[i] == '%'
								        				|| yourname[i] == '^' || yourname[i] == '&'){
								        				document.getElementById("yourname").innerHTML = "Tên người hỏi không chứa ký tự đặc biệt!";
								        				document.form1.yourname.focus();
								        				check = false;
								        			}
								        		}
								        		if(check == true) document.getElementById("yourname").innerHTML = "";
								        		/* for(var i =0;i<youremail.length;i++){
								        			if(youremail[i] == '!' || youremail[i] == '@' || youremail[i] == '#'|| youremail[i] == '$'|| youremail[i] == '%'
								        				|| youremail[i] == '^' || youremail[i] == '&'){
								        				document.getElementById("youremail").innerHTML = "Email không chứa ký tự đặc biệt!";
								        				document.form1.youremail.focus();
								        				check1 = false;
								        			}
								        			if(youremail[i] == ' '){
								        				document.getElementById("youremail").innerHTML = "Email không chứa ký tự trắng!";
								        				document.form1.youremail.focus();
								        				check1 = false;
								        			}
								        		}
								        		if(check == true && check1 == false){
								        			check = false;
								        		}
								        		else if(check1 == true) document.getElementById("youremail").innerHTML = "";
								        		return check; */
								        	}
										</script>
								</div>
							</div>
							<footer class="entry-footer"> </footer>
						</article>
						</main>
					</div>
					
<%@include file="/templates/public/inc/rightbar.jsp" %>

				</div>
			</div>
		</div>
		<%@include file="/templates/public/inc/footer.jsp" %>