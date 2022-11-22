package study.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.jni.Local;

import com.mysql.fabric.xmlrpc.base.Data;

@SuppressWarnings("serial")
@WebServlet("/database/LoginOk")
public class LoginOk extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
  	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		Date date = new Date();
		SimpleDateFormat datetime = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(datetime.format(date));
  	
  	JusorokDAO dao = new JusorokDAO();
  	
  	JusorokVO vo = dao.loginCheck(mid, pwd);
  	
//  System.out.println(Dategap);
//  	System.out.println(vo.getDaycount());
//  	System.out.println(Dategap);
//  	System.out.println(datetime);
  	
  	HttpSession session = request.getSession();
  	PrintWriter out = response.getWriter();
  	
  	if(vo.getMid() != null) {
  		String Dategap = vo.getLastDate().substring(0,10);
  		// 회원 인증후 처리(1:자주사용하는 자료를 세션에 담는다. 2:방문포인트를 10점씩 부가한다.(단, 1일 방문포인트는 50점까지만 허용함) , 3:최종방문날짜를 현재 날짜시간으로 변경한다.
  		// 1.세션처리
  		session.setAttribute("sMid", mid);
  		session.setAttribute("sName", vo.getName());
  		session.setAttribute("sLastDate", vo.getLastDate().substring(0, 19));
  		 		
  		if(datetime.format(date).equals(Dategap)) {
  			if(vo.getDaycount() < 5) {
  				System.out.println("=======================");
  				System.out.println("날짜가 같습니다");
  				System.out.println(vo.getDaycount());
  				System.out.println("=======================");
  				// 2.방문포인트 증가하기(10점씩, 1일 50점까지...), 3.최종방문일자 업데이트...
  				int visitPoint = vo.getPoint() + 10;
  				int visitCount = vo.getDaycount() + 1;
  				dao.setVisitUpdate(visitPoint,visitCount, mid);
  				
  				
  				out.println("<script>");
  				out.println("alert('"+vo.getName()+"님 로그인 되었습니다. 추가포인트 +10점(하루최대5회)');");
  				out.println("location.href='"+request.getContextPath()+"/database/MemberMain';");
  				out.println("</script>");
  				
  				//response.sendRedirect(request.getContextPath()+"/database/MemberMain");
  			}
  			else if(vo.getDaycount() > 4) {
  				System.out.println("추가포인트를 모두 받으셨습니다");
  				System.out.println(vo.getDaycount());
  				System.out.println("=======================");
  				int visitPoint = vo.getPoint() + 0;
  				int visitCount = vo.getDaycount() + 1;
  				dao.setVisitUpdate(visitPoint,visitCount, mid);
  				
  				out.println("<script>");
  				out.println("alert('"+vo.getName()+"님 로그인 되었습니다. 일일 추가포인트를 모두 받으셨습니다!');");
  				out.println("location.href='"+request.getContextPath()+"/database/MemberMain';");
  				out.println("</script>");
  			}
  		}
  		
  		else  {
  			System.out.println("날짜가 다릅니다");
  			int visitCount = (vo.getDaycount()*0)+1;
  			int visitPoint = vo.getPoint() + 10;
  			dao.setVisitUpdate(visitPoint,visitCount, mid);
  			System.out.println(vo.getDaycount());
  			
  			out.println("<script>");
  			out.println("alert('"+vo.getName()+"님 로그인 되었습니다. 추가포인트 +10점(하루최대5회)');");
  			out.println("location.href='"+request.getContextPath()+"/database/MemberMain';");
  			out.println("</script>");
  		}
  	}
  	else  {
  		// 회원 인증 실패시 처리
  		out.println("<script>");
  		out.println("alert('아이디와 비밀번호를 확인하세요!');");
  		out.println("location.href='"+request.getContextPath()+"/study/1120_Database/login.jsp';");
  		out.println("</script>");
  	}
  	
  	//ServletContext application = request.getServletContext();
  }
}
