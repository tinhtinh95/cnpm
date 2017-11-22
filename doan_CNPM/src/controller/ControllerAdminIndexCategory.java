package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryCheckUser;
import model.ModelCategory;
import bean.Category;


/**
 * Servlet implementation class ControllerAdminIndexCategory
 */
//@WebServlet("/ControllerAdminIndexCategory")
public class ControllerAdminIndexCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminIndexCategory() {
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
		
		ArrayList<Category> listCat = mCat.getList();
		request.setAttribute("listCat", listCat);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/indexDanhMuc.jsp");
		rd.forward(request, response);
	}

}
