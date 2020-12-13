package newr.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginDBBean {
	private static LoginDBBean instance = new LoginDBBean();
    
    public static LoginDBBean getInstance() {
        return instance;
    }
    
    private LoginDBBean() { }
	
	private Connection getConnection() throws Exception {
	    Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/newr");
	    return ds.getConnection();
	}
	
	//로그인 시 고객회원일 때
	public int customerCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int dbleave = 0;
		int x = -1;
		
		try{
			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select customer_passwd, leave_ck from customer where customer_id = ?");
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd = rs.getString("customer_passwd");
				dbleave = rs.getInt("leave_ck");
				
				if(dbleave == 0){
					if(dbpasswd.equals(passwd))
						x = 1; //인증 성공
					else
						x = 0; //비밀번호 틀림
				}
			}else
				x = -1;//해당 아이디 없음
							
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
	
	//로그인 시 고객회원일 때
		public int urlCheck(String url) throws Exception {
			int x = -1;
			
			try{
				if(url == null || url.equals("") || url.equals("index.jsp"))
					x = 0;
				else if(url.equals("search.jsp"))
					x = 1;
				else
					x = 2;
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			return x;
		}
	
	
	//로그인 시 사업자 회원일 때
	public int businessCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int dbleave = 0;
		int x = -1;
		
		try{
			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select business_passwd, leave_ck from business where business_id = ?");
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd = rs.getString("business_passwd");
				dbleave = rs.getInt("leave_ck");
				
				if(dbleave == 0){
					if(dbpasswd.equals(passwd))
						x = 1; //인증 성공
					else
						x = 0; //비밀번호 틀림
				}
			}else
				x = -1;//해당 아이디 없음
							
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
	
	//세션아이디가 고객인지 사업자인지 확인
	public boolean loginCheck(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean x = false;
		
		try{
			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select customer_id from customer where customer_id = ?");
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				x = true;
			}
							
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
	
	
	//관리자 로그인
	public int adminCheck(String id, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		
		try{
			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select admin_passwd from env_vari where admin_id = ?");
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				dbpasswd = rs.getString("admin_passwd");
					if(dbpasswd.equals(passwd))
						x = 1; //인증 성공
					else
						x = 0; //비밀번호 틀림
			}else
				x = -1;//해당 아이디 없음
							
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
}
