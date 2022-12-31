package mc.s1.mapcar.place.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import mc.s1.mapcar.place.model.PlaceInfoService;
import mc.s1.mapcar.place.model.PlaceInfoVo;

/**
 * Servlet implementation class PlaceSearchController
 */
@WebServlet("/placesearch")
public class PlaceSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchword = request.getParameter("searchtext");
		System.out.println(searchword);
		PlaceInfoService service = new PlaceInfoService();
		List<PlaceInfoVo> volist = service.selectList(searchword);
		System.out.println(volist);
		
		JSONObject jObj = new JSONObject();
		
		JSONArray jArr = new JSONArray();
		
		for(int i = 0; i < volist.size(); i++) {
			PlaceInfoVo info = volist.get(i);
			JSONObject pInfo = new JSONObject();
			
			pInfo.put("p_no", info.getP_no());
			pInfo.put("p_name", info.getP_name());
			pInfo.put("p_road_no", info.getP_road_no());
			pInfo.put("p_address", info.getP_address());
			pInfo.put("p_info", info.getP_info());
			pInfo.put("p_type", info.getP_type());
			pInfo.put("p_val", info.getP_val());
			pInfo.put("p_number", info.getP_number());
			pInfo.put("p_unit", info.getP_unit());
			pInfo.put("place_no", info.getPlace_no());
			
			jArr.add(pInfo);
		}
		
		jObj.put("jArr", jArr);
		
		PrintWriter pw = response.getWriter();
	    pw.print(jObj);
	    pw.flush();
	    pw.close();
		
//		request.setAttribute("PlaceList", volist);
		
//		String viewPage="/WEB-INF/view/index.jsp";
//		request.getRequestDispatcher(viewPage).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
