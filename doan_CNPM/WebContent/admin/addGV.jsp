<%@page import="bean.Address"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="">giảng viên</a> <a href="javascript:void(0)" class="current">Thêm giảng viên</a> </div>
    <h1 style="text-align:center">Thêm giảng viên</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
      <%
				  	int msg = 0;
				  	if(request.getParameter("msg") != null){
				  		msg = Integer.parseInt(request.getParameter("msg"));
				  		switch(msg){
				  			case 0:
				  				out.print("<span style='color:blue;font-weight:bold'>Mã giảng viên đã tồn tại!</span>");
		        				break;
				  		}
				  	}
			  	%>
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-money"></i> </span>
            <h5>giảng viên</h5>
          </div>
          <div class="widget-content nopadding">
          	<script type="text/javascript">
				function check(){
					var check = true;
					var check1 = true;
					var magv = document.form1.magv.value;
					var tengv = document.form1.tengv.value;
					var quequan = document.form1.quequan.value;
					var gioitinh = document.form1.gioitinh.value;
					var ngay = document.form1.day.value;
					var thang = document.form1.month.value;
					var nam = document.form1.year.value;
					
					// validate MAgv
					if(magv.length==0){
						document.getElementById("magv").innerHTML = "Mã gv không được để trống!";
						document.form1.magv.focus();
						check = false;
					}
					if(magv.length>10){
						document.getElementById("magv").innerHTML = "Mã gv tối đa là 10 ký tự!";
						document.form1.magv.focus();
						check = false;
					}
					for(var i = 0;i < magv.length; i++){
						
						if(magv[i] == '!' || magv[i] == '@' || magv[i] == '#'|| magv[i] == '$'|| magv[i] == '%'
	        				|| magv[i] == '^' || magv[i] == '&'){
							document.getElementById("magv").innerHTML = "Mã gv không chứa ký tự đặc biệt!";
							document.form1.magv.focus();
							check = false;
						}
						if(magv[i] == ' '){
							document.getElementById("magv").innerHTML = "Mã gv không chứa ký tự trống!";
							document.form1.magv.focus();
							check = false;
						}
					}
					if(check == true) document.getElementById("magv").innerHTML = "";
					
					// validate Tengv
					if(tengv.length<6){
						document.getElementById("tengv").innerHTML = "Tên gv tối thiểu là 6 ký tự!";
						document.form1.tengv.focus();
						check1 = false;
					}
					if(tengv.length==0 || tengv.trim().length==0){
						document.getElementById("tengv").innerHTML = "Tên gv không được để trống!";
						document.form1.tengv.focus();
						check1 = false;
					}
					if(tengv.length>50){
						document.getElementById("tengv").innerHTML = "Tên gv không quá 50 ký tự!";
						document.form1.tengv.focus();
						check1 = false;
					}
					for(var i = 0;i < tengv.length; i++){
						if(tengv[i] == '!' || tengv[i] == '@' || tengv[i] == '#'|| tengv[i] == '$'|| tengv[i] == '%'
	        				|| tengv[i] == '^' || tengv[i] == '&'){
							document.getElementById("tengv").innerHTML = "Tên gv không chứa ký tự đặc biệt!";
							document.form1.tengv.focus();
							check1 = false;
						}
						
					}
					if(check == true && check1 == false){
						check = false;
					}
					else if(check1 == true) document.getElementById("tengv").innerHTML = "";
					
					// validate ngay thang nam
					if(ngay == -1){
						document.getElementById("ngaythangnam").innerHTML = "Chưa chọn ngày!";
						check = false;
					}
					if(thang == -1){
						document.getElementById("ngaythangnam").innerHTML = "Chưa chọn tháng!";
						check = false;
					}
					if(nam == -1){
						document.getElementById("ngaythangnam").innerHTML = "Chưa chọn năm!";
						check = false;
					}
					
					else if(ngay != -1 && thang != -1 && nam != -1) document.getElementById("ngaythangnam").innerHTML = "";
					
					if(thang==02 && ngay >28 && (nam%4!=0)){
						document.getElementById("ngaythangnam").innerHTML = "Không phải năm nhuận nên tháng 2 chỉ có 28 ngày, vui lòng chọn lại!";
						check = false;
					}
					if(( thang ==4 || thang ==6 || thang==9 ||thang ==11) && ngay >30){
						document.getElementById("ngaythangnam").innerHTML = "Tháng này chỉ có 30 ngày, vui lòng chọn lại";
						check = false;
					}
					
					if(((nam%4==0)&&(nam%100!=0))||(nam%400==0)){
						if(thang==02 && ngay>29){
							document.getElementById("ngaythangnam").innerHTML = "Tháng 2 năm nhuận chỉ có 29 ngày, vui lòng chọn lại!";
							check = false;
						}
					}
					
					// validate quequan
					if(quequan == -1){
						document.getElementById("quequan").innerHTML = "Chưa chọn quê quán!";
						check = false;
					}
					else document.getElementById("quequan").innerHTML = "";
					// validate gioitinh
					if(gioitinh == -1){
						document.getElementById("gioitinh").innerHTML = "Chưa chọn giới tính!";
						check = false;
					}
					else document.getElementById("gioitinh").innerHTML = "";
					return check;
				}
			</script>
            <form class="form-horizontal" onsubmit="return check()"   method="post" action="" name="form1" id="addgv">
              <div class="control-group">
                <label class="control-label">Mã giảng viên(*)</label>
                <div class="controls">
                  <input type="text" class="span5" name="magv" placeholder="Nhập mã giảng viên">
                  <span style="color: red;font-size: 12px" id="magv"></span>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Tên giảng viên(*)</label>
                <div class="controls">
                  <input type="text" class="span5" name="tengv" placeholder="Nhập tên giảng viên">
                  <span style="color: red;font-size: 12px" id="tengv"></span>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Ngày sinh(*)</label>
                <div class="controls">
	                <select class="span4" name="day" style="width: 103px">
						<option value="-1">--Ngày--</option>
						<%
						   for(int i=1;i<10;i++){
						%>
						<option value="0<%=i %>">0<%=i %></option>
						<%} 
							for(int i=10;i<=31;i++){
						%>
						<option value="<%=i %>"><%=i %></option>
						<%} %>
					</select>
					<select class="span4" name="month" style="width: 103px">
						<option value="-1">--Tháng--</option>
						<%
						   for(int i=1;i<10;i++){
						%>
						<option value="0<%=i %>">0<%=i %></option>
						<%} 
							for(int i=10;i<=12;i++){
						%>
						<option value="<%=i %>"><%=i %></option>
						<%} %>
					</select>
					<select class="span4" name="year" style="width: 103px">
						<option value="-1">--Năm--</option>
						<%
						Calendar dat=Calendar.getInstance();
						   for(int i=1960;i<=dat.get(Calendar.YEAR);i++){
						%>
						<option value="<%=i %>"><%=i %></option>
						<%} %>
					</select>
					<span style="color: red;font-size: 12px" id="ngaythangnam"></span>
	              </div>
              </div>
              <div class="control-group">
                <label class="control-label">Quê quán(*)</label>
                <div class="controls">
	                <select class="span4" name="quequan" >
						<option value="-1">--Quê quán--</option>
							                <%
	                ArrayList<Address> listQue =(ArrayList<Address>) request.getAttribute("listQue");
					for (Address objQue : listQue){ 
	                %>
						<option value="<%=objQue.getName() %>"><%=objQue.getName()%></option>
					<%} %>
					</select>
					<span style="color: red;font-size: 12px" id="quequan"></span>
                </div>
              </div>
               <div class="control-group">
                <label class="control-label">Giới tính(*)</label>
                <div class="controls">
                  <select class="span4" name="gioitinh" >
						<option value="-1">--Giới tính--</option>
						<option value="1">Nam</option>
						<option value="0">Nữ</option>
					</select>
					<span style="color: red;font-size: 12px" id="gioitinh"></span>
                </div>
              </div>
              <div class="control-group">
                <div class="controls">
	                <input type="submit" name="submit" value="Thêm giảng viên" class="btn btn-success">
	                <a href="<%=request.getContextPath() %>/admin/NhanSu" class="btn btn-success">Hủy</a>
                </div>
                
              </div>
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
<script src="<%=request.getContextPath() %>/templates/admin/js/jquery.validate.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.js"></script> 
<script src="<%=request.getContextPath() %>/templates/admin/js/matrix.form_validation.js"></script>
</body>
</html>
