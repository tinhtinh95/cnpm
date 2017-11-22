package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryCheckUser;
import model.ModelQuestion;

/**
 * Servlet implementation class ControllerAdminDelQuestion
 */
@WebServlet("/ControllerAdminDelQuestion")
public class ControllerAdminDelQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminDelQuestion() {
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
		
		if(mQues.delQuestion(qid) > 0){
			response.sendRedirect(request.getContextPath() + "/admin/question?msg=2");
			return;
		}
		else{
			response.sendRedirect(request.getContextPath() + "/admin/question?msg=0");
			return;
		}
	}

}
