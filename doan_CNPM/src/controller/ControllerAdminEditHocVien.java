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
public class ControllerAdminEditHocVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditHocVien() {
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
		ModelAddress mQue= new ModelAddress();
		ModelGiangVien mGiaoVien= new ModelGiangVien();
		ModelBacSi mBacSi= new ModelBacSi();
		ModelPhong mPhong= new ModelPhong();
		ModelHocVien mHocVien=new ModelHocVien();

		String mahv=request.getParameter("mahv");
		
		HocVien objItem=mHocVien.getItemByMa(mahv);
		if (request.getParameter("submit") != null){
			String tenhv = new String(request.getParameter("tenhv").getBytes("ISO-8859-1"), "UTF-8");
			
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
			
			int gt=Integer.parseInt(request.getParameter("gioitinh"));
			String que=new String(request.getParameter("quequan").getBytes("ISO-8859-1"), "UTF-8");
			String maphong=request.getParameter("maphong");
			String magv=request.getParameter("magv");
			String mabs=request.getParameter("mabs");
			String mucdo=new String(request.getParameter("mucdo").getBytes("ISO-8859-1"), "UTF-8");
			String lichsu=new String(request.getParameter("lichsu").getBytes("ISO-8859-1"), "UTF-8");
			String dieutri=new String(request.getParameter("dieutri").getBytes("ISO-8859-1"), "UTF-8");
			
			String dVao=request.getParameter("dayvao");
			String mVao=request.getParameter("monthvao");
			String yVao=request.getParameter("yearvao");
			String stringDate2 = dVao+"/"+mVao+"/"+yVao;
			Date date2=new Date();
			try {
				date2 = new SimpleDateFormat("dd/MM/yyyy").parse(stringDate2);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			System.out.println(stringDate2 + "\t" + date2);
			java.sql.Date ngayVao = new java.sql.Date(date2.getTime());
			
			String dRa=request.getParameter("dayra");
			String mRa=request.getParameter("monthra");
			String yRa=request.getParameter("yearra");
			
			HocVien objHV=null;

			if(!"-1".equals(dRa) && !"-1".equals(mRa) && !"-1".equals(yRa)) {
				String stringDate3 = dRa+"/"+mRa+"/"+yRa;
				Date date3=new Date();
				try {
					date3 = new SimpleDateFormat("dd/MM/yyyy").parse(stringDate3);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				java.sql.Date ngayRa = new java.sql.Date(date3.getTime());
				
				objHV=new HocVien(mahv, tenhv, ngaySinh, gt, que, maphong, magv, mabs, ngayVao, ngayRa, mucdo, lichsu,dieutri);
			}else {
				objHV=new HocVien(mahv, tenhv, ngaySinh, gt, que, maphong, magv, mabs, ngayVao, null, mucdo, lichsu,dieutri);
			}
			int result =mHocVien.editItem(objHV);
			if (result == 0){
				response.sendRedirect(request.getContextPath() + "/admin/HocVien?msg=0");
			}else {
				response.sendRedirect(request.getContextPath() + "/admin/HocVien?msg=2");
			}
		} else {
			request.setAttribute("objItem", objItem);
			request.setAttribute("listQue", mQue.getList());
			request.setAttribute("listGV", mGiaoVien.getList());
			request.setAttribute("listBS", mBacSi.getList());
			request.setAttribute("listPhong", mPhong.getList());
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editHocvien.jsp");
			rd.forward(request, response);
		}
		
	}

}
