package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.News;
import model.ModelCategory;
import model.ModelNews;


/**
 * Servlet implementation class ControllerAdminIndex
 */
//@WebServlet("/ControllerAdminIndex")
public class ControllerPublicNewsByIDCat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerPublicNewsByIDCat() {
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
		int cid=Integer.parseInt(request.getParameter("cid"));
		System.out.println(cid);
		ModelNews mNews=new ModelNews();
		ModelCategory mCat=new ModelCategory();
		ArrayList<News> listNewsByIDCat=mNews.getNewsByIDCat(cid);
		request.setAttribute("listNewsByIDCat", listNewsByIDCat);
		request.setAttribute("nameCat", mCat.getObjCatByID(cid).getName_cat());
		request.setAttribute("select", "tin-tuc");
		RequestDispatcher rd = request.getRequestDispatcher("/tintheodanhmuc.jsp");
		rd.forward(request, response);
	}

}
