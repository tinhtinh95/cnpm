package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ModelUsers;
import bean.Users;


/**
 * Servlet implementation class ControllerAdminLogin
 */
//@WebServlet("/ControllerAdminLogin")
public class ControllerAdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminLogin() {
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
		ModelUsers mUser = new ModelUsers();
		HttpSession session = request.getSession();
		
		if(request.getParameter("submit") != null ){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			Users objUser = mUser.getUserByUserName(username);
			if(objUser != null ){
				//đăng nhập đúng
				Users objUser1 = mUser.getUserByUserPass(username, password);
				if(objUser1 != null){
					//TẠO SESSION
					session.setAttribute("sObjUser", objUser1);
					//chuyển hướng
					response.sendRedirect(request.getContextPath() + "/admin/home?msg=1");
				}
				else{
					response.sendRedirect(request.getContextPath() + "/admin/login?msg=1");
				}
			}
			else{
				//đăng nhập sai
				response.sendRedirect(request.getContextPath() + "/admin/login?msg=0");
			}
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
			rd.forward(request, response);
		}
	}

}
