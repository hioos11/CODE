package com.koreait.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.koreait.db.Dbconn;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<BoardDTO> boardList = new ArrayList<>();
	String sql = "";
	
	public List<BoardDTO> selectBoard(){
		try {
			conn = Dbconn.getConnection();
			// 최신순 select (desc)
			sql = "select * from tb_boad order by b_idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setIdx(rs.getLong("b_idx"));
				board.setUserid(rs.getString("b_userid"));
				board.setName(rs.getString("b_name"));
				board.setTitle(rs.getString("b_title"));
				board.setContent(rs.getString("b_content"));
				board.setHit(rs.getInt("b_hit"));
				board.setUp(rs.getInt("b_up"));
				board.setRegdate(rs.getString("b_regdate"));
				board.setFile(rs.getString("b_file"));
				boardList.add(board);
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
}
