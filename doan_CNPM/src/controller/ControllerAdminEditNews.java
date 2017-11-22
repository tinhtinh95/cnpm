package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import library.GetFileName;
import library.LibraryCheckUser;
import model.ModelCategory;
import model.ModelNews;
import bean.Category;
import bean.News;


/**
 * Servlet implementation class ControllerAdminAddSaying
 */
//@WebServlet("/ControllerAdminAddSaying")
@MultipartConfig
public class ControllerAdminEditNews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditNews() {
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
		int nid = 0;
		if(request.getParameter("nid") != null){
			nid = Integer.parseInt(request.getParameter("nid"));
		}
		
		ArrayList<Category> listCat = mCat.getList();
		News objNews = mNews.getObjNews(nid);
		
		if(request.getParameter("sua") != null){
			String namenews = new String(request.getParameter("name_news").getBytes("ISO-8859-1"),"UTF-8");
			int danhmuc = Integer.parseInt(request.getParameter("category"));
			String mota = new String(request.getParameter("preview").getBytes("ISO-8859-1"),"UTF-8");
			String chitiet = new String(request.getParameter("detail").getBytes("ISO-8859-1"),"UTF-8");
			
			Part part = request.getPart("picture");
//			System.out.println("Disposition:" + contentDisposition);
			String fileName = GetFileName.getFileName(part);
			if(!"".equals(fileName)){
				//kiá»ƒm tra tĂªn hĂ¬nh áº£nh cÅ© cĂ³ file hay k
				if(mNews.countNewsByPicture(objNews) == 1){
					if(!"".equals(objNews.getHinhanh())){
						//láº¥y Ä‘Æ°á»�ng dáº«n hĂ¬nh áº£nh cÅ©
						String urlImgCu = request.getServletContext().getRealPath("") + File.separator + "files" + File.separator + objNews.getHinhanh();
						File fileDel = new File(urlImgCu);
						fileDel.delete();
					}
				}
				String urlDir = request.getServletContext().getRealPath("") + File.separator + "files";
				File fileDir = new File(urlDir);
				if(!fileDir.exists()){
					fileDir.mkdir();
				}
				String urlImg = urlDir + File.separator + fileName;
				
				OutputStream out = null;
			    InputStream filecontent = null;
			    try {
			        out = new FileOutputStream(new File(urlImg));
			        filecontent = part.getInputStream();
			        int read = 0;
			        final byte[] bytes = new byte[1024];
			        while ((read = filecontent.read(bytes)) != -1) {
			            out.write(bytes, 0, read);
			        }
			    } catch (FileNotFoundException fne) {
			    	fne.printStackTrace();
			    } finally {
			        if (out != null) {
			            out.close();
			        }
			        if (filecontent != null) {
			            filecontent.close();
			        }
			    }
			}
			else{
				//láº¥y láº¡i tĂªn hĂ¬nh áº£nh cÅ©
				fileName = objNews.getHinhanh();
			}
			
			News objNewsEdit = new News(nid, namenews, mota, chitiet, "", fileName, danhmuc, "");
			if(mNews.editNews(objNewsEdit) > 0){
				response.sendRedirect(request.getContextPath() + "/admin/news?msg=2");
				return;
			}
			else{
				response.sendRedirect(request.getContextPath() + "/admin/news?msg=0");
				return;
			}
			
		}
		else{
			request.setAttribute("objNews", objNews);
			request.setAttribute("listCat", listCat);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editTinTuc.jsp");
			rd.forward(request, response);
		}
	}

}
