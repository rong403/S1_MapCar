package mc.s1.mapcar.place.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.JsonObject;

public class LoadSearchService {
	public String direction(String x, String y) throws IOException {
        String result = null;
        
        // 요청 url 출발지 -> 도착지
        String naver_url = "https://naveropenapi.apigw.ntruss.com/map-direction/v1/driving?"
        		+ "start=" + x
        		+ ",&goal=" + y;


        try {
            URL url = new URL(naver_url);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setReadTimeout(10000);
            conn.setConnectTimeout(15000);
            conn.setRequestMethod("GET");
            //네이버 플랫폼에서 발급받은 키
            conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", "dskw1cnb5i");
            conn.setRequestProperty("X-NCP-APIGW-API-KEY", "INblR4mcuk58k01myxFgQwiCmAiBUyzeckm0gU1m");
            conn.setDoInput(true);
            conn.connect();

            InputStream inputStream = conn.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
            StringBuffer response = new StringBuffer();

            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            
            result = response.toString();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
	public String geocoding(String placename) throws IOException {
		String result = null;
		String addr = URLEncoder.encode(placename, "utf-8");
		// 요청 url 출발지 -> 도착지
		String naver_url = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="
				+ addr;
		
		try {
			URL url = new URL(naver_url);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setReadTimeout(10000);
			conn.setConnectTimeout(15000);
			conn.setRequestMethod("GET");
			//네이버 플랫폼에서 발급받은 키
			conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", "dskw1cnb5i");
			conn.setRequestProperty("X-NCP-APIGW-API-KEY", "INblR4mcuk58k01myxFgQwiCmAiBUyzeckm0gU1m");
			conn.setDoInput(true);
			conn.connect();
			
			InputStream inputStream = conn.getInputStream();
			BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
			StringBuffer response = new StringBuffer();
			
			String line;
			while ((line = reader.readLine()) != null) {
				response.append(line);
			}
			
			result = response.toString();
			
			JSONParser parser = new JSONParser();
			String x = null;
			String y = null;
			JSONObject geo = (JSONObject)parser.parse(result);
			JSONArray addresses = (JSONArray) geo.get("addresses");
			for (int i = 0 ; i < addresses.size() ; i++){
				JSONObject obj = (JSONObject) addresses.get(i);
				x = obj.get("x").toString();
				y = obj.get("y").toString();
			}
			result = x + "," + y;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	
	}
}
