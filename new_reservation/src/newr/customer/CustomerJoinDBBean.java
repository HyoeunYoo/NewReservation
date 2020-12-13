package newr.customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CustomerJoinDBBean {

	private static CustomerJoinDBBean instance = new CustomerJoinDBBean();

	public static CustomerJoinDBBean getInstance() {
		return instance;
	}

	private CustomerJoinDBBean(){}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/newr");
	    return ds.getConnection();

	}

	public void insertMember(CustomerJoinDataBean customer) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int coupon_count = 0;
			        
		try{
			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "insert into CUSTOMER values (?,?,?,?,?,?)");
			pstmt.setString(1, customer.getCustomer_id());
			pstmt.setString(2, customer.getCustomer_passwd1());
			pstmt.setString(3, customer.getCustomer_name());
			pstmt.setString(4, customer.getCustomer_phone1()+customer.getCustomer_phone2()+customer.getCustomer_phone3());
			pstmt.setString(5, customer.getCustomer_email1()+"@"+customer.getCustomer_email2());
			pstmt.setInt(6, 0);
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

	//아이디 중복확인
	public boolean idCheck(String id) 
				throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean x= false;
		
		try {

			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select customer_id from CUSTOMER where customer_id = ?");

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				x = true; //아이디 존재

			}
			

			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if ( pstmt != null )
				try { pstmt.close(); } catch(SQLException ex) {}
			if ( conn != null )
				try { conn.close(); } catch(SQLException ex) {}
	
			}

			return x;
		}
	} // end idCheck()
		
