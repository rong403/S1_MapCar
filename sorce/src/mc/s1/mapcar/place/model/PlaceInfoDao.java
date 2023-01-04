package mc.s1.mapcar.place.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mc.s1.mapcar.common.jdbc.JdbcTemplate;

public class PlaceInfoDao {
//	insert
//	update
//	delete
//	selectList
//	selectOne
	// 최소 5개 
//	insert - 등록
	public int insert(Connection conn, PlaceInfoVo vo) {
		int result = 0;
		return result;
	}
//	update - 수정
	public int update(Connection conn, PlaceInfoVo vo, String p_no/*주로 PK*/) {
		int result = 0;
		return result;
	}
//	delete  - 삭제
	public int delete(Connection conn, String p_no/*주로 PK*/) {
		int result = 0;
		return result;
	}
//	selectList  - 목록조회
	public List<PlaceInfoVo> selectList(Connection conn){
		List<PlaceInfoVo> volist = null;
		String sql = " select * from Place_Info where P_ROAD_NO like '%테헤란로%'";
//		Statement stmt = conn.createStatement();
//		ResultSet rs = stmt.executeQuery(sql);
//		while(rs.next()) {
//			
//		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				volist = new ArrayList<PlaceInfoVo>();
				do {
					PlaceInfoVo vo = new PlaceInfoVo();
					vo = new PlaceInfoVo();
					vo.setP_no(rs.getString("p_no"));
					vo.setP_name(rs.getString("p_name"));
					vo.setP_road_no(rs.getString("p_road_no"));
					vo.setP_address(rs.getString("p_address"));
					vo.setP_info(rs.getString("p_info"));
					vo.setP_type(rs.getString("p_type"));
					vo.setP_val(rs.getString("p_val"));
					vo.setP_number(rs.getInt("p_number"));
					vo.setP_unit(rs.getString("p_unit"));
					vo.setPlace_no(rs.getInt("place_no"));
					volist.add(vo);
				} while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcTemplate.close(rs);
			JdbcTemplate.close(pstmt);
		}
		return volist;
	}
//	selectList  - 목록조회
	public List<PlaceInfoVo> selectList(Connection conn, String searchword){
		List<PlaceInfoVo> volist = null;
		String sql = " select * from Place_Info where P_ROAD_NO like '%테헤란로%'";
		
		String sqlSearch = "select * from (select t1.*, rownum r from "
				+ " (select * from Place_Info where P_NAME LIKE ? or P_ROAD_NO LIKE ? or "
				+ "P_ADDRESS LIKE ? ORDER BY P_NAME ASC, P_ROAD_NO ASC, P_ADDRESS ASC ) t1 ) t2 ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(searchword != null && !searchword.equals("")) {
				pstmt = conn.prepareStatement(sqlSearch);
				searchword = "%"+searchword+"%";   // LIKE 형식
				pstmt.setString(1, searchword);
				pstmt.setString(2, searchword);
				pstmt.setString(3, searchword);
			}else {
				pstmt = conn.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				volist = new ArrayList<PlaceInfoVo>();
				do {
					PlaceInfoVo vo = new PlaceInfoVo();
					vo = new PlaceInfoVo();
					vo.setP_no(rs.getString("p_no"));
					vo.setP_name(rs.getString("p_name"));
					vo.setP_road_no(rs.getString("p_road_no"));
					vo.setP_address(rs.getString("p_address"));
					vo.setP_info(rs.getString("p_info"));
					vo.setP_type(rs.getString("p_type"));
					vo.setP_val(rs.getString("p_val"));
					vo.setP_number(rs.getInt("p_number"));
					vo.setP_unit(rs.getString("p_unit"));
					vo.setPlace_no(rs.getInt("place_no"));
					volist.add(vo);
				} while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcTemplate.close(rs);
			JdbcTemplate.close(pstmt);
		}
		
		return volist;
	}
//	selectList  - 목록조회
	public ArrayList<String> selectList2(Connection conn, String searchword){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> result = new ArrayList<String>();
		
		String sqlSearch = "select * from (select t1.*, rownum r from "
				+ " (select P_ADDRESS from Place_Info where P_NAME LIKE ? or P_ROAD_NO LIKE ? or P_ADDRESS LIKE ? ORDER BY P_NAME ASC, P_ROAD_NO ASC, P_ADDRESS ASC ) t1 ) t2 ";
		
		try {
			pstmt = conn.prepareStatement(sqlSearch);
			searchword = "%"+searchword+"%";   // LIKE 형식
			pstmt.setString(1, searchword);
			pstmt.setString(2, searchword);
			pstmt.setString(3, searchword);
			rs = pstmt.executeQuery();	//결과는 무조건 하나니까 if로
			while(rs.next()) {
				result.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcTemplate.close(rs);
			JdbcTemplate.close(pstmt);
		}
		
		return result;
	}
//	selectOne - 상세조회
	public PlaceInfoVo selectOne(Connection conn, String p_no/*주로 PK*/){
		PlaceInfoVo vo = null;
		return vo;
	}
}
