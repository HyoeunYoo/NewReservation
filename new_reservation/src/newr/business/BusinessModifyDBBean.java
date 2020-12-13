package newr.business;

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

public class BusinessModifyDBBean {

	private static BusinessModifyDBBean instance = new BusinessModifyDBBean();

	public static BusinessModifyDBBean getInstance() {
		return instance;
	}

	private BusinessModifyDBBean(){}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/newr");
	    return ds.getConnection();

	}

	public void modifyBusiness1(BusinessModifyDataBean business, String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		
		// business 넣기      
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
			    "update BUSINESS set business_passwd = ?, business_phone = ?, business_email = ? where business_id = ?");


			pstmt.setString(1, business.getBusiness_passwd1());
			pstmt.setString(2, business.getBusiness_phone());
			pstmt.setString(3, business.getBusiness_email());
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

		public void modifyBusiness2(BusinessModifyDataBean2 business, String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		PreparedStatement pstmt4 = null;

		ResultSet rs = null;
		
		int shop_num = 0;
		int shop_img_num = 0;
		int shop_hasy_num = 0;
		
		// business 수정 넣기
		try{
			conn = getConnection();

			pstmt = conn.prepareStatement(
			    "select shop_num from shop where business_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				shop_num = rs.getInt(1);
			}

			pstmt3 = conn.prepareStatement(
			    "delete from shop_img where shop_num = ?");
			pstmt3.setInt(1, shop_num);
			pstmt3.executeUpdate();
				
				
			pstmt2 = conn.prepareStatement(
			    "delete from shop_hasy where shop_num = ?");
			pstmt2.setInt(1, shop_num);
			pstmt2.executeUpdate();

			pstmt4 = conn.prepareStatement(
			    "update shop set shop_name = ?, shop_addr = ?, shop_phone = ?, shop_intro = ?, shop_kind = ?  where shop_num = ?");
			pstmt4.setString(1, business.getShop_name());
			pstmt4.setString(2, business.getShop_addr1()+business.getShop_addr2());
			pstmt4.setString(3, business.getShop_phone());
			pstmt4.setString(4, business.getShop_intro());
			pstmt4.setString(5, business.getShop_kind());
			pstmt4.setInt(6, shop_num);
			pstmt4.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		
		
		// 이미지 경로 넣기
				try{
					conn = getConnection();

					pstmt = conn.prepareStatement("select max(shop_img_num) from shop_img");
					rs = pstmt.executeQuery();
					
					if (rs.next())
						shop_img_num = rs.getInt(1)+1;
				    else{
						shop_img_num=1; 
				    }
					       
					pstmt = conn.prepareStatement(
					    "insert into shop_img values (?,?,?,?)");


					pstmt.setInt(1, shop_img_num);
					pstmt.setInt(2, shop_num);
					pstmt.setString(3, business.getS_img_path1());
					pstmt.setInt(4, 1);
					pstmt.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally{
					if (pstmt != null) 
						try { pstmt.close(); } catch(SQLException ex) {}
					if (conn != null) 
						try { conn.close(); } catch(SQLException ex) {}
				}

				try{
					conn = getConnection();

					pstmt = conn.prepareStatement("select max(shop_img_num) from shop_img");
					rs = pstmt.executeQuery();
					
					if (rs.next())
						shop_img_num = rs.getInt(1)+1;
				    else{
						shop_img_num=1; 
				    }
					       
					pstmt = conn.prepareStatement(
					    "insert into shop_img values (?,?,?,?)");


					pstmt.setInt(1, shop_img_num);
					pstmt.setInt(2, shop_num);
					pstmt.setString(3, business.getS_img_path2());
					pstmt.setInt(4, 0);
					pstmt.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally{
					if (pstmt != null) 
						try { pstmt.close(); } catch(SQLException ex) {}
					if (conn != null) 
						try { conn.close(); } catch(SQLException ex) {}
				}

				try{
					conn = getConnection();

					pstmt = conn.prepareStatement("select max(shop_img_num) from shop_img");
					rs = pstmt.executeQuery();
					
					if (rs.next())
						shop_img_num = rs.getInt(1)+1;
				    else{
						shop_img_num=1; 
				    }
					       
					pstmt = conn.prepareStatement(
					    "insert into shop_img values (?,?,?,?)");


					pstmt.setInt(1, shop_img_num);
					pstmt.setInt(2, shop_num);
					pstmt.setString(3, business.getS_img_path3());
					pstmt.setInt(4, 0);
					pstmt.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally{
					if (pstmt != null) 
						try { pstmt.close(); } catch(SQLException ex) {}
					if (conn != null) 
						try { conn.close(); } catch(SQLException ex) {}
				}

				try{
					conn = getConnection();

					pstmt = conn.prepareStatement("select max(shop_img_num) from shop_img");
					rs = pstmt.executeQuery();
					
					if (rs.next())
						shop_img_num = rs.getInt(1)+1;
				    else{
						shop_img_num=1; 
				    }
					       
					pstmt = conn.prepareStatement(
					    "insert into shop_img values (?,?,?,?)");


					pstmt.setInt(1, shop_img_num);
					pstmt.setInt(2, shop_num);
					pstmt.setString(3, business.getS_img_path4());
					pstmt.setInt(4, 0);
					pstmt.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally{
					if (pstmt != null) 
						try { pstmt.close(); } catch(SQLException ex) {}
					if (conn != null) 
						try { conn.close(); } catch(SQLException ex) {}
				}

				try{
					conn = getConnection();

					pstmt = conn.prepareStatement("select max(shop_img_num) from shop_img");
					rs = pstmt.executeQuery();
					
					if (rs.next())
						shop_img_num = rs.getInt(1)+1;
				    else{
						shop_img_num=1; 
				    }
					       
					pstmt = conn.prepareStatement(
					    "insert into shop_img values (?,?,?,?)");


					pstmt.setInt(1, shop_img_num);
					pstmt.setInt(2, shop_num);
					pstmt.setString(3, business.getS_img_path5());
					pstmt.setInt(4, 0);
					pstmt.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally{
					if (pstmt != null) 
						try { pstmt.close(); } catch(SQLException ex) {}
					if (conn != null) 
						try { conn.close(); } catch(SQLException ex) {}
				}

				

				// 해시태그
				try{
					conn = getConnection();

					pstmt = conn.prepareStatement("select max(shop_hasy_num) from shop_hasy");
					rs = pstmt.executeQuery();
					
					if (rs.next())
						shop_hasy_num = rs.getInt(1)+1;
				    else{
						shop_hasy_num = 1; 
				    }

					            
					pstmt = conn.prepareStatement(
					    "insert into SHOP_HASY values (?,?,?)");


					pstmt.setInt(1, shop_hasy_num);
					pstmt.setInt(2, shop_num);
					pstmt.setString(3, business.getShop_hash_content1());
					pstmt.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally{
					if (pstmt != null) 
						try { pstmt.close(); } catch(SQLException ex) {}
					if (conn != null) 
						try { conn.close(); } catch(SQLException ex) {}
				}

				try{
					conn = getConnection();

					pstmt = conn.prepareStatement("select max(shop_hasy_num) from shop_hasy");
					rs = pstmt.executeQuery();
					
					if (rs.next())
						shop_hasy_num = rs.getInt(1)+1;
				    else{
						shop_hasy_num = 1; 
				    }

					            
					pstmt = conn.prepareStatement(
					    "insert into SHOP_HASY values (?,?,?)");


					pstmt.setInt(1, shop_hasy_num);
					pstmt.setInt(2, shop_num);
					pstmt.setString(3, business.getShop_hash_content2());
					pstmt.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}finally{
					if (pstmt != null) 
						try { pstmt.close(); } catch(SQLException ex) {}
					if (conn != null) 
						try { conn.close(); } catch(SQLException ex) {}
				}

				try{
					conn = getConnection();

					pstmt = conn.prepareStatement("select max(shop_hasy_num) from shop_hasy");
					rs = pstmt.executeQuery();
					
					if (rs.next())
						shop_hasy_num = rs.getInt(1)+1;
				    else{
						shop_hasy_num = 1; 
				    }

					            
					pstmt = conn.prepareStatement(
					    "insert into SHOP_HASY values (?,?,?)");


					pstmt.setInt(1, shop_hasy_num);
					pstmt.setInt(2, shop_num);
					pstmt.setString(3, business.getShop_hash_content3());
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