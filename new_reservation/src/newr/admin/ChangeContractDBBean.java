package newr.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ChangeContractDBBean {
	
    private static ChangeContractDBBean instance = new ChangeContractDBBean();
    public static ChangeContractDBBean getInstance() {
        return instance;
    }
    
    private ChangeContractDBBean() {}
    
    //커넥션풀로부터 Connection객체를 얻어냄
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/newr");
        return ds.getConnection();
    }
 
    // 계약중
    public void change_ing(String b_id) 
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;

        String sql="";

        try {
            conn = getConnection();
	    
            // 쿼리를 작성
            sql = "update business set contract_ck = 0 where business_id = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, b_id);
         			

            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
 
     // 계약만료
        public void change_expired(String b_id) 
                throws Exception {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            String sql="";

            try {
                conn = getConnection();
            
                // 쿼리를 작성
                sql = "update business set contract_ck = 1 where business_id = ?";

                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, b_id);
                        

                pstmt.executeUpdate();
            } catch(Exception ex) {
                ex.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch(SQLException ex) {}
                if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
                if (conn != null) try { conn.close(); } catch(SQLException ex) {}
            }
        }
     


    
}