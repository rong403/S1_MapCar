package mc.s1.mapcar.place.model;

import java.sql.Connection;
import java.util.List;

import mc.s1.mapcar.common.jdbc.JdbcTemplate;

public class PlaceInfoService {
	private PlaceInfoDao dao = new PlaceInfoDao();
	// 최소 5개 
//	insert - 등록
	public int insert(PlaceInfoVo vo) {
		int result = 0;
		Connection conn = JdbcTemplate.getConnection();
		
		result = dao.insert(conn, vo);
		
		JdbcTemplate.close(conn);
		return result;
	}
//	update - 수정
	public int update(PlaceInfoVo vo, String p_no/*주로 PK*/) {
		int result = 0;
		Connection conn = JdbcTemplate.getConnection();
		
		result = dao.update(conn, vo, p_no);
		
		JdbcTemplate.close(conn);
		return result;
	}
//	delete  - 삭제
	public int delete(String p_no/*주로 PK*/) {
		int result = 0;
		Connection conn = JdbcTemplate.getConnection();
		
		result = dao.delete(conn, p_no);
		
		JdbcTemplate.close(conn);
		return result;
	}
//	selectList  - 목록조회
	public List<PlaceInfoVo> selectList(){
		List<PlaceInfoVo> volist = null;
		Connection conn = JdbcTemplate.getConnection();
		
		volist = dao.selectList(conn);
		
		JdbcTemplate.close(conn);
		return volist;
	}
//	selectOne - 상세조회
	public PlaceInfoVo selectOne(String p_no/*주로 PK*/){
		PlaceInfoVo vo = null;
		Connection conn = JdbcTemplate.getConnection();
		
		vo = dao.selectOne(conn, p_no);
		
		JdbcTemplate.close(conn);
		return vo;
	}
}
