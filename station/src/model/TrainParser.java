package model;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.stream.JsonReader;

public class TrainParser {
	public List<String> getList(String urlString){
		List<String> list = new ArrayList<String>();

		JsonReader reader = null;
		HttpURLConnection con = null;

		try {
			URL url = new URL(urlString);
			con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");

			InputStream is = con.getInputStream();
			InputStreamReader isr = new InputStreamReader(is,"UTF-8");
			reader = new JsonReader(isr);

			JsonObject root = new Gson().fromJson(reader,JsonObject.class);
			JsonObject response = root.get("response").getAsJsonObject();
			JsonArray result = response.get("line").getAsJsonArray();

			for(int i=0;i<result.size();i++) {
				String line = result.get(i).getAsString();

				list.add(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			if(reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					// TODO 自動生成された catch ブロック
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
