package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Category;
import bean.News;
import library.LibraryCheckUser;
import model.ModelCategory;
import model.ModelNews;


/**
 * Servlet implementation class ControllerAdminIndexCategory
 */
//@WebServlet("/ControllerAdminIndexCategory")
public class ControllerAdminDetailCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminDetailCategory() {
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
		ModelCategory mCat=new ModelCategory();
		
		int id=Integer.parseInt(request.getParameter("cid"));
		ModelNews mNews = new ModelNews();
		
		ArrayList<News> listNews = mNews.getListByIDCat(id);
		request.setAttribute("listNews", listNews);
		
		Category objItem=mCat.getObjCatByID(id);
		request.setAttribute("nameCat", objItem.getName_cat());
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/indexTinTucByIDCat.jsp");
		rd.forward(request, response);
	}

}
