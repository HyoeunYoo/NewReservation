package newr.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CustomerMessageDBBean {
	
    private static CustomerMessageDBBean instance = new CustomerMessageDBBean();
    //.jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
    public static CustomerMessageDBBean getInstance() {
        return instance;
    }
    
    private CustomerMessageDBBean() {}
    
    //커넥션풀로부터 Connection객체를 얻어냄
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/newr");
        return ds.getConnection();
    }
 
    // 쪽지 추가(insert문)<=writePro.jsp페이지에서 사용
    public void insertMessage(CustomerMessageDataBean message) 
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num=message.getNum();
		int number=0;
        String sql="";

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select max(msg_num) from msg2");
			rs = pstmt.executeQuery();
			
			if (rs.next())
		      number = rs.getInt(1)+1;
		    else
		      number=1; 
		   	 
		    
            // 쿼리를 작성
            sql = "insert into msg2 values(?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, number);
            pstmt.setString(2, message.getSender());
            pstmt.setString(3, message.getMsg_receiver());
            pstmt.setString(4, message.getMsg_title());
            pstmt.setString(5, message.getMsg_content());
            pstmt.setTimestamp(6, message.getMsg_time());
            pstmt.setInt(7, 0);
            			


            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
 



    // 메시지 삭제
    public void delMessage(String d_num) 
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql="";

        try {
            conn = getConnection();
             
            
            // 쿼리를 작성
            sql = "delete from msg2 where msg_num = ?";

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

    // 보낸쪽지함에서 메시지 삭제
    public void sender_delMessage(String d_num) 
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql="";

        try {
            conn = getConnection();
             
            
            // 쿼리를 작성
            sql = "update msg2 set msg_del = 1 where msg_num = ?";

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