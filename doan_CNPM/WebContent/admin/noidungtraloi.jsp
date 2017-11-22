<%@page import="bean.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="<%=request.getContextPath() %>/admin/home" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="<%=request.getContextPath() %>/admin/question">Câu hỏi</a> <a href="javascript:void(0)" class="current">Trả lời câu hỏi</a> </div>
    <h1 style="text-align:center">Trả lời câu hỏi</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-envelope-alt"></i> </span>
            <h5>Câu hỏi</h5>
          </div>
          <div class="widget-content nopadding">
          <%
          	Question objQues = (Question)request.getAttribute("objQues");
          %>
            <form class="form-horizontal" method="post" action="" name="answer" id="answer">
              <div class="control-group">
                <label class="control-label">Nội dung câu hỏi:</label>
                <div class="controls">
                  <textarea disabled="disabled" class="span8"  name="noidung"><%=objQues.getNoidung() %></textarea>
              	</div>
              </div>
              <div class="control-group">
                <label class="control-label">Trả lời:</label>
                <div class="controls">
                  <textarea class="span10" rows="8" name="traloi" disabled="disabled"><%=objQues.getNoidungtraloi()%></textarea>
              	</div>
              </div>
              <div class="control-group">
                <div class="controls">
	                <a href="<%=request.getContextPath() %>/admin/question" class="btn btn-success">Hủy</a>
                </div>
              </div>
            </form>
            <script type="text/javascript">
				$(document).ready(function(){
					$("#answer").validate({
						rules:{
							traloi:{
								required: true,
							},
						},
						messages:{
							traloi:{
								required: "<span style='color:red'>Câu trả lời không được để trống!</span>",
							},
						},
					});
				});
			</script>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--Footer-part-->
<%@include file="/templates/admin/inc/footer.jsp" %>
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.ui.custom.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/bootstrap.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.uniform.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/select2.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.validate.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.form_validation.js"></script>
</body>
</html>
