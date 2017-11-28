package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelNews;
import model.ModelQuestion;
import bean.News;
import bean.Question;


/**
 * Servlet implementation class ControllerAdminIndex
 */
//@WebServlet("/ControllerAdminIndex")
public class ControllerPublicThacMac extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerPublicThacMac() {
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
		ModelNews mNews = new ModelNews();
		ModelQuestion mQues = new ModelQuestion();
		
		ArrayList<News> listNewsLimit = mNews.getListLimit();
		if(request.getParameter("submit") != null){
			String tennguoihoi = new String(request.getParameter("yourname").getBytes("ISO-8859-1"),"UTF-8");
			String email = request.getParameter("youremail");
			String noidungcauhoi = new String(request.getParameter("yourquestion").getBytes("ISO-8859-1"),"UTF-8");
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			String ngaydang = sdf.format(date);
			Question objQues = new Question(0, tennguoihoi, noidungcauhoi, 0, "", email, ngaydang);
			if(mQues.addItem(objQues) > 0){
				response.sendRedirect(request.getContextPath() + "/trang-chu");
				return;
			}
		}
		else{
			request.setAttribute("select", "lien-he");
			request.setAttribute("listNewsLimit", listNewsLimit);
			RequestDispatcher rd = request.getRequestDispatcher("/thacmac.jsp");
			rd.forward(request, response);
		}
	}

}
