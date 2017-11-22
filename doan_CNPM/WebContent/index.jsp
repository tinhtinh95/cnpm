<%@page import="bean.News"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<%@include file="/templates/public/inc/header2.jsp" %>
		<div id="featured-slider">
			<div class="cycle-slideshow" id="main-slider" data-cycle-fx="fadeout"
				data-cycle-speed="1000" data-cycle-pause-on-hover="true"
				data-cycle-loader="true" data-cycle-log="false"
				data-cycle-swipe="true" data-cycle-auto-height="container"
				data-cycle-caption-template="&lt;div class=&quot;container&quot;&gt;&lt;div class=&quot;caption-wrap&quot;&gt;&lt;h3&gt;{{title}}&lt;/a&gt;&lt;/h3&gt;&lt;p&gt;{{excerpt}}&lt;/p&gt;{{buttons}}&lt;/div&gt;&lt;/div&gt;"
				data-cycle-timeout="0" data-cycle-slides="article">
				<div class="cycle-caption"></div>
				<article class="first"
					data-cycle-title="Giới thiệu&lt;span&gt;&lt;/span&gt;"
					data-cycle-url="<%=request.getContextPath() %>/gioi-thieu"
					data-cycle-excerpt="Trung tâm Tư vấn - Cai nghiện Ma túy SE 04 Đại học Bách Khoa Đà Nẵng ..."
					data-cycle-target="_self"
					data-cycle-buttons="&lt;div class=&quot;slider-buttons&quot;&gt;&lt;a href=&quot;http:<%=request.getContextPath() %>/gioi-thieu&quot; class=&quot;custom-button slider-button button-primary&quot;&gt;Chi tiết&lt;/a&gt;&lt;/div&gt;" >
					
					<a target="_self"> <img
						src="<%=request.getContextPath() %>/templates/public/wp-content/uploads/2017/03/about-page-02-final.png"
						alt="Giới thiệu" />
					</a>
				</article>
				<!-- <a href="" class="custom-button slider-button button-primary">Chi tiết</a> -->
			</div>
		</div>
		<div id="front-page-home-sections" class="widget-area">
			<div id="university-hub-news-and-events"
				class="home-section-news-and-events">
				<div class="container">
					<div class="inner-wrapper">
						<div class="recent-news">
							<h2>Tin mới nhất</h2>
							<div class="inner-wrapper">
							<%
								ArrayList<News> listNewsLimit = (ArrayList<News>)request.getAttribute("listNewsLimit");
								for(News objNews:listNewsLimit){
							%>
								<div class="news-post">
									<a
										href="<%=request.getContextPath() %>/newsdetail?nid=<%=objNews.getId_news()%>"><img style="width:400px;height:266px"
										src="<%=request.getContextPath() %>/files/<%=objNews.getHinhanh() %>"
										data-lazy-src="<%=request.getContextPath() %>/files/<%=objNews.getHinhanh() %>"
										class="aligncenter wp-post-image" alt=""
										data-lazy-srcset="<%=request.getContextPath() %>/files/<%=objNews.getHinhanh() %>"
										data-lazy-sizes="(max-width: 400px) 100vw, 400px" />
									<noscript>
											<img width="400" height="266"
												src="<%=request.getContextPath() %>/files/<%=objNews.getHinhanh() %>"
												class="aligncenter wp-post-image" alt=""
												srcset="<%=request.getContextPath() %>/files/<%=objNews.getHinhanh() %>"
												sizes="(max-width: 400px) 100vw, 400px" />
										</noscript></a>
									<div class="news-content">
										<h3>
											<a
												href="<%=request.getContextPath() %>/newsdetail?nid=<%=objNews.getId_news()%>"><%=objNews.getName_news() %></a>
										</h3>
										<div class="block-meta">
											<span class="posted-on"><a
												href=""><%=objNews.getNgaydang() %></a></span>
										</div>
										<p><%=objNews.getMota()%></p>
									</div>
								</div>
								<%} %>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="university-hub-call-to-action"
				class="home-section-call-to-action">
				<div class="container">
					<div class="cta-content">
						<h2 class="section-title">Bạn đang gặp vấn về ma tuý – cai
							nghiện? Bạn lo lắng về HIV/AIDS?</h2>
						<div class="cta-content-text">
							<p>Chúng tôi luôn sẵn sàng lắng nghe và thât sự muốn giúp đỡ
								bạn. Hãy gửi ngay câu hỏi của bạn cho chúng tôi! Tư vấn viên sẽ
								giải đáp thắc mắc của bạn trong thời gian nhanh nhất có thể!</p>
						</div>
					</div>
					<div class="cta-buttons">
						<a
							href="<%=request.getContextPath() %>/question"
							class="button cta-btn cta-btn-secondary">Gửi câu hỏi ngay</a>
					</div>
				</div>
			</div>

		</div>
		<div id="content" class="site-content">
			<div class="container">
				<div class="inner-wrapper"></div>
			</div>
		</div>
		<%@include file="/templates/public/inc/footer.jsp"%>