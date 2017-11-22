<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ModelCategory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<!-- Mirrored from tuvancainghien.gov.vn/lien-he by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 16 Apr 2017 08:23:59 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto%3A400%2C700%2C900%2C400italic%2C700italic%2C900italic&amp;subset=latin%2Clatin-ext" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="xmlrpc.php">
<title>Thông tin liên hệ &#8211; Trung Tâm Tư Vấn &#8211; Cai
	Nghiện Ma Tuý!</title>
<link rel='dns-prefetch' href='http://fonts.googleapis.com/' />
<link rel='dns-prefetch' href='http://s.w.org/' />
<link rel="alternate" type="application/rss+xml"
	title="Dòng thông tin Trung Tâm Tư Vấn - Cai Nghiện Ma Tuý! &raquo;"
	href="feed" />
<link rel="alternate" type="application/rss+xml"
	title="Dòng phản hồi Trung Tâm Tư Vấn - Cai Nghiện Ma Tuý! &raquo;"
	href="comments/feed" />
<script type="text/javascript">window._wpemojiSettings={"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/2.2.1\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/2.2.1\/svg\/","svgExt":".svg","source":{"concatemoji":"http:\/\/tuvancainghien.gov.vn\/wp-includes\/js\/wp-emoji-release.min.js"}};!function(a,b,c){function d(a){var b,c,d,e,f=String.fromCharCode;if(!k||!k.fillText)return!1;switch(k.clearRect(0,0,j.width,j.height),k.textBaseline="top",k.font="600 32px Arial",a){case"flag":return k.fillText(f(55356,56826,55356,56819),0,0),!(j.toDataURL().length<3e3)&&(k.clearRect(0,0,j.width,j.height),k.fillText(f(55356,57331,65039,8205,55356,57096),0,0),b=j.toDataURL(),k.clearRect(0,0,j.width,j.height),k.fillText(f(55356,57331,55356,57096),0,0),c=j.toDataURL(),b!==c);case"emoji4":return k.fillText(f(55357,56425,55356,57341,8205,55357,56507),0,0),d=j.toDataURL(),k.clearRect(0,0,j.width,j.height),k.fillText(f(55357,56425,55356,57341,55357,56507),0,0),e=j.toDataURL(),d!==e}return!1}function e(a){var c=b.createElement("script");c.src=a,c.defer=c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var f,g,h,i,j=b.createElement("canvas"),k=j.getContext&&j.getContext("2d");for(i=Array("flag","emoji4"),c.supports={everything:!0,everythingExceptFlag:!0},h=0;h<i.length;h++)c.supports[i[h]]=d(i[h]),c.supports.everything=c.supports.everything&&c.supports[i[h]],"flag"!==i[h]&&(c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&c.supports[i[h]]);c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&!c.supports.flag,c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.everything||(g=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",g,!1),a.addEventListener("load",g,!1)):(a.attachEvent("onload",g),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),f=c.source||{},f.concatemoji?e(f.concatemoji):f.wpemoji&&f.twemoji&&(e(f.twemoji),e(f.wpemoji)))}(window,document,window._wpemojiSettings);</script>
<style type="text/css">
img.wp-smiley,img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important
}
</style>
<link rel='stylesheet' id='contact-form-7-css'
	href='<%=request.getContextPath() %>/templates/public/wp-content/cache/busting/1/wp-content-plugins-contact-form-7-includes-css-styles-4.7.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='font-awesome-css'
	href='<%=request.getContextPath() %>/templates/public/wp-content/cache/busting/1/wp-content-themes-university-hub-third-party-font-awesome-css-font-awesome.min-4.7.0.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='jquery-sidr-css'
	href='<%=request.getContextPath() %>/templates/public/wp-content/cache/busting/1/wp-content-themes-university-hub-third-party-sidr-css-jquery.sidr.dark.min-2.2.1.css'
	type='text/css' media='all' />
<link rel='stylesheet' id='university-hub-style-css'
	href='<%=request.getContextPath() %>/templates/public/wp-content/cache/busting/1/wp-content-themes-university-hub-style-1.0.3.css'
	type='text/css' media='all' />
<script type='text/javascript'
	src='<%=request.getContextPath() %>/templates/public/wp-content/cache/busting/1/wp-includes-js-jquery-jquery-1.12.4.js'></script>
<script type='text/javascript'
	src='<%=request.getContextPath() %>/templates/public/wp-content/cache/busting/1/wp-includes-js-jquery-jquery-migrate.min-1.4.1.js'></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/jquery/jquery-1.12.3.min.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/jquery/jquery.validate.min.js"></script>
<link rel='https://api.w.org/' href='<%=request.getContextPath() %>/templates/public/wp-json/index.html' />
<link rel="EditURI" type="application/rsd+xml" title="RSD"
	href="xmlrpc0db0.php?rsd" />
<link rel="wlwmanifest" type="application/wlwmanifest+xml"
	href="<%=request.getContextPath() %>/templates/public/wp-includes/wlwmanifest.xml" />
<meta name="generator" content="WordPress 4.7.3" />
<link rel="canonical" href="" />
<link rel='shortlink' href='indexcb30.html?p=47' />
<link rel="alternate" type="application/json+oembed"
	href="<%=request.getContextPath() %>/templates/public/wp-json/oembed/1.0/embed9bfd.json?url=http%3A%2F%2Ftuvancainghien.gov.vn%2Flien-he" />
<link rel="alternate" type="text/xml+oembed"
	href="<%=request.getContextPath() %>/templates/public/wp-json/oembed/1.0/embed2f64?url=http%3A%2F%2Ftuvancainghien.gov.vn%2Flien-he&amp;format=xml" />
<script data-no-minify="1" data-cfasync="false">(function(w,d){function a(){var b=d.createElement("script");b.async=!0;b.src="<%=request.getContextPath() %>/templates/public/wp-content/plugins/wp-rocket/inc/front/js/lazyload.1.0.5.min.js";var a=d.getElementsByTagName("script")[0];a.parentNode.insertBefore(b,a)}w.attachEvent?w.attachEvent("onload",a):w.addEventListener("load",a,!1)})(window,document);</script>
</head>
<body
	class="page-template-default page page-id-47 wp-custom-logo home-content-not-enabled global-layout-right-sidebar slider-disabled">
	<div id="page" class="hfeed site">
		<a class="skip-link screen-reader-text" href="">Skip to
			content</a>
		<div id="tophead">
			<div class="container"></div>
		</div>
		<header id="masthead" class="site-header" role="banner">
			<div class="container">
				<div class="site-branding">
					<a href="" class="custom-logo-link" rel="home"
						itemprop="url"><img width="530" height="56"
						src="<%=request.getContextPath() %>/templates/public/wp-content/uploads/2017/04/logo-new-03.png"
						class="custom-logo" alt="" itemprop="logo"
						srcset="<%=request.getContextPath() %>/templates/public/wp-content/uploads/2017/04/logo-new-03.png 530w, <%=request.getContextPath() %>/templates/public/wp-content/uploads/2017/04/logo-new-03-400x42.png 400w"
						sizes="(max-width: 530px) 100vw, 530px" /></a>
				</div>
				<div id="quick-contact">
					<ul>
						<li class="quick-call-info"><a class="quick-call"
							href="">01666.355.323</a> 
							<a class="quick-email"
							href="">cainghienBKDN@gmail.com</a></li>
						<li class="quick-address-info"><span class="main-address">SE04</span> <span class="sub-address">Đại học Bách Khoa Đà Nẵng</span></li>
					</ul>
				</div>
				<div id="main-nav">
					<nav id="site-navigation" class="main-navigation" role="navigation">
						<div class="wrap-menu-content">
							<div class="menu-menu-1-container">
								<ul id="primary-menu" class="menu">
								
								<%
								    String string=(String)request.getAttribute("select");
								    String gt="";String tc="";String ch="";String tt="";
								    String select="class='menu-item menu-item-type-post_type menu-item-object-page menu-item-home current-menu-item page_item page-item-19 current_page_item menu-item-21'";
								    if( string.equals("gioi-thieu")){
								    	gt=select;
								    }
								    else if(string.equals("trang-chu")){
								    	tc=select;
								    }else if(string.equals("lien-he")){
								    	ch=select;
								    }else if(string.equals("tin-tuc")){
								    	tt=select;
								    }
								    
								%>
								
									<li
										<%=tc %>><a
										href="<%=request.getContextPath() %>/trang-chu">Trang chủ</a></li>
									
									<li
										<%=gt %>><a
										href="<%=request.getContextPath() %>/gioi-thieu">Giới thiệu</a></li>
									
									<li
										<%=tt %>><a
										href="">Tin tức &#038; sự
											kiện</a>
									<ul class="sub-menu">
									<%
										ModelCategory mCat = new ModelCategory();
										ArrayList<Category> listCat = mCat.getList();
										for(Category objCat: listCat){
									%>
											<li
												class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-37"><a
												href="<%=request.getContextPath() %>/newsbyidcat?cid=<%=objCat.getId_cat() %>"><%=objCat.getName_cat() %></a></li>
									<%
										}
									%>
										</ul></li>
									
									<li
										<%=ch %>><a
										href="<%=request.getContextPath() %>/question">Giải đáp thắc mắc</a></li>
								</ul>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</header>