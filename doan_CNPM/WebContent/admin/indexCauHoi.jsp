<%@page import="bean.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="<%=request.getContextPath() %>/admin/home" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="javascript:void(0)" class="current">Câu hỏi</a> </div>
    <h1 style="text-align:center">Câu hỏi</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      	<%
			  	int msg = 0;
			  	if(request.getParameter("msg") != null){
			  		msg = Integer.parseInt(request.getParameter("msg"));
			  		switch(msg){
			  			case 0:
			  				out.print("<span style='color:blue;font-weight:bold'>Có lỗi trong quá trình thực hiện!</span>");
	        				break;
			  			case 1:
			  				out.print("<span style='color:blue;font-weight:bold'>Trả lời câu hỏi thành công!</span>");
	        				break;
			  			case 2:
			  				out.print("<span style='color:blue;font-weight:bold'>Xóa câu hỏi thành công!</span>");
	        				break;
			  		}
			  	}
		  	%>
        <div class="widget-box">
        <br />
        <br />
        &ensp;
          <div class="widget-content nopadding">
          <br />
          	<form method="post" action="">
	            <table id="myTable" class="table table-hover table-bordered table-striped data-table with-check">
	              <thead>
	                <tr>
	                  <th style="vertical-align:middle">ID</th>
	                  <th style="vertical-align:middle">Tên người hỏi</th>
	                  <th style="vertical-align:middle">Nội dung</th>
	                  <th style="vertical-align:middle">Trả lời</th>
	                  <th style="vertical-align:middle">Email</th>
	                  <th style="vertical-align:middle">Ngày đăng</th>
	                  <th style="vertical-align:middle">Chức năng</th>
	                </tr>
	              </thead>
	              <tbody>
	              <%
	              	ArrayList<Question> listQues = (ArrayList<Question>)request.getAttribute("listQues");
	              	for(Question objQues : listQues){
	              %>
	              		<tr>
		                  <td style="text-align:center;vertical-align:middle" width="5%"><%=objQues.getId_cauhoi() %></td>
		                  <td style="text-align: center" width="15%"><%=objQues.getTennguoihoi() %></td>
		                  <td width="30%"><a href="<%=request.getContextPath() %>/admin/content-answer?qid=<%=objQues.getId_cauhoi() %>"><%=objQues.getNoidung() %></a></td>
		             		<%
		             			if(objQues.getTraloi() == 0){
		             		%>
		             				<td style="text-align: center"><img src="<%=request.getContextPath() %>/templates/admin/img/minus-circle.gif"></td>
		             		<%
		             			}
		             			else{
		             		%>
		             				<td style="text-align: center"><img src="<%=request.getContextPath() %>/templates/admin/img/tick-circle.gif"></td>
		             		<%
		             			}
		             		%>
		                  <td style="text-align: center" width="15%"><%=objQues.getEmail() %></td>
		                  <td style="text-align: center"><%=objQues.getNgaydang() %></td>
		                  <td style="text-align:center;vertical-align:middle" width="15%">
		                  	<%
		                  		if(objQues.getTraloi() == 0){
		                  	%>
		                  			<a style="color:blue" href="<%=request.getContextPath() %>/admin/answer-question?qid=<%=objQues.getId_cauhoi() %>">Trả lời<img src="<%=request.getContextPath() %>/templates/admin/img/pencil.gif" alt="edit" />  </a>
		                  	<%
		                  		}
		                  	%>
							/<a style="color:blue" href="<%=request.getContextPath() %>/admin/del-question?qid=<%=objQues.getId_cauhoi() %>" onclick="return confirm('Bạn có muốn xóa hay không?')">Xóa <img src="<%=request.getContextPath() %>/templates/admin/img/bin.gif" width="16" height="16" alt="delete" /></a>
		                  </td>
		                </tr>
	              <%
	              	}
	              %>
	              </tbody>
	            </table>
            </form>
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
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.uniform.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/select2.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.dataTables.min.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.tables.js"></script>
</body>
</html>
<script type="text/javascript">
	function valDels(){
		var checked = false;
	    $('input[type="checkbox"][name="checkbox"]').each(function() {
	        if($(this).is(":checked")) {
	        	checked = true;
	        }
	    });
	    
	    if (checked == true){
			return confirm('Bạn có muốn xóa các liên hệ đã chọn?');
	    } else {
	    	alert('Chọn ít nhất một liên hệ để xóa!!');
	    	return false;
	    }
	}
</script>
