package mc.s1.mapcar.main.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import mc.s1.mapcar.common.api.model.OilVo;
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
		
		request.setAttribute("PlaceList", volist);
		
		
		HttpSession session = request.getSession();
		session.setAttribute("OilList", OilApiController());
		
		String viewPage="/WEB-INF/view/index.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
	private List<OilVo> OilApiController() {
		List<OilVo> volist = null;
		try {
			StringBuilder urlBuilder = new StringBuilder("http://www.opinet.co.kr/api/avgAllPrice.do"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("code","UTF-8") + "=F221129433"); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("out","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*출발지x좌표*/
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println("Response code: " + conn.getResponseCode());
			
			
			 // 방법 2 - stream에서 읽은 것을 class에 넣기
	        // conn --> inputstream--> Document --> xml 
	        Document doc = new MainController().parseXML(conn.getInputStream());
	        NodeList list = doc.getElementsByTagName("OIL");
	        System.out.println(list.getLength());
	        System.out.println(list.item(0));
	        
	        volist = new ArrayList<OilVo>();
	        
	        for(int i = 0; i < list.getLength(); i++) {
	        	
	        	// list.item(i)의 결과를 변수명 item에 담아주세요.
	        	Node item = list.item(i);
	        	// NullPointException 은 . 앞이 null 이어서 오류발생
	        	Node n = item.getFirstChild();
// 다음 item을 꺼냄 Node n2 = item.getNextSibling();
	        	
	        	OilVo vo = new OilVo();
	        	
	        	while(n != null) {
	        		String nodeName = n.getNodeName();
	        		String nodeText = n.getTextContent();
	        		try {
		        		switch(nodeName) {
		        		case"TRADE_DT":
		        			vo.setTrade_dt(nodeText);
		        			break;
		        		case"PRODCD":
		        			vo.setProdcd(nodeText);
		        			break;
		        		case"PRODNM":
		        			if(nodeText.equals("자동차용경유")) {
		        				nodeText = "경유";
		        			}
		        			vo.setProdnm(nodeText);
		        			break;
		        		case"PRICE":
		        			vo.setPrice(nodeText);
		        			break;
		        		case"DIFF":
		        			vo.setDiff(nodeText);
		        			break;
		        		}
	        		}catch (Exception e) {
	        			e.printStackTrace();
					}
	        		
	        		n = n.getNextSibling();
	        	}

	        	volist.add(vo);
	        }
	        for (OilVo vo : volist) {
	        	System.out.println(vo);
	        }
	        conn.disconnect();
    	} catch(IOException e) {
    		e.printStackTrace();
    	}
		return volist;
    }
    
    // 기본자세 - 메소드정의 - 첫번째 return type 확인 void 아니면 return
    // InputStream 형태의 객체를 Document로 바꿔줌
    private Document parseXML (InputStream stream) {
    	Document result = null;
    	DocumentBuilderFactory factory = null;
    	DocumentBuilder builder = null;
    	try {
    		factory = DocumentBuilderFactory.newInstance();
    		builder = factory.newDocumentBuilder();
    		result = builder.parse(stream);
    	} catch(ParserConfigurationException e){
    		e.printStackTrace();
    	} catch (SAXException e) { // Simple API for XML
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
    	return result;
	}
}
