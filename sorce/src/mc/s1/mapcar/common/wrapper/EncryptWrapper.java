package mc.s1.mapcar.common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
		// 부모 타입(HttpServletRequestWrapper)에 기본 생성자가 없음
		// 반드시 명시적으로 HttpServletRequestWrapper를 매개변수로 하는 생성자 작성
	}
	
	@Override
	public String getParameter(String name) {
		String value = "";
		
		if(name != null && name.equals("PWD")) {
			value = getSha512(super.getParameter(name));
		} else {
			value = super.getParameter(name);
		}
		
		return value;
	}

	private String getSha512(String decStr) {
		String encStr = null;
		MessageDigest md = null; // SHA-512방식의 암호화 객체
		
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		byte[] bytes = decStr.getBytes(Charset.forName("UTF-8"));
		
		md.update(bytes);
		
		encStr = Base64.getEncoder().encodeToString(md.digest());
		
		return encStr;
	}

}
