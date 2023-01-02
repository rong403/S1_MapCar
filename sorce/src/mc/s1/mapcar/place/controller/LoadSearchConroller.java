package mc.s1.mapcar.place.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import mc.s1.mapcar.place.model.LoadSearchService;
import mc.s1.mapcar.place.model.PlaceInfoService;
import mc.s1.mapcar.place.model.PlaceInfoVo;

/**
 * Servlet implementation class LoadSearchConroller
 */
@WebServlet("/LoadSearchConroller")
public class LoadSearchConroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadSearchConroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		JSONParser parser = new JSONParser();
		LoadSearchService service = new LoadSearchService();
		BufferedReader br = new BufferedReader(request.getReader());
		String ax = null;
		String ay = null;
		try {
			JSONObject da = (JSONObject)parser.parse(br);
			ax = (String) da.get("addrx");
			ay = (String) da.get("addry");
		} catch (IOException e1) {
			e1.printStackTrace();
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		System.out.println(ax);
		String xy1 = service.geocoding(ax);
		String xy2 = service.geocoding(ay);
		
		String result = service.direction(xy1, xy2);
		System.out.println(result);
		
//		JSONObject ojb = null;
		JSONObject summary = null;
		try {
			JSONObject root = (JSONObject)parser.parse(result);
//        System.out.println("root ::: " + root);
			
			JSONObject route = (JSONObject) root.get("route");
//        System.out.println("route ::: " + route);
			
			JSONArray traoptimal = (JSONArray) route.get("traoptimal");
			
//        System.out.println("traoptimal ::: " + traoptimal);
			for (int i = 0 ; i < traoptimal.size() ; i++){
				JSONObject traoptimalObj = (JSONObject) traoptimal.get(i);
				summary = (JSONObject) traoptimalObj.get("summary");
//        	System.out.println("summary ::: " + summary);
				//result = summary.toString();
			}
			
			//JSONArray path = (JSONArray) traoptimal.get("path");
//        naverDistance = summary.getInt("distance");
//        naverDepartureTime = summary.getString("departureTime");
//        naverTollFare = summary.getInt("tollFare");
//        naverTaxiFare = summary.getInt("taxiFare");
//        naverFuelPriace = summary.getInt("fuelPrice");
//        
//        if(naverRouteList != null) naverRouteList.clear();
			
		} catch(Exception e) {
			
		}
		System.out.println(summary);
		out.println(summary);
		
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}
