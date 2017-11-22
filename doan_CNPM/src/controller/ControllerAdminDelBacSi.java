package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryCheckUser;
import model.ModelBacSi;

/**
 * Servlet implementation class ControllerAdminDelDoctor
 */
//@WebServlet("/ControllerAdminDelDoctor")
public class ControllerAdminDelBacSi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminDelBacSi() {
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
		ModelBacSi mBS = new ModelBacSi();
		
		String mabs = "";
		if(request.getParameter("mabs") != null){
			mabs = request.getParameter("mabs");
		}
		
		if(mBS.delItem(mabs) > 0){
			response.sendRedirect(request.getContextPath() + "/admin/NhanSu?msg=3");
			return;
		}
		else{
			response.sendRedirect(request.getContextPath() + "/admin/NhanSu?msg=0");
			return;
		}
	}
}
