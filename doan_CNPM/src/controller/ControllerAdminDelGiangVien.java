package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryCheckUser;
import model.ModelGiangVien;

/**
 * Servlet implementation class ControllerAdminDelDoctor
 */
//@WebServlet("/ControllerAdminDelDoctor")
public class ControllerAdminDelGiangVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminDelGiangVien() {
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
		ModelGiangVien mGV = new ModelGiangVien();
		
		String magv = "";
		if(request.getParameter("magv") != null){
			magv = request.getParameter("magv");
		}
		
		if(mGV.delItem(magv) > 0){
			response.sendRedirect(request.getContextPath() + "/admin/NhanSu?msg=33");
			return;
		}
		else{
			response.sendRedirect(request.getContextPath() + "/admin/NhanSu?msg=0");
			return;
		}
	}
}
