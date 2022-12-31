package mc.s1.mapcar.member.model;

import static mc.s1.mapcar.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserInfoDao {
	
	
	public UserInfoVo doLogin(Connection conn, UserInfoVo login_info) {
		// 위치홀더가 필요하므로 PreparedStatement
		// select쿼리 = ResultSet
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		// 최종적으로 나온 rset을 member에 담는다
		UserInfoVo loginUser = null;
		
		String query = "SELECT ID, NAME, EMAIL, HND_NO, POST_CODE, ADD1, ADD2, CAR_MODEL FROM USER_INFO WHERE ID = ? AND PWD = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, login_info.getId());
			pstmt.setString(2, login_info.getPwd());
			// select = executequery
			
			
			rset = pstmt.executeQuery();
			// 실제로 보내는 부분
			
			if(rset.next()) { //다음 값이 있으면
				loginUser = new UserInfoVo();
				loginUser.setId(rset.getString("ID"));
				loginUser.setName(rset.getString("NAME"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setHnd_no(rset.getString("HND_NO"));
				loginUser.setPost_code(rset.getString("POST_CODE"));
				loginUser.setAdd1(rset.getString("ADD1"));
				loginUser.setAdd2(rset.getString("ADD2"));
				loginUser.setCar_model(rset.getString("CAR_MODEL"));
		
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(loginUser);
		return loginUser;
	}

	public int doJoin(Connection conn, UserInfoVo join_info) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "INSERT INTO USER_INFO (ID, PWD, NAME, EMAIL, HND_NO, POST_CODE, ADD1, ADD2, AGREE1, AGREE2, AGREE3, CAR_MODEL) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		//member-query에 insertMember작성
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1,  join_info.getId());
			pstmt.setString(2,  join_info.getPwd());
			pstmt.setString(3,  join_info.getName());
			pstmt.setString(4,  join_info.getEmail());
			pstmt.setString(5,  join_info.getHnd_no());
			pstmt.setString(6,  join_info.getPost_code());
			pstmt.setString(7,  join_info.getAdd1());
			pstmt.setString(8,  join_info.getAdd2());
			pstmt.setString(9,  join_info.getAgree1());
			pstmt.setString(10, join_info.getAgree2());
			pstmt.setString(11, join_info.getAgree3());
			pstmt.setString(12, join_info.getCar_model());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int checkId(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "SELECT COUNT(*) FROM USER_INFO WHERE ID = ?";
		
		//member-query에 idCheck 넣기
		//db만들고 이름 바뀌면 idCheck다시 수정
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();	//결과는 무조건 하나니까 if로
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int checkEmail(Connection conn, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "SELECT COUNT(*) FROM USER_INFO WHERE EMAIL = ?";
		
		//member-query에 idCheck 넣기
		//db만들고 이름 바뀌면 idCheck다시 수정
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, userEmail);
			rset = pstmt.executeQuery();	//결과는 무조건 하나니까 if로
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<String> searchCarCop(Connection conn, String searchStr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> result = new ArrayList<String>();
		
		String query = "SELECT * FROM(SELECT COP FROM CAR_INFO_TABLE GROUP BY COP) WHERE COP LIKE '%'||?||'%' ORDER BY COP";
		
		//member-query에 idCheck 넣기
		//db만들고 이름 바뀌면 idCheck다시 수정
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, searchStr);
			rset = pstmt.executeQuery();	//결과는 무조건 하나니까 if로
			while(rset.next()) {
				result.add(rset.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<String> searchCarModel(Connection conn, String cop, String searchStr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> result = new ArrayList<String>();
		
		String query = "SELECT CAR_MODEL FROM CAR_INFO_TABLE WHERE COP LIKE '%'||?||'%' AND CAR_MODEL LIKE '%'||?||'%' ORDER BY CAR_MODEL";
		
		//member-query에 idCheck 넣기
		//db만들고 이름 바뀌면 idCheck다시 수정
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, cop);
			pstmt.setString(2, searchStr);
			
			rset = pstmt.executeQuery();	//결과는 무조건 하나니까 if로
			while(rset.next()) {
				result.add(rset.getString(1));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
}
