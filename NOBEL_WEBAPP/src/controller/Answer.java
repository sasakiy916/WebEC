package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Nobel;

@WebServlet("/Answer")
public class Answer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/result.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String ans = request.getParameter("ans");
		System.out.println(ans);
		Nobel nobel = (Nobel)session.getAttribute("nobel");
		String result = "はずれ";
		for(String s : nobel.getTitle()) {
			System.out.println(s);
			if(s.equals(ans)) {
				result = "あたり！！";
				break;
			}
		}
		request.setAttribute("result",result);
		doGet(request, response);
	}

}
