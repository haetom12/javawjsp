package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mapping/Test12")
public class Test1Controller2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기는 자바1");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/mapping/Test1Ok2"); // ("") 이동하는곳의 주소 '\\' == / 이라는 의미
		dispatcher.forward(request, response);
	}
}
