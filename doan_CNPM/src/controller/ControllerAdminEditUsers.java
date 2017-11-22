package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Users;
import library.LibStringMd5;
import library.LibraryCheckUser;
import model.ModelNhanSu;
import model.ModelUsers;

/**
 * Servlet implementation class ControllerAdminAddSaying
 */
//@WebServlet("/ControllerAdminAddSaying")
public class ControllerAdminEditUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditUsers() {
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
		Users objUser = mUser.getObjUser(uid);
		
		ModelNhanSu mNS=new ModelNhanSu();
		
		if(request.getParameter("sua") != null){
			String fullname = new String(request.getParameter("fullname").getBytes("ISO-8859-1"),"UTF-8");	
			String password = LibStringMd5.LibMd5(new String(request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8"));
			String role = request.getParameter("role");
			String maNS=objUser.getMaNhanSu();
			if("".equals(password)){
				password = objUser.getPassword();
			}
			else{
				password = LibStringMd5.LibMd5(password);
			}
			
			Users objUserEdit = new Users(uid, objUser.getUsername(), password, fullname,role);
			if(mUser.editUser(objUserEdit) > 0){
				if(!maNS.equals("khac")) {
					mNS.editItem(maNS, fullname);
				}
				response.sendRedirect(request.getContextPath() + "/admin/users?msg=2");
				return;
			}
			else{
				response.sendRedirect(request.getContextPath() + "/admin/users?msg=0");
				return;
			}
		}
		else{
			request.setAttribute("objUser", objUser);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editNguoiDung.jsp");
			rd.forward(request, response);
		}
	}

}
