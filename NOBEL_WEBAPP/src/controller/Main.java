package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Nobel;
import model.NobelParser;

@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "http://192.168.2.123:8080/nobelapi/GetData";
		NobelParser parser = new NobelParser();
		List<Nobel> list = parser.getList(path);
		List<String> authors = new ArrayList<>();
		for(Nobel s:list) {
			if(!authors.contains(s.getAuthor()[0])) {
				authors.add(s.getAuthor()[0]);
			}
		}
		request.setAttribute("author",authors);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/main.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String author = request.getParameter("author");
		System.out.println(author);
		String path = "http://192.168.2.123:8080/nobelapi/GetData?author=";
		NobelParser parser = new NobelParser();
		List<Nobel> list = parser.getList(path + URLEncoder.encode(author,"UTF-8"));
		int rnd = (int)(Math.random() * list.size());
		HttpSession session = request.getSession();
		session.setAttribute("nobel", list.get(rnd));
		doGet(request, response);
	}

}
