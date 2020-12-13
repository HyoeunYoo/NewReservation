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

public class BusinessJoinDBBean {

	private static BusinessJoinDBBean instance = new BusinessJoinDBBean();

	public static BusinessJoinDBBean getInstance() {
		return instance;
	}

	private BusinessJoinDBBean(){}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/newr");
	    return ds.getConnection();

	}

	public void insertBusiness(BusinessJoinDataBean business) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int shop_num = 0;
		int shop_img_num = 0;
		int shop_hasy_num = 0;
		
		// business 넣기      
		try{
			conn = getConnection();

			
			pstmt = conn.prepareStatement(
			"insert into BUSINESS values (?,?,?,?,?,?,?,?)");

			pstmt.setString(1, business.getBusiness_id());
			pstmt.setString(2, business.getBusiness_passwd1());
			pstmt.setString(3, business.getBusiness_num());
			pstmt.setString(4, business.getBusiness_name());
			pstmt.setString(5, business.getBusiness_phone1()+business.getBusiness_phone2()+business.getBusiness_phone3());
			pstmt.setString(6, business.getBusiness_email1()+"@"+business.getBusiness_email2());
			pstmt.setInt(7, 0);
			pstmt.setInt(8, 1);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}

		//shop 넣기
		try{
			conn = getConnection();

			pstmt = conn.prepareStatement("select max(shop_num) from shop");
			rs = pstmt.executeQuery();
			
			if (rs.next())
		      shop_num = rs.getInt(1)+1;
		    else{
		    
			    shop_num = 1;
			}
				            
				pstmt = conn.prepareStatement(
				    "insert into SHOP values (?,?,?,?,?,?,?,?)");

				pstmt.setInt(1, shop_num);
				pstmt.setString(2, business.getBusiness_id());
				pstmt.setString(3, business.getShop_name());
				pstmt.setString(4, business.getShop_addr1()+business.getShop_addr2());
				pstmt.setString(5, business.getShop_phone1()+business.getShop_phone2()+business.getShop_phone3());
				pstmt.setString(6, business.getShop_intro());
				pstmt.setString(7, null);
				pstmt.setString(8, business.getShop_kind());
				pstmt.executeUpdate();

			
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