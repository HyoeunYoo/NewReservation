package newr.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BusinessStaffDelDBBean {
	
    private static BusinessStaffDelDBBean instance = new BusinessStaffDelDBBean();
    //.jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
    public static BusinessStaffDelDBBean getInstance() {
        return instance;
    }
    
    private BusinessStaffDelDBBean() {}
    
    //커넥션풀로부터 Connection객체를 얻어냄
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/newr");
        return ds.getConnection();
    }
 

    // 네일 직원 삭제
    public void delStaff(String d_num) 
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql="";

        try {
            conn = getConnection();
             
            
            // 쿼리를 작성
            sql = "delete from surgery where surgery_num = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, d_num);
           
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