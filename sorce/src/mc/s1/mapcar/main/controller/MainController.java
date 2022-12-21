package mc.s1.mapcar.main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mc.s1.mapcar.place.model.PlaceInfoService;
import mc.s1.mapcar.place.model.PlaceInfoVo;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/main 컨트롤러");
		
		PlaceInfoService service = new PlaceInfoService();
		List<PlaceInfoVo> volist = service.selectList();
		System.out.println(volist);
		
		request.setAttribute("aaa", volist);
		
		String viewPage="/WEB-INF/view/index.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
