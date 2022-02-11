package model.domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.domain.datainfo.LoginDTO;
import util.DBUtil;

public class LoginDAO {

	public static boolean addLogin(LoginDTO log) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("insert into mylogin values(?, ?, ? )");
			pstmt.setString(1, log.getId());
			pstmt.setString(2, log.getPw());
			pstmt.setString(3, log.getEmail());
			
			int result = pstmt.executeUpdate();
		
			if(result == 1){
				return true;
			}
		}finally{
			DBUtil.close(con, pstmt);
		}
		return false;
	}
	
	public static LoginDTO checkLogin(String log) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		LoginDTO log2 = null;
		
		try{
			con = DBUtil.getConnection();
			pstmt = con.prepareStatement("select * from mylogin where id=?");
			pstmt.setString(1, log);
			rset = pstmt.executeQuery();
			if(rset.next()){
				log2 = new LoginDTO(rset.getString(1), rset.getString(2), rset.getString(3));
			}
		}finally{
			DBUtil.close(con, pstmt, rset);
		}
		return log2;
	}
	
}
