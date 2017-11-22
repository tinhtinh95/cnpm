<%@page import="bean.BacSi"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="bean.Address"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="">bác sĩ</a> <a href="javascript:void(0)" class="current">Sửa bác sĩ</a> </div>
    <h1 style="text-align:center">Sửa bác sĩ</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-money"></i> </span>
            <h5>bác sĩ</h5>
          </div>
          <div class="widget-content nopadding">
          	<script type="text/javascript">
				function check(){
					var check = true;
					var check1 = true;
					var tenbs = document.form1.tenbs.value;
					var quequan = document.form1.quequan.value;
					var gioitinh = document.form1.gioitinh.value;
					var ngay = document.form1.day.value;
					var thang = document.form1.month.value;
					var nam = document.form1.year.value;
					
					// validate TenBS
					if(tenbs.length<6){
						document.getElementById("tenbs").innerHTML = "Tên BS tối thiểu là 6 ký tự!";
						document.form1.tenbs.focus();
						check1 = false;
					}
					if(tenbs.length==0|| tenbs.trim().length==0){
						document.getElementById("tenbs").innerHTML = "Tên BS không được để trống!";
						document.form1.tenbs.focus();
						check1 = false;
					}
					if(tenbs.length>50){
						document.getElementById("tenbs").innerHTML = "Tên BS không quá 50 ký tự!";
						document.form1.tenbs.focus();
						check1 = false;
					}
					for(var i = 0;i < tenbs.length; i++){
						if(tenbs[i] == '!' || tenbs[i] == '@' || tenbs[i] == '#'|| tenbs[i] == '$'|| tenbs[i] == '%'
	        				|| tenbs[i] == '^' || tenbs[i] == '&'){
							document.getElementById("tenbs").innerHTML = "Tên BS không chứa ký tự đặc biệt!";
							document.form1.tenbs.focus();
							check1 = false;
						}
					}
					if(check == true && check1 == false){
						check = false;
					}
					else if(check1 == true) document.getElementById("tenbs").innerHTML = "";
					
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
					
					// validate que quan
					if(quequan == -1){
						document.getElementById("quequan").innerHTML = "Chưa chọn quê quán!";
						check = false;
					}
					else document.getElementById("quequan").innerHTML = "";
					if(gioitinh == -1){
						document.getElementById("gioitinh").innerHTML = "Chưa chọn giới tính!";
						check = false;
					}
					else document.getElementById("gioitinh").innerHTML = "";
					return check;
				}
			</script>
            <form class="form-horizontal"  onsubmit="return check()"  method="post" action="" name="form1" id="addBs">
            <%
                BacSi objItem=(BacSi)request.getAttribute("objItem");
            
            // tách ngày sinh
            	Date date1=objItem.getNgaySinh();
            	SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
                String ngaysinh= sdf1.format(date1);
                String []ns=ngaysinh.split("/");
                String ngay1=ns[0];
                String thang1=ns[1];
                String nam1=ns[2];
            %>
              <div class="control-group">
                <label class="control-label">Mã bác sĩ(*)</label>
                <div class="controls">
                  <input type="text" class="span5" name="mabs" placeholder="Nhập mã bác sĩ" value="<%=objItem.getMaBS() %>" disabled="disabled">
                  <span style="color: red;font-size: 12px" id="mabs"></span>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Tên bác sĩ(*)</label>
                <div class="controls">
                  <input type="text" class="span5" name="tenbs" value="<%=objItem.getTenBS() %>" placeholder="Nhập tên bác sĩ">
                  <span style="color: red;font-size: 12px" id="tenbs"></span>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Ngày sinh(*)</label>
                <div class="controls">
	                <select class="span4" name="day" style="width: 103px">
						<option value="-1">--Ngày--</option>
						<%
						   for(int i=1;i<10;i++){
							   String selected = "";
							   if(i==Integer.parseInt(ngay1)){
									selected = "selected='selected'";
							   }else{
								   selected = "";
							   }
						%>
						<option <%=selected %> value="0<%=i %>">0<%=i %></option>
						<%} 
							for(int i=10;i<=31;i++){
								 String selected = "";
								 if(i==Integer.parseInt(ngay1)){
										selected = "selected='selected'";
								   }else{
									   selected = "";
								   }
						%>
						<option  <%=selected %> value="<%=i %>"><%=i %></option>
						<%} %>
					</select>
					<select class="span4" name="month" style="width: 103px">
						<option value="-1">--Tháng--</option>
						<%
						   for(int i=1;i<10;i++){
							   String selected = "";
								 if(i==Integer.parseInt(thang1)){
										selected = "selected='selected'";
								   }else{
									   selected = "";
								   }
						%>
						<option  <%=selected %> value="0<%=i %>">0<%=i %></option>
						<%} 
							for(int i=10;i<=12;i++){
								String selected = "";
								 if(i==Integer.parseInt(thang1)){
										selected = "selected='selected'";
								   }else{
									   selected = "";
								   }
						%>
						<option  <%=selected %> value="<%=i %>"><%=i %></option>
						<%} %>
					</select>
					<select class="span4" name="year" style="width: 103px">
						<option value="-1">--Năm--</option>
						<%
						Calendar dat=Calendar.getInstance();
						   for(int i=1960;i<=dat.get(Calendar.YEAR);i++){
							   String selected = "";
								 if(i==Integer.parseInt(nam1)){
										selected = "selected='selected'";
								   }else{
									   selected = "";
								   }
						%>
						<option <%=selected %> value="<%=i %>"><%=i %></option>
						<%} %>
					</select>
					<span style="color: red;font-size: 12px;margin-left:16px" id="ngaythangnam"></span>
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
						String selected = "";
						 if(objQue.getName().equalsIgnoreCase(objItem.getQuequan())){
								selected = "selected='selected'";
						   }else{
							   selected = "";
						   }
	                %>
						<option <%=selected %> value="<%=objQue.getName() %>"><%=objQue.getName() %></option>
					<%} %>
					</select>
					<span style="color: red;font-size: 12px;margin-left:10px" id="quequan"></span>
                </div>
              </div>
               <div class="control-group">
                <label class="control-label">Giới tính(*)</label>
                <div class="controls">
                  <select class="span4" name="gioitinh" >
						<option value="-1">--Giới tính--</option>
						<%
						    String selected0="";
						    String selected1="";
						    if(objItem.getGioiTinh()==1){
						    	selected1 = "selected='selected'";
						    }else{
						    	selected0 = "selected='selected'";
						    }
						%>
						<option <%=selected1 %> value="1">Nam</option>
						<option <%=selected0 %> value="0">Nữ</option>
					</select>
					<span style="color: red;font-size: 12px;margin-left:10px" id="gioitinh"></span>
                </div>
              </div>
              <div class="control-group">
                <div class="controls">
	                <input type="submit" name="submit" value="Sửa bác sĩ" class="btn btn-success">
	                <a href="<%=request.getContextPath() %>/admin/BacSi" class="btn btn-success">Hủy</a>
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
