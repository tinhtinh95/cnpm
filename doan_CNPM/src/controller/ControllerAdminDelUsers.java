package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryCheckUser;
import model.ModelUsers;

/**
 * Servlet implementation class ControllerAdminDelUsers
 */
//@WebServlet("/ControllerAdminDelUsers")
public class ControllerAdminDelUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminDelUsers() {
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
		ModelUsers mUser = new ModelUsers();
		
		int uid = 0;
		if(request.getParameter("uid") != null){
			uid = Integer.parseInt(request.getParameter("uid"));
		}
		
		if(mUser.delUser(uid) > 0){
			response.sendRedirect(request.getContextPath()+ "/admin/users?msg=3");
			return;
		}
		else{
			response.sendRedirect(request.getContextPath()+ "/admin/users?msg=0");
			return;
		}
	}

}
