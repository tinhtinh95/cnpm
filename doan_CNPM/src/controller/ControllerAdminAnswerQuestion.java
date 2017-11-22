package controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
public class ControllerAdminAnswerQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAnswerQuestion() {
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
		
		
		
		if(request.getParameter("traloi") != null){
			String traloi= new String(request.getParameter("traloi").getBytes("ISO-8859-1"), "UTF-8");
			System.out.println(traloi);
			Question objItem=new Question(qid, 1, traloi);
			boolean check=true;
			//gửi mail
			Properties props = new Properties();
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.port", "587");
	        Session session = Session.getInstance(props,
	                new javax.mail.Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication("nttinh995@gmail.com", "tinhtinh");
	            }
	        });
	        try {
	            Message message = new MimeMessage(session);
	            message.setHeader("Content-Type", "text/html; charset=UTF-8");
	            message.setFrom(new InternetAddress("nttinh995@gmail.com"));
	            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(objQues.getEmail()));
	            message.setSubject("Trả lời câu hỏi của bạn trên trungtamgaynghien.vn");
	            message.setText("Chào bạn,\n Cảm ơn đã đặt câu hỏi.\n Chúng tôi xin trả lời câu hỏi của bạn như sau:\n "+traloi);
	            Transport.send(message);
	        } catch (MessagingException e) {
	            System.out.println("Error");
	            check=false;
	        }
			if(check) {
				if(mQues.editItem(objItem,traloi)>0){
					response.sendRedirect(request.getContextPath()+"/admin/question?msg=1");
					return;
				}
			}else {
				response.sendRedirect(request.getContextPath()+"/admin/question?msg=0");
				return;
			}
		}
		else{
			request.setAttribute("objQues", objQues);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/answerCauHoi.jsp");
			rd.forward(request, response);
		}
	}

}
