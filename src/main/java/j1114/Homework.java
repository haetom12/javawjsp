package j1114;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1114_Homework")
public class Homework extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request , HttpServletResponse response ) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String cusname = request.getParameter("cusname")==null ? "" : request.getParameter("cusname");
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");   // 3항 계산자 null값 처리
		String[] product = request.getParameterValues("product");
		String[] price = request.getParameterValues("price");
		String[] su = request.getParameterValues("su");
		int prices=0, sus=0, tot=0, tot2=0;
		String productname="";

		for(int i=0; i<product.length; i++) {
//			System.out.println("위치 " + i);
      if(product[i] == "" || price[i] == "" || su[i] == "") {
          out.println("<script>");
          out.println("alert(‎'빈칸이 존재합니다 다시 확인하세요!');");
          out.println("history.back();");
          out.println("</script>");
      }
		}
		
		
		cusname = cusname.trim();
		part = part.trim();
		
			
			out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
			out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js\"></script>");
			out.println("<style>");			
			out.println("body {width: 1000px; margin: 0 auto;}");
			out.println("tr,td {text-align:center;}");
			out.println("td {width: 100px;}");
			out.println("");
			out.println("</style>");
			out.println("<p><br/></p>");
			out.println("<body>");
			out.println("<h2 class='text-center'> "+cusname+"님이 구매하신 "+part+" 목록</h2>");
		  out.println("<table class='table table-bordered'><tr class='table-Warning text-Warning'>");
			out.println("<td>상품명</td><td>단가</td><td>수량</td><td>가격</td>");
			for(int i=0; i<product.length; i++) {
				
				productname = product[i];
				prices = Integer.parseInt(price[i]);
			  sus = Integer.parseInt(su[i]);
				tot = prices*sus;
				tot2 += tot;
				
				out.println("<tr>");
				out.println("<td>"+productname+"</td>");
				out.println("<td>"+prices+"</td>");
				out.println("<td>"+sus+"</td>");
				out.println("<td>"+tot+"</td>");
				out.println("</tr>");
			}
			out.println("<tr class='table-danger text-danger'><td>총가격</td><td colspan='3'>" + tot2 + "</td></tr>");
      out.println("</table>");
			out.println("</body>");
	
	}
}
