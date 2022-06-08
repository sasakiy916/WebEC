package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Result
 */
@WebServlet("/Result")
public class Result extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String age = request.getParameter("age");

		String errorMsg = "";
		String msg = "";
		if(name == null || name.length()==0) {
			errorMsg += "名前が入力されていません";
		}
		if(age == null || age.length() == 0) {
			errorMsg += "年齢が入力されていません";
		}else {
			msg = name + "(" + age + "歳)は人間に換算すると" + Integer.parseInt(age) * 7 +"歳です。";
		}

		if(errorMsg.length() != 0) {
			msg = errorMsg;
		}

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>犬の年齢</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p>" + msg + "</p>");
		out.println("<form action='/dogAge/index.jsp' method='get'>");
		out.println("<input type='submit' value='戻る'>");
		out.println("</form>");
		out.println("</body>");
		out.println("</html>");
	}

}
