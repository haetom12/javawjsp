package study.j1118h;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/study/j1118h_LoginOk2")
public class LoginOk2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String cookies = request.getParameter("cookies")==null ? "false" : request.getParameter("cookies");
		String sessionIP = request.getParameter("sessionIP")==null ? "false" : request.getParameter("sessionIP");
		int applicationIP = 0;
		
		PrintWriter out = response.getWriter();
		
				if((mid.equals("admin") && pwd.equals("1234")) || (mid.equals("haetom") && pwd.equals("145412")) ) {
					HttpSession session = request.getSession(); //session 생성 무조건 외워야함!!
					session.setAttribute("sMid", mid);  //session에 저장하는것			
					Cookie cookie = new Cookie("cMid",mid);
					cookie.setMaxAge(10*60); //쿠키의 만료시간을 5분으로 설정
					response.addCookie(cookie);
					applicationIP++;
					
					if(cookies.equals("false")) {
						cookie.setMaxAge(0);   //만료시간을 '0'으로 줘서 바로 쿠키를 삭제시켜버리는것! 지우고싶은것만 지울거면 Name으로 비교해서 개별삭제
						response.addCookie(cookie); //쿠키를 클라이언트에 0으로 저장하는것
						out.println("<script>");
						out.println("alert('"+mid+"님 로그인 되셨습니다.');");
						out.println("location.href='"+request.getContextPath()+"/study/1118h/t2_LoginMember.jsp';");
						out.println("</script>");
					}
						
					else if(cookies.equals("true")) {
						out.println("<script>");
						out.println("alert('"+mid+"님 로그인 되셨습니다.');");
						out.println("location.href='"+request.getContextPath()+"/study/1118h/t2_LoginMember.jsp';");
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
}
