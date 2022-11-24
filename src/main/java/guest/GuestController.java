package guest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.gu")
public class GuestController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestInterface command = null;
		String viewPage = "/WEB-INF/guest";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(com.equals("/guList")) {
			command = new GuListCommand();  //일하는 서비스객체
			command.execute(request, response);
			viewPage += "/guList.jsp";
		}
		else if(com.equals("/guInput")) {
			viewPage += "/guInput.jsp";
		}
		else if(com.equals("/guInputOk")) {
			command = new GuInputOkCommand();  //일하는 서비스객체
			command.execute(request, response);
			viewPage = "/include/message.jsp";    //컨르롤로 보내야함
		}
		else if(com.equals("/adminLogin")) {
			viewPage += "/adminLogin.jsp";
		}
		else if(com.equals("/adminLoginOk")) {
			command = new AdminLoginOkCommand();  //일하는 서비스객체
			command.execute(request, response);
			viewPage = "/include/message.jsp";    //컨르롤로 보내야함
		}
		else if(com.equals("/adminLogout")) {
			command = new AdminLoginoutCommand();  //일하는 서비스객체
			command.execute(request, response);
			viewPage = "/include/message.jsp";    //컨르롤로 보내야함
		}
		else if(com.equals("/guDelete")) {
			command = new GuDeleteCommand();  //일하는 서비스객체
			command.execute(request, response);
			viewPage = "/include/message.jsp";    //컨르롤로 보내야함
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
