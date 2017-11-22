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
import bean.BacSi;


/**
 * Servlet implementation class ControllerAdminIndex
 */
//@WebServlet("/ControllerAdminIndex")
public class ControllerAdminEditBacSi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditBacSi() {
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

		ModelBacSi mBS=new ModelBacSi();
		String mabs=request.getParameter("mabs");
		BacSi objItem=mBS.getItem(mabs);
		
		if (request.getParameter("submit") != null){
			String tenbs = new String(request.getParameter("tenbs").getBytes("ISO-8859-1"), "UTF-8");
			
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
			// gioitinh
			int gt=Integer.parseInt(request.getParameter("gioitinh"));
			// quê
			String que=new String(request.getParameter("quequan").getBytes("ISO-8859-1"), "UTF-8");
			
			BacSi objBS=new BacSi(mabs, tenbs, ngaySinh,que,gt);
			int result =mBS.editItem(objBS);
			if (result == 0){
				response.sendRedirect(request.getContextPath() + "/admin/NhanSu?msg=0");
			}else {
				response.sendRedirect(request.getContextPath() + "/admin/NhanSu?msg=2");
			}
		} else {
			request.setAttribute("objItem", objItem);
			request.setAttribute("listQue", mQue.getList());
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editBacSi.jsp");
			rd.forward(request, response);
		}
		
	}

}
