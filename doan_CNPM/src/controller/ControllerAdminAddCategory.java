package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryCheckUser;
import model.ModelCategory;
import bean.Category;


/**
 * Servlet implementation class ControllerAdminAddSaying
 */
//@WebServlet("/ControllerAdminAddSaying")
public class ControllerAdminAddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddCategory() {
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
		ModelCategory mCat = new ModelCategory();
		
		if(request.getParameter("them") != null){
			String namecat = new String(request.getParameter("name_cat").getBytes("ISO-8859-1"),"UTF-8");
			
			Category objCat = new Category(0, namecat);
			if(mCat.checkCat(namecat) != null){
				response.sendRedirect(request.getContextPath() + "/admin/add-category?msg=0");
				return;
			}
			else{
				if(mCat.addCategory(objCat) > 0){
					response.sendRedirect(request.getContextPath() + "/admin/category?msg=1");
					return;
				}
				else{
					response.sendRedirect(request.getContextPath() + "/admin/category?msg=0");
					return;
				}
			}
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("/admin/addDanhMuc.jsp");
			rd.forward(request, response);
		}
	}

}
