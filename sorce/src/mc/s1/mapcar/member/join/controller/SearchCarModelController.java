package mc.s1.mapcar.member.join.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import mc.s1.mapcar.member.model.UserInfoService;

/**
 * Servlet implementation class SearchCalModel
 */
@WebServlet("/searchCarModel.do")
public class SearchCarModelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCarModelController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String carMaker = request.getParameter("carMaker");
		String searchStr = request.getParameter("searchStr");
	    JSONArray list = new JSONArray();
	    JSONObject object = null;
	    
	    System.out.println(carMaker); 
	    System.out.println(searchStr);
	    
	    ArrayList<String> result = new UserInfoService().searchCarModel(carMaker, searchStr);
	    
	    System.out.println(result);
	    
	    for(int i = 0; i < result.size(); i++) {
	    	object = new JSONObject();
	        object.put("car_model", result.get(i));
	        list.add(object);
	    }
	         
	    PrintWriter pw = response.getWriter();
	    pw.print(list);
	    pw.flush();
	    pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
