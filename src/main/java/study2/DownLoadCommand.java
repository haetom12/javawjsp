package study2;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownLoadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/pdstest");
		
		String[] files =	new File(realPath).list();  // 자바에서의 파일 생성, list가 왔을때 경로 설정
		
		for(String file : files) {
			System.out.println("file : " + file);
		}
		
		request.setAttribute("files", files); //사진경로에있는 파일들 리스트를 들고 감
	}
}
