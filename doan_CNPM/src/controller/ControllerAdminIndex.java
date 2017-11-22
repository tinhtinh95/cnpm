package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryCheckUser;
import model.ModelBacSi;
import model.ModelCategory;
import model.ModelGiangVien;
import model.ModelHocVien;
import model.ModelNews;
import model.ModelQuestion;
import model.ModelUsers;
import bean.Category;


/**
 * Servlet implementation class ControllerAdminIndex
 */
//@WebServlet("/ControllerAdminIndex")
public class ControllerAdminIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminIndex() {
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
		ModelHocVien mHV=new ModelHocVien();
		ModelCategory mCategory = new ModelCategory();
		ModelUsers muUsers = new ModelUsers();
		ModelQuestion mQues = new ModelQuestion();
		ModelNews mNews = new ModelNews();
		ModelBacSi mDoctor = new ModelBacSi();
		ModelGiangVien mTeacher = new ModelGiangVien();
		
		int countHV=mHV.countHv();
		int countUsers = muUsers.countUsers();
		int countQues = mQues.countQues();
		int countNews = mNews.countNews();
		int countDoc = mDoctor.countBS();
		int countTeacher = mTeacher.countTeacher();
		ArrayList<Category> listCat = mCategory.getList();
		
		request.setAttribute("countHv", countHV);
		request.setAttribute("countUsers", countUsers);
		request.setAttribute("countQues", countQues);
		request.setAttribute("countNews", countNews);
		request.setAttribute("countDoc", countDoc);
		request.setAttribute("countTeacher", countTeacher);
		request.setAttribute("listCat", listCat);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/index.jsp");
		rd.forward(request, response);
	}

}
