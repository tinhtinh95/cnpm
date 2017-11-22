<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/templates/public/inc/header2.jsp" %> 
		<div id="breadcrumb">
		<%
		    News objNewsDetail=(News)request.getAttribute("objNews");
		%>
			<%-- <div class="container">
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
							class="trail-item trail-end"><span itemprop="name"><%=objNewsDetail.getName_news() %></span>
						<meta itemprop="position" content="2" /></li>
					</ul>
				</div>
			</div> --%>
		</div>
		<div id="content" class="site-content">
			<div class="container">
				<div class="inner-wrapper">
					<div id="primary" class="content-area">
						<main id="main" class="site-main" role="main">
						<article id="<%=objNewsDetail.getId_news() %>"
							class="post-60 post type-post status-publish format-standard has-post-thumbnail hentry category-tin-noi-bat category-tin-tuc-su-kien">
							<header class="entry-header">
								<h1 class="entry-title"><%=objNewsDetail.getName_news() %></h1>
							</header>
							<footer class="entry-footer">
								<span class="posted-on"><a
									href=""
									rel="bookmark"><time class="entry-date published"
											datetime="2016-08-22T14:58:27+00:00"><%=objNewsDetail.getNgaydang() %></time>
										<time class="updated" datetime="2017-03-29T16:14:33+00:00"><%=objNewsDetail.getNgaydang() %></time></a></span><span
									class="cat-links"><a
									href="<%=request.getContextPath() %>/newsbyidcat?cid=<%=objNewsDetail.getId_cat() %>"
									rel="category tag"><%=objNewsDetail.getId_cat() %></a></span>
							</footer>
							<img style="width:600px;height:300px"
								src="<%=request.getContextPath() %>/files/<%=objNewsDetail.getHinhanh() %>"
								data-lazy-src="<%=request.getContextPath() %>/files/<%=objNewsDetail.getHinhanh() %>"
								class="aligncenter wp-post-image" alt="tac hia ma tuy da"
								data-lazy-srcset="<%=request.getContextPath() %>/files/<%=objNewsDetail.getHinhanh() %>"
								data-lazy-sizes="(max-width: 600px) 100vw, 600px" />
							<noscript>
								<img style="width:600px;height:300px"
									src="<%=request.getContextPath() %>/files/<%=objNewsDetail.getHinhanh() %>"
									class="aligncenter wp-post-image" alt="tac hia ma tuy da"
									srcset="<%=request.getContextPath() %>/files/<%=objNewsDetail.getHinhanh() %>"
									sizes="(max-width: 600px) 100vw, 600px" />
							</noscript>
							<div class="entry-content-wrapper">
								<div class="entry-content">
									<p><%=objNewsDetail.getChitiet() %></p>
								</div>
							</div>
						</article>
						</main>
					</div>
 <%@include file="/templates/public/inc/rightbar.jsp" %> 
				</div>
			</div>
		</div>
 <%@include file="/templates/public/inc/footer.jsp" %> 