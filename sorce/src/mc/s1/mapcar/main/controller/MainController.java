package mc.s1.mapcar.main.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
import mc.s1.mapcar.common.api.model.WeatherVo;
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
		
		// 목적지 data
		request.setAttribute("PlaceList", volist);
		// 단기예보 data
		request.setAttribute("WeatherList", WeatherApiController());
		// 한국석유공사 api data
		HttpSession session = request.getSession();
		session.setAttribute("OilList", OilApiController());
		
		String viewPage="/WEB-INF/view/index.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
	private List<WeatherVo> WeatherApiController() {
		List<WeatherVo> volist = null;
		try {
			Calendar calendar = new GregorianCalendar();
			SimpleDateFormat SDF = new SimpleDateFormat("yyyyMMdd");
			
			calendar.add(Calendar.DATE, -1);
			String yesterdayDate = SDF.format(calendar.getTime());		
			System.out.println("The day before 10days : " + yesterdayDate);
			
	        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"); /*URL*/
	        
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=7caAwF2nffirzWsBbvicP0OtVafn14rBtZOKeYBpdz7R4CoGRdLSRLQKCKYA0JH30b04IgPZtKIeEzyL9at31Q%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("287", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
	        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(yesterdayDate, "UTF-8")); /*‘21년 6월 28일 발표*/
	        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode("2300", "UTF-8")); /*06시 발표(정시단위) */
	        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode("62", "UTF-8")); /*예보지점의 X 좌표값*/
	        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode("125", "UTF-8")); /*예보지점의 Y 좌표값*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
			
			
			// 방법 2 - stream에서 읽은 것을 class에 넣기
			// conn --> inputstream--> Document --> xml 
			Document doc = new MainController().parseXML(conn.getInputStream());
			NodeList list = doc.getElementsByTagName("item");
			System.out.println(list.getLength());
			System.out.println(list.item(0));
			
			volist = new ArrayList<WeatherVo>();
			
			for(int i = 0; i < list.getLength(); i++) {
				
				// list.item(i)의 결과를 변수명 item에 담아주세요.
				Node item = list.item(i);
				// NullPointException 은 . 앞이 null 이어서 오류발생
				Node n = item.getFirstChild();
// 다음 item을 꺼냄 Node n2 = item.getNextSibling();
				
				WeatherVo vo = new WeatherVo();
				
				while(n != null) {
					String nodeName = n.getNodeName();
					String nodeText = n.getTextContent();
					try {
						switch(nodeName) {
						case"baseDate":
							vo.setBaseDate(nodeText);
							break;
						case"baseTime":
							vo.setBaseTime(nodeText);
							break;
						case"fcstDate":
							vo.setFcstDate(nodeText);
							break;
						case"fcstTime":
							vo.setFcstTime(nodeText);
							break;
						case"category":
							vo.setCategory(nodeText);
							break;
						case"fcstValue":
							vo.setFcstValue(nodeText);
							break;
						case"nx":
							vo.setNx(nodeText);
							break;
						case"ny":
							vo.setNy(nodeText);
							break;
						}
					}catch (Exception e) {
						e.printStackTrace();
					}
					
					n = n.getNextSibling();
				}
				
				volist.add(vo);
			}
			for (WeatherVo vo : volist) {
				System.out.println(vo);
			}
			conn.disconnect();
		} catch(IOException e) {
			e.printStackTrace();
		}
		return volist;
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
