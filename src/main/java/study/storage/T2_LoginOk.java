package study.storage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/study/j1118h/t2_LoginOk")
public class T2_LoginOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		PrintWriter out = response.getWriter();
		
		if((mid.equals("admin") && pwd.equals("1234")) || (mid.equals("haetom") && pwd.equals("145412")) ) {
			Cookie cookie = new Cookie("cMid",mid);
			cookie.setMaxAge(300); //쿠키의 만료시간을 5분으로 설정
			response.addCookie(cookie);
			
			HttpSession session = request.getSession(); //session 생성 무조건 외워야함!!
			session.setAttribute("sMid", mid);  //session에 저장하는것
			
			out.println("<script>");
			out.println("alert('"+mid+"님 로그인 되셨습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/1118_storage_server/t2_LoginMember.jsp';");
			out.println("</script>");
		}

		else {
			out.println("<script>");
			out.println("alert('아이디와 비밀번호를 확인하세요');");
			out.println("history.back()");
			out.println("</script>");
			
		}
	}
}
