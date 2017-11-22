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
 * Servlet implementation class ControllerAdminEditCategory
 */
//@WebServlet("/ControllerAdminEditCategory")
public class ControllerAdminEditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditCategory() {
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
		
		int cid = 0;
		if(request.getParameter("cid") != null){
			cid = Integer.parseInt(request.getParameter("cid"));
		}
		Category objCat = mCat.getObjCatByID(cid);
		if(request.getParameter("sua") != null){
			String namecat = new String(request.getParameter("name_cat").getBytes("ISO-8859-1"), "UTF-8");
			Category objCatEdit = new Category(cid, namecat);
			if(mCat.editCategory(objCatEdit) > 0){
				response.sendRedirect(request.getContextPath() + "/admin/category?msg=2");
				return;
			}
			else{
				response.sendRedirect(request.getContextPath() + "/admin/category?msg=0");
				return;
			}
		}
		else{
			request.setAttribute("objCat", objCat);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editDanhMuc.jsp");
			rd.forward(request, response);
		}
	}

}
