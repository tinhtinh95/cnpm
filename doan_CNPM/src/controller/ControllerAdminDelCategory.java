package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryCheckUser;
import model.ModelCategory;
import model.ModelNews;

/**
 * Servlet implementation class ControllerAdminDelCategory
 */
@WebServlet("/ControllerAdminDelCategory")
public class ControllerAdminDelCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminDelCategory() {
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
		ModelNews mNews = new ModelNews();
		
		int cid = 0;
		if(request.getParameter("cid") != null){
			cid = Integer.parseInt(request.getParameter("cid"));
		}
		
		if(mCat.delCategory(cid) > 0){
			mNews.delNewsByIDCat(cid);
			response.sendRedirect(request.getContextPath()+ "/admin/category?msg=3");
			return;
		}
		else{
			response.sendRedirect(request.getContextPath()+ "/admin/users?msg=0");
			return;
		}
		
	}

}
