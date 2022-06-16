package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Pokemon;
import model.PokemonParser;

@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/main.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String imgType = request.getParameter("imgType");
		String url = "http://localhost:8080/pokenetaapi/GetPokemon";
		PokemonParser parser = new PokemonParser();
		Pokemon pokemon = parser.getPokemon(url + "?name=" + URLEncoder.encode(name,"UTF-8") + "&imgType=" + URLEncoder.encode(imgType,"UTF-8"));
		request.setAttribute("pokemon", pokemon );
		doGet(request, response);
	}

}
