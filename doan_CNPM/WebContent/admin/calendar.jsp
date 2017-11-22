<%@page import="jdk.nashorn.internal.runtime.RewriteException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"><a href="<%=request.getContextPath() %>/admin/home" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="">Thêm</a> <a href="">Lịch</a></div>
    <h1 style="text-align:center">Lịch</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box widget-calendar">
          <div class="widget-title"> <span class="icon"><i class="icon-calendar"></i></span>
            <h5>Lịch</h5>
            <div class="buttons"> <a id="add-event" data-toggle="modal" href="#modal-add-event" class="btn btn-inverse btn-mini"><i class="icon-plus icon-white"></i> Thêm sự kiện mới</a>
              <div class="modal hide" id="modal-add-event">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">X</button>
                  <h3>Thêm sự kiện mới</h3>
                </div>
                <div class="modal-body">
                  <p>Nhập tên sự kiện:</p>
                  <p>
                    <input id="event-name" type="text" />
                  </p>
                </div>
                <div class="modal-footer"> <a href="#" class="btn" data-dismiss="modal">Tắt</a> <a href="#" id="add-event-submit" class="btn btn-primary">Thêm sự kiện</a> </div>
              </div>
            </div>
          </div>
          <div class="widget-content">
            <div class="panel-left">
              <div id="fullcalendar"></div>
            </div>
            <div id="external-events" class="panel-right">
              <div class="panel-title">
                <h5>Drag Events to the calander</h5>
              </div>
              <div class="panel-content">
                <div class="external-event ui-draggable label label-inverse">Sự kiện 1</div>
                <div class="external-event ui-draggable label label-inverse">Sự kiện 2</div>
                <div class="external-event ui-draggable label label-inverse">Sự kiện 3</div>
                <div class="external-event ui-draggable label label-inverse">Sự kiện 4</div>
                <div class="external-event ui-draggable label label-inverse">Sự kiện 5</div>
              </div>
            </div>
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
<script src="<%=request.getContextPath() %>/templates/admin/js/fullcalendar.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.calendar.js"></script>
</body>
</html>
