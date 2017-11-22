package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryCheckUser;
import model.ModelUsers;
import bean.Users;


/**
 * Servlet implementation class ControllerAdminIndexCategory
 */
//@WebServlet("/ControllerAdminIndexCategory")
public class ControllerAdminIndexUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminIndexUsers() {
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
		
		ArrayList<Users> listUsers = mUser.getList();
		request.setAttribute("listUsers", listUsers);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/indexNguoiDung.jsp");
		rd.forward(request, response);
	}

}
