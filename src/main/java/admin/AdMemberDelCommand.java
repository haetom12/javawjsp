package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;

public class AdMemberDelCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		AdminDAO dao = new AdminDAO();
		
		dao.setMemberDel(mid);
		
		request.setAttribute("msg", "memberDelOk");
		request.setAttribute("url", request.getContextPath()+"/adMemList.ad");
	}

}
