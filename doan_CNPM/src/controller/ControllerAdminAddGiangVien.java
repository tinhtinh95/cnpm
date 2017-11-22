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
import model.ModelGiangVien;
import bean.GiangVien;


/**
 * Servlet implementation class ControllerAdminIndex
 */
//@WebServlet("/ControllerAdminIndex")
public class ControllerAdminAddGiangVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddGiangVien() {
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
		request.setAttribute("listQue", mQue.getList());
		
		ModelGiangVien mGV=new ModelGiangVien();
		
		if (request.getParameter("submit") != null){
			
			String magv=request.getParameter("magv");
			String tengv = new String(request.getParameter("tengv").getBytes("ISO-8859-1"), "UTF-8");
			
			// ngày sinh
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
			System.out.println(stringDate1 + "\t" + date1);
			java.sql.Date ngaySinh = new java.sql.Date(date1.getTime());
			
			//quê
			String que=new String(request.getParameter("quequan").getBytes("ISO-8859-1"), "UTF-8");
			System.out.println(que);
			
			int gt=Integer.parseInt(request.getParameter("gioitinh"));
			GiangVien objItem=new GiangVien(magv, tengv, ngaySinh,que,gt);
			if(mGV.checkMagv(magv) != null){
				response.sendRedirect(request.getContextPath() + "/admin/addGiangVien?msg=0");
				return;
			}else{
				int result =mGV.addItem(objItem);
				if (result == 0){
					response.sendRedirect(request.getContextPath() + "/admin/NhanSu?msg=0");
				}else {
					response.sendRedirect(request.getContextPath() + "/admin/NhanSu?msg=11");
				}
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/addGV.jsp");
			rd.forward(request, response);
		}
		
	}

}
