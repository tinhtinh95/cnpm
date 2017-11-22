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
public class ControllerAdminAddBacSi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddBacSi() {
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
		
		ModelBacSi mBS=new ModelBacSi();
		
		if (request.getParameter("submit") != null){
			
			String mahv=request.getParameter("mabs");
			String tenhv = new String(request.getParameter("tenbs").getBytes("ISO-8859-1"), "UTF-8");
			
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
			
			int gt=Integer.parseInt(request.getParameter("gioitinh"));
			BacSi objItem=new BacSi(mahv, tenhv, ngaySinh,que,gt);
			if(mBS.checkMaBS(mahv) != null){
				response.sendRedirect(request.getContextPath() + "/admin/addBacSi?msg=0");
				return;
			}else{
				int result =mBS.addItem(objItem);
				if (result == 0){
					response.sendRedirect(request.getContextPath() + "/admin/NhanSu?msg=0");
				}else {
					response.sendRedirect(request.getContextPath() + "/admin/NhanSu?msg=1");
				}
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/addBS.jsp");
			rd.forward(request, response);
		}
		
	}

}
