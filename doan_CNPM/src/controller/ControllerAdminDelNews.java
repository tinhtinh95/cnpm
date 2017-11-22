package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.News;
import library.LibraryCheckUser;
import model.ModelNews;

/**
 * Servlet implementation class ControllerAdminDelNews
 */
@WebServlet("/ControllerAdminDelNews")
public class ControllerAdminDelNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminDelNews() {
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
		ModelNews mNews = new ModelNews();
		int nid = 0;
		if(request.getParameter("nid") != null){
			nid = Integer.parseInt(request.getParameter("nid"));
		}
		News objNews = mNews.getObjNews(nid);
		if(mNews.countNewsByPicture(objNews) == 1){
			String urlImgCu = request.getServletContext().getRealPath("") + File.separator + "files" + File.separator + objNews.getHinhanh();
			File delFile = new File(urlImgCu);
			delFile.delete();
		}
		if(mNews.delNews(nid) > 0){
			response.sendRedirect(request.getContextPath() + "/admin/news?ms=3");
			return;
		}
		else{
			response.sendRedirect(request.getContextPath() + "/admin/news?ms=0");
			return;
		}
	}

}
