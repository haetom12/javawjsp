package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.ajax.UserDAO;
import study2.ajax.UserVO;

public class UserInputCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = request.getParameter("age") == null ? 0 : Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address") == null ? "" : request.getParameter("address");

		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		
		vo.setMid(mid);
		vo.setName(name);
		vo.setAge(age);
		vo.setAddress(address);
		
		String res = dao.userInput(vo);
		response.getWriter().write(res);
	}

}
