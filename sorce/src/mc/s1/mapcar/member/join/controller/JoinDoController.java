package mc.s1.mapcar.member.join.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mc.s1.mapcar.member.model.UserInfoService;
import mc.s1.mapcar.member.model.UserInfoVo;

/**
 * Servlet implementation class JoinDoController
 */
@WebServlet(urlPatterns = "/doJoin.do", name = "JoinDoController")
public class JoinDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("ID");
		String userPwd = request.getParameter("PWD");
		String userName = request.getParameter("NAME");
		String userEmail = request.getParameter("EMAIL");
		String userHndNo = request.getParameter("HND_NO");
		String userPostCode = request.getParameter("POST_CODE");
		String userAddr1 = request.getParameter("ADDR1");
		String userAddr2 = request.getParameter("ADDR2");
		String userAgree1 = request.getParameter("AGREE1");
		String userAgree2 = request.getParameter("AGREE2");
		String userAgree3 = request.getParameter("AGREE3");
		String userCarModel = request.getParameter("CAR_MODEL");
		
		System.out.println(userId);
		System.out.println(userPwd);
		System.out.println(userName);
		System.out.println(userEmail);
		System.out.println(userHndNo);
		System.out.println(userPostCode);
		System.out.println(userAddr1);
		System.out.println(userAddr2);
		System.out.println(userAgree1);
		System.out.println(userAgree2);
		System.out.println(userAgree3);
		System.out.println(userCarModel);
		
		UserInfoVo join_info = new UserInfoVo();
		join_info.setId(userId);
		join_info.setPwd(userPwd);
		join_info.setName(userName);
		join_info.setEmail(userEmail);
		join_info.setHnd_no(userHndNo);
		join_info.setPost_code(userPostCode);
		join_info.setAdd1(userAddr1);
		join_info.setAdd2(userAddr2);
		join_info.setAgree1(userAgree1);
		join_info.setAgree2(userAgree2);
		join_info.setAgree3(userAgree3);
		join_info.setCar_model(userCarModel);
		
		
		int result = new UserInfoService().doJoin(join_info);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/");
		} else {
			request.setAttribute("msg", "회원가입 실패");
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
