package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryCheckUser;
import model.ModelAddress;
import model.ModelBacSi;
import model.ModelGiangVien;
import model.ModelHocVien;
import model.ModelPhong;
import bean.HocVien;


/**
 * Servlet implementation class ControllerAdminIndex
 */
//@WebServlet("/ControllerAdminIndex")
public class ControllerAdminAddHocVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddHocVien() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**	
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		if(!LibraryCheckUser.checkUser(request, response)){
			return;
		}
		ModelAddress listQue= new ModelAddress();
		request.setAttribute("listQue", listQue.getList());
		
		ModelGiangVien listGV= new ModelGiangVien();
		request.setAttribute("listGV", listGV.getList());
		
		ModelBacSi listBS= new ModelBacSi();
		request.setAttribute("listBS", listBS.getList());
		
		ModelPhong listPhong= new ModelPhong();
		request.setAttribute("listPhong", listPhong.getList());
		
		ModelHocVien listHV=new ModelHocVien();
		
		if (request.getParameter("submit") != null){
			
			// ma hv
			String mahv=request.getParameter("mahv");
			
			// ten hv
			String tenhv = new String(request.getParameter("tenhv").getBytes("ISO-8859-1"), "UTF-8");
			
			// ngay sinh
			String ngay=request.getParameter("day");
			String thang=request.getParameter("month");
			String nam=request.getParameter("year");
			String stringDate1 = ngay+"/"+thang+"/"+nam;
			Date date1=new Date();
			try {
				date1 = new SimpleDateFormat("dd/MM/yyyy").parse(stringDate1);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			java.sql.Date ngaySinh = new java.sql.Date(date1.getTime());
			
			// gioi tinh
			int gt=Integer.parseInt(request.getParameter("gioitinh"));
			// que
			String que=new String(request.getParameter("quequan").getBytes("ISO-8859-1"), "UTF-8");
			// phong
			String maphong=request.getParameter("maphong");
			// giang vien
			String magv=request.getParameter("magv");
			// bac si
			String mabs=request.getParameter("mabs");
			// muc do
			String mucdo=new String(request.getParameter("mucdo").getBytes("ISO-8859-1"), "UTF-8");
			// lich su
			String lichsu=new String(request.getParameter("lichsu").getBytes("ISO-8859-1"), "UTF-8");
			
			// dieu tri
			String dieutri=new String(request.getParameter("dieutri").getBytes("ISO-8859-1"), "UTF-8");
			
			// ngay vao
			String dVao=request.getParameter("dayvao");
			String mVao=request.getParameter("monthvao");
			String yVao=request.getParameter("yearvao");
			String stringDate2 = dVao+"/"+mVao+"/"+yVao;
			Date date2=new Date();
			try {
				date2 = new SimpleDateFormat("dd/MM/yyyy").parse(stringDate2);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			java.sql.Date ngayVao = new java.sql.Date(date2.getTime());
			
			// ngay ra
			String dRa=request.getParameter("dayra");
			String mRa=request.getParameter("monthra");
			String yRa=request.getParameter("yearra");
			String stringDate3 = dRa+"/"+mRa+"/"+yRa;
			Date date3=new Date();
			try {
				date3 = new SimpleDateFormat("dd/MM/yyyy").parse(stringDate3);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			java.sql.Date ngayRa = new java.sql.Date(date3.getTime());
			
			HocVien objItem=new HocVien(mahv, tenhv, ngaySinh, gt, que, maphong, magv, mabs, ngayVao, ngayRa, mucdo, lichsu,dieutri);
			if(listHV.checkMahv(mahv) != null){
				response.sendRedirect(request.getContextPath() + "/admin/addHocVien?msg=0");
				return;
			}else{
				int result =listHV.addItem(objItem);
				if (result == 0){
					response.sendRedirect(request.getContextPath() + "/admin/HocVien?msg=0");
				}else {
					response.sendRedirect(request.getContextPath() + "/admin/HocVien?msg=1");
				}
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/addHocvien.jsp");
			rd.forward(request, response);
		}
		
		
	}

}
