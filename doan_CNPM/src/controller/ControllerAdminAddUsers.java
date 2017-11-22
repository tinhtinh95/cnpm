	package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BacSi;
import bean.GiangVien;
import bean.Users;
import library.LibStringMd5;
import library.LibraryCheckUser;
import model.ModelBacSi;
import model.ModelGiangVien;
import model.ModelUsers;


/**
 * Servlet implementation class ControllerAdminAddSaying
 */
//@WebServlet("/ControllerAdminAddSaying")
public class ControllerAdminAddUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddUsers() {
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
		
		ModelBacSi mBS=new ModelBacSi();
		ModelGiangVien mGV=new ModelGiangVien();
		
		
		if(request.getParameter("them") != null){
			String fullname="";
			String maNhanSu = request.getParameter("maNS");
			if(maNhanSu.equals("khac")) {
				fullname = new String(request.getParameter("fullname").getBytes("ISO-8859-1"),"UTF-8");
				maNhanSu="Khác";
			}else {
				if(maNhanSu.substring(0, 2).equals("BS")) {
					BacSi objBS=mBS.getItem(maNhanSu);
					fullname=objBS.getTenBS();
				}else{
					GiangVien objGV=mGV.getItem(maNhanSu);
					fullname=objGV.getTenGV();
				}
			}
			String username = request.getParameter("username");
			String password = LibStringMd5.LibMd5(new String(request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8"));
			String role = request.getParameter("role");
			
			Users objUser = new Users(0, username, password, fullname, role,maNhanSu);
			if(mUser.checkUser(username) == null){
				if(mUser.addUser(objUser) > 0){
					response.sendRedirect(request.getContextPath() + "/admin/users?msg=1");
					return;
				}
				else{
					response.sendRedirect(request.getContextPath() + "/admin/users?msg=0");
					return;
				}
			}
			else{
				response.sendRedirect(request.getContextPath() + "/admin/add-user?msg=0");
				return;
			}
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("/admin/addNguoiDung.jsp");
			rd.forward(request, response);
		}
	}

}
