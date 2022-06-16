package model;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;

public class NobelParser {
	public List<Nobel> getList(String urlString){
		List<Nobel> list = new ArrayList<>();
		JsonReader reader = null;
		HttpURLConnection con = null;

		try {
			URL url = new URL(urlString);
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");

			InputStream is = con.getInputStream();
			InputStreamReader isr = new InputStreamReader(is,"UTF-8");
			reader = new JsonReader(isr);

			list = new Gson().fromJson(reader,new TypeToken<List<Nobel>>() {}.getType());

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
		return list;
	}
}
