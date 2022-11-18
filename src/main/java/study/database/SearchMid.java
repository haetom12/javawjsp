package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/database/SearchMid")
public class SearchMid extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request , HttpServletResponse response ) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		JusorokDAO dao = new JusorokDAO();
		
		JusorokVO vo = dao.getMemberSearch(mid);
		
		PrintWriter out = response.getWriter();
		
		if(vo.getName() != null) {
			request.setAttribute("vo", vo);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/study/1120_Database/memberSearch.jsp");
			dispatcher.forward(request, response);
		}
		else {
			// 회원 인증 실패시 처리
			out.println("<script>");
			out.println("alert('찾고자하는 사람이 없습니다!');");
			out.println("location.href='"+request.getContextPath()+"/study/1120_Database/member.jsp'");			//서블릿을 돌아갔을대는 history를 사용할수 없음 (jsp-jsp는 가능)
			out.println("</script>");
			
		}
		

	}
}
