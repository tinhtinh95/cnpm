package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryCheckUser;
import model.ModelQuestion;
import bean.Question;

/**
 * Servlet implementation class ControllerAdminAnswerQuestion
 */
//@WebServlet("/ControllerAdminAnswerQuestion")
public class ControllerAdminNoidungTraloiCauhoi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminNoidungTraloiCauhoi() {
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
		ModelQuestion mQues = new ModelQuestion();
		
		int qid = 0;
		if(request.getParameter("qid") != null){
			qid = Integer.parseInt(request.getParameter("qid"));
		}
		Question objQues = mQues.getObjQues(qid);
			request.setAttribute("objQues", objQues);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/noidungtraloi.jsp");
			rd.forward(request, response);
		}

}
