package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemNickCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName")==null ? "" :  request.getParameter("nickName");
		String numcheck2 = request.getParameter("numcheck2")==null ? "" :  request.getParameter("numcheck2");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getNickNameCheck(nickName);
		
		if(vo == null ) { // 사용 가능한 닉네임
			request.setAttribute("res", 1);
			request.setAttribute("numcheck2", 1);
		}
		else {
			request.setAttribute("res", 0);
			request.setAttribute("numcheck2", 0);
		}
		
		request.setAttribute("nickName", nickName);
		
	}
}