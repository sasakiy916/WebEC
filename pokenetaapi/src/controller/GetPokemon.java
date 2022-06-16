package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.Pokemon;

@WebServlet("/GetPokemon")
public class GetPokemon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String imgType = request.getParameter("imgType");
		if (name != null) {
			if (imgType == null || imgType.equals("通常画像")) {
				imgType = "normal";
			} else {
				imgType = "neta";
			}
			Pokemon pokemon = new Pokemon();
			String path = "http://192.168.2.110:8080/pokenetaapi/images/"+imgType;
			switch (name) {
			case "マルマイン":
				pokemon.setName(name);
				pokemon.setHeight(1.2);
				pokemon.setWeight(66.6);
				pokemon.setType("電気");
				pokemon.setImgPath(path + "/malmine.jpg");
				break;
			case "ピカチュウ":
				pokemon.setName(name);
				pokemon.setHeight(0.4);
				pokemon.setWeight(6.0);
				pokemon.setType("電気");
				pokemon.setImgPath(path + "/pikachu.jpg");
				break;
			}
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			out.println(gson.toJson(pokemon));
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/main.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
