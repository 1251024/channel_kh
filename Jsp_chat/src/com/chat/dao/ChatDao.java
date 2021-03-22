package com.chat.dao;

import com.chat.dto.ChatDto;
import static com.chat.db.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class ChatDao {
	
	public int insert(ChatDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " INSERT INTO CHATDB "
				   + " VALUES(CHATSEQ.NEXTVAL, ?, ?, SYSDATE)";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getName());
			pstm.setString(2, dto.getContent());
			
			res = pstm.executeUpdate();
			
			if(res > 0) {
				con.commit();
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		
		return res;
		
	}
	
}
