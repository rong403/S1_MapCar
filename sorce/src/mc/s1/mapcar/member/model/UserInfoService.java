package mc.s1.mapcar.member.model;

import static mc.s1.mapcar.common.jdbc.JdbcTemplate.commit;
import static mc.s1.mapcar.common.jdbc.JdbcTemplate.rollback;
import static mc.s1.mapcar.common.jdbc.JdbcTemplate.close;
import static mc.s1.mapcar.common.jdbc.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

public class UserInfoService {

	public UserInfoVo doLogin(UserInfoVo login_info) {
		Connection conn = getConnection();
		
		
		UserInfoDao mDAO = new UserInfoDao();
		
		UserInfoVo loginUser = mDAO.doLogin(conn, login_info);
		
		close(conn);
		return loginUser;
	}

	public int doJoin(UserInfoVo join_info) {
		Connection conn = getConnection();
		int result = new UserInfoDao().doJoin(conn, join_info);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int checkId(String userId) {
		Connection conn = getConnection();
		int result = new UserInfoDao().checkId(conn, userId);
		
		close(conn);
		
		return result;
	}

	public int checkEmail(String userEmail) {
		Connection conn = getConnection();
		int result = new UserInfoDao().checkEmail(conn, userEmail);
		
		close(conn);
		
		return result;
	}

	public ArrayList<String> searchCarCop(String searchStr) {
		Connection conn = getConnection();
		ArrayList<String> result = new UserInfoDao().searchCarCop(conn, searchStr);
		
		close(conn);
		
		return result;
	}

	public ArrayList<String> searchCarModel(String cop, String searchStr) {
		Connection conn = getConnection();
		ArrayList<String> result = new UserInfoDao().searchCarModel(conn, cop, searchStr);
		
		close(conn);
		
		return result;
	}

}
