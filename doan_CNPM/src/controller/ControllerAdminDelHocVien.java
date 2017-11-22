package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryCheckUser;
import model.ModelHocVien;

/**
 * Servlet implementation class ControllerAdminDelDoctor
 */
//@WebServlet("/ControllerAdminDelDoctor")
public class ControllerAdminDelHocVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminDelHocVien() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(!LibraryCheckUser.checkUser(request, response)){
			return;
		}
		ModelHocVien mHocVien = new ModelHocVien();
		
		String mahv = "";
		if(request.getParameter("mahv") != null){
			mahv = request.getParameter("mahv");
		}
		
		if(mHocVien.delItem(mahv) > 0){
			response.sendRedirect(request.getContextPath() + "/admin/HocVien?msg=3");
			return;
		}
		else{
			response.sendRedirect(request.getContextPath() + "/admin/HocVien?msg=0");
			return;
		}
	}
}
