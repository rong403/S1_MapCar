package mc.s1.mapcar.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mc.s1.mapcar.member.model.UserInfoService;
import mc.s1.mapcar.member.model.UserInfoVo;

/**
 * Servlet implementation class LoginDoController
 */
@WebServlet(urlPatterns = "/doLogin.do", name = "LoginDoController")
public class LoginDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public LoginDoController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("ID");
		String userPwd = request.getParameter("PWD");
		
		System.out.println(userId);
		System.out.println(userPwd);
		
		UserInfoVo login_info = new UserInfoVo();
		login_info.setId(userId);
		login_info.setPwd(userPwd);
		
		UserInfoVo user_info = new UserInfoService().doLogin(login_info);
		
		if(user_info != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user_info", user_info);
			session.setMaxInactiveInterval(600*1000);
			response.sendRedirect(request.getContextPath() + "/");
		} else {
			request.setAttribute("msg", "로그인 실패");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
			
			view.forward(request, response);
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
