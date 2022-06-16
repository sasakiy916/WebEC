package model;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;

public class PokemonParser {
	public Pokemon getPokemon(String urlString) {
		Pokemon pokemon = new Pokemon();
		JsonReader reader = null;
		HttpURLConnection con = null;

		try {
			URL url = new URL(urlString);
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");

			InputStream is = con.getInputStream();
			InputStreamReader isr = new InputStreamReader(is,"UTF-8");
			reader = new JsonReader(isr);
			pokemon = new Gson().fromJson(reader,Pokemon.class);
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			if(reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				con.disconnect();
			}
		}
		System.out.println("paser:"+pokemon.getName());
		return pokemon;
	}
}
