package study2;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDeleteCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName = request.getParameter("file");
		
		String realPath = request.getServletContext().getRealPath("/data/pdstest/");

		File file = new File(realPath + fName); // 경로까지 설정해서 껍대기 객체를 생성해야함
		
		String res = "0";
		
		if(file.exists()) { // 있을때만 삭제함
			file.delete();
			res = "1";
		}

		response.getWriter().write(res);
	}

}
