<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ModelCategory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/templates/public/inc/header2.jsp" %> 
		<div id="breadcrumb">
			<%-- <div class="container">
				<div role="navigation" aria-label="Breadcrumbs"
					class="breadcrumb-trail breadcrumbs" itemprop="breadcrumb">
					<ul class="trail-items" itemscope
						itemtype="http://schema.org/BreadcrumbList">
						<meta name="numberOfItems" content="3" />
						<meta name="itemListOrder" content="Ascending" />
						<li itemprop="itemListElement" itemscope
							itemtype="http://schema.org/ListItem"
							class="trail-item trail-begin"><a href="../../index.html"
							rel="home"><span itemprop="name">Home</span></a>
						<meta itemprop="position" content="1" /></li>
						<li itemprop="itemListElement" itemscope
							itemtype="http://schema.org/ListItem"
							class="trail-item trail-end"><span itemprop="name"> <%=objN.getName_cat() %></span>
						<meta itemprop="position" content="3" /></li>
					</ul>
				</div>
			</div> --%>
		</div>
		<div id="content" class="site-content">
			<div class="container">
				<div class="inner-wrapper">
					<div id="primary" class="content-area">
						<main id="main" class="site-main" role="main"> <header
							class="page-header">
							<%
							    String nameCat=(String)request.getAttribute("nameCat");
							%>
							<h1 class="page-title">Chuyên mục: <%=nameCat %></h1>
						</header>
						<%
							   ArrayList<News> listNewsByIDCat=(ArrayList<News>)request.getAttribute("listNewsByIDCat");
							   for(News objN: listNewsByIDCat){
								   String ngaydang=objN.getNgaydang();
								   String [] ngaynew=ngaydang.split("/");
							%>
						<article id="<%=objN.getId_news() %>"
							class="post-60 post type-post status-publish format-standard has-post-thumbnail hentry category-tin-noi-bat category-tin-tuc-su-kien">
							<a
								href="<%=request.getContextPath() %>/files/<%=objN.getHinhanh() %>"><img style="width:400px;height:200px"
								src="<%=request.getContextPath() %>/files/<%=objN.getHinhanh() %>"
								data-lazy-src="<%=request.getContextPath() %>/files/<%=objN.getHinhanh() %>"
								class="alignleft wp-post-image" alt="tac hia ma tuy da"
								data-lazy-srcset="<%=request.getContextPath() %>/files/<%=objN.getHinhanh() %>"
								data-lazy-sizes="(max-width: 400px) 100vw, 400px" />
							<noscript>
									<img width="400" height="200"
										src="<%=request.getContextPath() %>/files/<%=objN.getHinhanh() %>"
										class="alignleft wp-post-image" alt="tac hia ma tuy da"
										srcset="<%=request.getContextPath() %>/files/<%=objN.getHinhanh() %>"
										sizes="(max-width: 400px) 100vw, 400px" />
								</noscript></a>
							<div class="entry-content-wrapper">
								<div class="custom-entry-date">
									<span class="entry-month">Th<%=ngaynew[1] %></span> <span class="entry-day"><%=ngaynew[0] %></span>
								</div>
								<header class="entry-header">
									<h2 class="entry-title">
										<a
											href="<%=request.getContextPath() %>/newsdetail?nid=<%=objN.getId_news()%>"
											rel="bookmark"><%=objN.getName_news() %></a>
									</h2>
								</header>
								<footer class="entry-footer">
									<span
										class="cat-links"><a href="<%=request.getContextPath() %>/newsbyidcat?cid=<%=objN.getName_cat() %>"
										rel="category tag"><%=objN.getName_cat() %></a></span>
								</footer>
								<div class="entry-content">
									<p>
										<%=objN.getMota()%><a 
											href="<%=request.getContextPath() %>/newsdetail?nid=<%=objN.getId_news()%>"
											class="read-more">Xem chi tiết &gt;&gt;</a>
									</p>
								</div>
							</div>
						</article>
						<%} %>
						<!-- <nav class="navigation pagination" role="navigation">
							<h2 class="screen-reader-text">Điều hướng bài viết</h2>
							<div class="nav-links">
								<span class='page-numbers current'>1</span> <a
									class='page-numbers' href='tin-noi-bat/page/2.html'>2</a> <a
									class='page-numbers' href='tin-noi-bat/page/3.html'>3</a> <a
									class="next page-numbers" href="tin-noi-bat/page/2.html">Tiếp
									theo</a>
							</div>
						</nav> -->
						</main>
					</div>
					
<%@include file="/templates/public/inc/rightbar.jsp" %>

				</div>
			</div>
		</div>
		<%@include file="/templates/public/inc/footer.jsp"%>