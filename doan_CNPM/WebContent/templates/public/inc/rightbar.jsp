
<%@page import="bean.News"%>
<%@page import="model.ModelNews"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div id="sidebar-primary" class="widget-area sidebar"
						role="complementary">
						<aside id="recent-posts-2" class="widget widget_recent_entries">
							<h2 class="widget-title">Tin mới nhất</h2>
							<ul>
							<%
							ModelNews mNews = new ModelNews();
							ArrayList<News> listNewsLimit = mNews.getListLimit();
								for(News objNews:listNewsLimit){
							%>
								<li><a
									href="<%=request.getContextPath() %>/newsdetail?nid=<%=objNews.getId_news()%>"><%=objNews.getName_news() %></a> <span
									class="post-date"><%=objNews.getNgaydang() %></span></li>
							<%
								}
							%>
							</ul>
						</aside>
						
					</div>