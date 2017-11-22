<%@page import="bean.BacSi"%>
<%@page import="bean.GiangVien"%>
<%@page import="bean.Address"%>
<%@page import="bean.Phong"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="" title="Về trang chủ" class="tip-bottom"><i class="icon-home"></i>Trang chủ</a> <a href="">Học viên</a> <a href="javascript:void(0)" class="current">Thêm học viên</a> </div>
    <h1 style="text-align:center">Thêm học viên</h1>
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
				  				out.print("<span style='color:blue;font-weight:bold'>Mã học viên đã tồn tại!</span>");
		        				break;
				  		}
				  	}
			  	%>
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-money"></i> </span>
            <h5>Học viên</h5>
          </div>
          <div class="widget-content nopadding">
           	<script type="text/javascript">
				function check(){
					var check = true;
					var check1 = true;
					var mahv = document.form1.mahv.value;
					var tenhv = document.form1.tenhv.value;
					var quequan = document.form1.quequan.value;
					var gioitinh = document.form1.gioitinh.value;
					var maphong = document.form1.maphong.value;
					var magv = document.form1.magv.value;
					var mabs = document.form1.mabs.value;
					var mucdo = document.form1.mucdo.value;
					
					var ngay = document.form1.day.value;
					var thang = document.form1.month.value;
					var nam = document.form1.year.value;
					
					var ngayvao = document.form1.dayvao.value;
					var thangvao = document.form1.monthvao.value;
					var namvao = document.form1.yearvao.value;
					
					var ngayra = document.form1.dayra.value;
					var thangra = document.form1.monthra.value;
					var namra = document.form1.yearra.value;
					
					// validate mahv
					if(mahv.length==0){
						document.getElementById("mahv").innerHTML = "Mã hv không được để trống!";
						document.form1.mahv.focus();
						check = false;
					}
					for(var i = 0;i < mahv.length; i++){
						
						if(mahv[i] == '!' || mahv[i] == '@' || mahv[i] == '#'|| mahv[i] == '$'|| mahv[i] == '%'
	        				|| mahv[i] == '^' || mahv[i] == '&'){
							document.getElementById("mahv").innerHTML = "Mã hv không chứa ký tự đặc biệt!";
							document.form1.mahv.focus();
							check = false;
						}
						if(mahv[i] == ' '){
							document.getElementById("mahv").innerHTML = "Mã hv không chứa ký tự trống!";
							document.form1.mahv.focus();
							check = false;
						}
					}
					if(check == true) document.getElementById("mahv").innerHTML = "";
					
					// ----------------------------------------------------------------------------------
					// validate Tenhv
					if(tenhv.length<6){
						document.getElementById("tenhv").innerHTML = "Tên hv tối thiểu là 6 ký tự!";
						document.form1.tenhv.focus();
						check1 = false;
					}
					if(tenhv.length==0){
						document.getElementById("tenhv").innerHTML = "Tên hv không được để trống!";
						document.form1.tenhv.focus();
						check1 = false;
					}
					for(var i = 0;i < tenhv.length; i++){
						if(tenhv[i] == '!' || tenhv[i] == '@' || tenhv[i] == '#'|| tenhv[i] == '$'|| tenhv[i] == '%'
	        				|| tenhv[i] == '^' || tenhv[i] == '&'){
							document.getElementById("tenhv").innerHTML = "Tên hv không chứa ký tự đặc biệt!";
							document.form1.tenhv.focus();
							check1 = false;
						}
					}
					if(check == true && check1 == false){
						check = false;
					}
					else if(check1 == true) document.getElementById("tenhv").innerHTML = "";
					
					
					// ----------------------------------------------------------------------------------
					// validate ngay thang nam sinh
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
					
					// ----------------------------------------------------------------------------------
					
					// validate ngay thang nam vao
					if(ngayvao == -1){
						document.getElementById("ngaythangnamvao").innerHTML = "Chưa chọn ngày!";
						check = false;
					}
					if(thangvao == -1){
						document.getElementById("ngaythangnamvao").innerHTML = "Chưa chọn tháng!";
						check = false;
					}
					if(namvao == -1){
						document.getElementById("ngaythangnamvao").innerHTML = "Chưa chọn năm!";
						check = false;
					}
					
					else if(ngayvao != -1 && thangvao != -1 && namvao != -1) document.getElementById("ngaythangnamvao").innerHTML = "";
					
					if(thangvao==02 && ngayvao >28 && (namvao%4!=0)){
						document.getElementById("ngaythangnamvao").innerHTML = "Không phải năm nhuận nên tháng 2 chỉ có 28 ngày, vui lòng chọn lại!";
						check = false;
					}
					if(( thangvao ==4 || thangvao ==6 || thangvao==9 ||thangvao ==11) && ngayvao >30){
						document.getElementById("ngaythangnamvao").innerHTML = "Tháng này chỉ có 30 ngày, vui lòng chọn lại";
						check = false;
					}
					
					if(((namvao%4==0)&&(namvao%100!=0))||(namvao%400==0)){
						if(thangvao==02 && ngayvao>29){
							document.getElementById("ngaythangnamvao").innerHTML = "Tháng 2 năm nhuận chỉ có 29 ngày, vui lòng chọn lại!";
							check = false;
						}
					}
					// ---------------------------------------------------------------------------------------
					
					// validate ngay thang nam ra
					if(ngayra == -1){
						document.getElementById("ngaythangnamra").innerHTML = "Chưa chọn ngày!";
						check = false;
					}
					if(thangra == -1){
						document.getElementById("ngaythangnamra").innerHTML = "Chưa chọn tháng!";
						check = false;
					}
					if(namra == -1){
						document.getElementById("ngaythangnamra").innerHTML = "Chưa chọn năm!";
						check = false;
					}
					
					else if(ngayra != -1 && thangra != -1 && namra != -1) document.getElementById("ngaythangnamra").innerHTML = "";
					
					if(thangra==02 && ngayra >28 && (namra%4!=0)){
						document.getElementById("ngaythangnamra").innerHTML = "Không phải năm nhuận nên tháng 2 chỉ có 28 ngày, vui lòng chọn lại!";
						check = false;
					}
					if(( thangra ==4 || thangra ==6 || thangra==9 ||thangra ==11) && ngayra >30){
						document.getElementById("ngaythangnamra").innerHTML = "Tháng này chỉ có 30 ngày, vui lòng chọn lại";
						check = false;
					}
					
					if(((namra%4==0)&&(namra%100!=0))||(namra%400==0)){
						if(thangra==02 && ngayra>29){
							document.getElementById("ngaythangnamra").innerHTML = "Tháng 2 năm nhuận chỉ có 29 ngày, vui lòng chọn lại!";
							check = false;
						}
					}
					
					
					// ----------------------------------------------------------------------------------
					// kiem tra ngay thang
					var ns=ngay+"/"+thang+"/"+nam;
					var d=new Date(ns);
					
					var nv=ngayvao+"/"+thangvao+"/"+namvao;
					var dv=new Date(nv);
					var nr=ngayra+"/"+thangra+"/"+namra;
					var dr=new Date(nr);
					if(d>dv){
						document.getElementById("ngaythangnamvao").innerHTML = "Ngày vào phải lớn hơn ngày sinh";
					    check = false;
					}
					if(d>dr){
						document.getElementById("ngaythangnamra").innerHTML = "Ngày ra phải lớn hơn ngày sinh";
						check = false; 
					}
					if(dv>dr){
						document.getElementById("ngaythangnamra").innerHTML = "Ngày ra phải lớn hơn ngày vào";
						check = false;
					}
					// ---------------------------------------------------------------------------------------
					
					// validate que quan
					if(quequan == -1){
						document.getElementById("quequan").innerHTML = "Chưa chọn quê quán!";
						check = false;
					}
					else document.getElementById("quequan").innerHTML = "";
					// ---------------------------------------------------------------------------------------
					// validate gioitinh
					if(gioitinh == -1){
						document.getElementById("gioitinh").innerHTML = "Chưa chọn giới tính!";
						check = false;
					}
					else document.getElementById("gioitinh").innerHTML = "";
					// ---------------------------------------------------------------------------------------
					// validate ma phong
					if(maphong == -1){
						document.getElementById("maphong").innerHTML = "Chưa chọn mã phòng!";
						check = false;
					}
					else document.getElementById("maphong").innerHTML = "";
					// ---------------------------------------------------------------------------------------
					// validate magv
					if(magv == -1){
						document.getElementById("magv").innerHTML = "Chưa chọn mã giáo viên!";
						check = false;
					}
					else document.getElementById("magv").innerHTML = "";
					// ---------------------------------------------------------------------------------------
					// validate mabs
					if(mabs == -1){
						document.getElementById("mabs").innerHTML = "Chưa chọn mã bác sĩ!";
						check = false;
					}
					else document.getElementById("mabs").innerHTML = "";
					// ---------------------------------------------------------------------------------------
					// validate muc do
					if(mucdo == -1){
						document.getElementById("mucdo").innerHTML = "Chưa chọn mức độ!";
						check = false;
					}
					else document.getElementById("mucdo").innerHTML = "";
					// ---------------------------------------------------------------------------------------
					return check;
				}
				
			</script> 
			
            <form class="form-horizontal"  onsubmit="return check()" method="post" action="" name="form1" id="addHv">
              <div class="control-group">
                <label class="control-label" >Mã học viên(*)</label>
                <div class="controls">
                  <input type="text" class="span5" name="mahv" placeholder="Nhập mã học viên">
                  <span style="color: red;font-size: 12px" id="mahv"></span>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Tên học viên(*)</label>
                <div class="controls">
                  <input type="text" class="span5" name="tenhv" placeholder="Nhập tên học viên">
                  <span style="color: red;font-size: 12px" id="tenhv"></span>
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
					<span style="color: red;font-size: 12px;margin-left:16px" id="ngaythangnam"></span>
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
					<span style="color: red;font-size: 12px;margin-left:10px" id="gioitinh"></span>
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
					<span style="color: red;font-size: 12px;margin-left:10px" id="quequan"></span>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Mã phòng(*)</label>
                <div class="controls">
                  <select class="span4" name="maphong" >
						<option value="-1">--Mã phòng--</option>
						<%
	                ArrayList<Phong> listPhong =(ArrayList<Phong>) request.getAttribute("listPhong");
					for (Phong objPhong: listPhong){ 
	                %>
						<option value="<%=objPhong.getMaphong() %>"><%=objPhong.getMaphong() %></option>
					<%} %>
					</select>
					<span style="color: red;font-size: 12px;margin-left:10px" id="maphong"></span>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Giáo viên(*)</label>
                <div class="controls">
                  <select class="span4" name="magv" >
						<option value="-1">--Giáo viên--</option>
						<%
	                ArrayList<GiangVien> listGV=(ArrayList<GiangVien>) request.getAttribute("listGV");
					for (GiangVien objGV : listGV){ 
	                %>
						<option value="<%=objGV.getMaGV()%>"><%=objGV.getTenGV() %></option>
					<%} %>
					</select>
					<span style="color: red;font-size: 12px;margin-left:10px" id="magv"></span>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Bác sĩ(*)</label>
                <div class="controls">
                  <select class="span4" name="mabs" >
						<option value="-1">--Bác sĩ--</option>
						<%
	                ArrayList<BacSi> listBS =(ArrayList<BacSi>) request.getAttribute("listBS");
					for (BacSi objBS : listBS){ 
	                %>
						<option value="<%=objBS.getMaBS() %>"><%=objBS.getTenBS() %></option>
					<%} %>
					</select>
					<span style="color: red;font-size: 12px;margin-left:10px" id="mabs"></span>
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Ngày vào(*)</label>
                <div class="controls">
	                <select class="span4" name="dayvao" style="width: 103px" >
						<option value="-1">--Ngày vào--</option>
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
					<select class="span4" name="monthvao" style="width: 103px">
						<option value="-1">--Tháng vào--</option>
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
					<select class="span4" name="yearvao" style="width: 103px">
					<option value="-1">--Năm vào--</option>
						<%
						   for(int i=1975;i<=dat.get(Calendar.YEAR);i++){
						%>
						<option value="<%=i %>"><%=i %></option>
						<%} %>
					</select>
					<span style="color: red;font-size: 12px;margin-left:16px" id="ngaythangnamvao"></span>
	              </div>
              </div>
              <div class="control-group">
                <label class="control-label">Ngày ra(*)</label>
                <div class="controls">
	                <select class="span4" name="dayra" style="width: 103px">
						<option value="-1">--Ngày ra--</option>
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
					<select class="span4" name="monthra" style="width: 103px">
						<option value="-1">--Tháng ra--</option>
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
					<select class="span4" name="yearra" style="width: 103px" >
						<option value="-1">--Năm ra--</option>
						<%
						   for(int i=1975;i<=dat.get(Calendar.YEAR)+20;i++){
						%>
						<option value="<%=i %>"><%=i %></option>
						<%} %>
					</select>
					<span style="color: red;font-size: 12px;margin-left:16px" id="ngaythangnamra"></span>
	              </div>
              </div>
              <div class="control-group">
                <label class="control-label">Mức độ(*)</label>
                <div class="controls">
                  <select class="span4" name="mucdo" >
						<option value="-1">--Mức độ--</option>
						<option value="Nặng">Nặng</option>
						<option value="Nhẹ">Nhẹ</option>
						<option value="Trung bình">Trung bình</option>
					</select>
					<span style="color: red;font-size: 12px;margin-left:10px" id="mucdo"></span>
                </div>
              </div>
              <div class="control-group">
	              <label class="control-label">Lịch sử(*)</label>
	              <div class="controls">
	                <textarea class="span11" name="lichsu" ></textarea>
	              </div>
              </div>
              <div class="control-group">
                <div class="controls">
	                <input type="submit" name="submit" value="Thêm học viên" class="btn btn-success">
	                <a href="<%=request.getContextPath() %>/admin/HocVien" class="btn btn-success">Hủy</a>
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
