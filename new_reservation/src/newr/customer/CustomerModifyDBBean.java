package newr.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Timestamp;
import java.util.Date;

public class CustomerModifyDBBean {

	private static CustomerModifyDBBean instance = new CustomerModifyDBBean();

	public static CustomerModifyDBBean getInstance() {
		return instance;
	}

	private CustomerModifyDBBean(){}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/newr");
	    return ds.getConnection();

	}

	public void modifyCustomer(CustomerModifyDataBean business, String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		// business 넣기      
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
			    "update CUSTOMER set customer_passwd = ?, customer_phone = ?, customer_email = ? where customer_id = ?");


			pstmt.setString(1, business.getCustomer_passwd1());
			pstmt.setString(2, business.getCustomer_phone());
			pstmt.setString(3, business.getCustomer_email());
			pstmt.setString(4, id);

			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
	}

}