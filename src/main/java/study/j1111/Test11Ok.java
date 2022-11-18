package study.j1111;
 
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/test11Ok")
public class Test11Ok extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String[] hobbys =request.getParameterValues("hobby");
        String phone = request.getParameter("phone");
        String email1 = request.getParameter("email1");
        String email2 = request.getParameter("email2");
        String area = request.getParameter("area");
        String birthday = request.getParameter("birthday");
        
        
        System.out.println("성명 : " + name);
        System.out.println("나이 : " + age);
        System.out.println("성별 : " + gender);
        String hobby1="";
        System.out.println("취미 : " + hobbys);
        for(String hobby  : hobbys) {
            hobby = (hobby + "/");
            hobby1 += hobby;
        } 
        System.out.println(hobby1.substring(0,hobby1.length()-1));
        System.out.println("핸드폰번호 : " + phone);
        System.out.println("이메일 : " + email1 +"@"+ email2);
        System.out.println("거주지 : " + area);
        System.out.println("생년월일 : " + birthday);
        
    }
}

