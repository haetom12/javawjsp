package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MappingInterface {  //공통 메소드
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}
