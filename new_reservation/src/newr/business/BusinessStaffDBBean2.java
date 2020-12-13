package newr.business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BusinessStaffDBBean2 {

	private static BusinessStaffDBBean2 instance = new BusinessStaffDBBean2();

	public static BusinessStaffDBBean2 getInstance() {
		return instance;
	}

	private BusinessStaffDBBean2(){}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/newr");
	    return ds.getConnection();

	}

	public void insertStaff(BusinessStaffDataBean2 staff, String id) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		int number = 0;
		String shop_num = "몰라";
		int staff_num = 0;
		int surgery_num = 0;

		// staff 넣기      
		try{
			conn = getConnection();

			pstmt = conn.prepareStatement("select shop.shop_num from shop where shop.business_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()){
				shop_num = rs.getString(1);
				
				pstmt2 = conn.prepareStatement("select max(staff_num) from staff");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					number = rs2.getInt(1)+1;
				else
					number=1; 
				
					// 쿼리 작성5
					pstmt = conn.prepareStatement(
					    "insert into STAFF values (?,?,?,?)");
					pstmt.setInt(1, number);
					pstmt.setString(2, shop_num);
					pstmt.setString(3, staff.getStaff_names1());
					pstmt.setInt(4, 2);
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select shop.shop_num from shop where shop.business_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()){
				shop_num = rs.getString(1);
				
				pstmt2 = conn.prepareStatement("select max(staff_num) from staff");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					number = rs2.getInt(1)+1;
				else
					number=1; 
				
					// 쿼리 작성5
					pstmt = conn.prepareStatement(
					    "insert into STAFF values (?,?,?,?)");
					pstmt.setInt(1, number);
					pstmt.setString(2, shop_num);
					pstmt.setString(3, staff.getStaff_names2());
					pstmt.setInt(4, 2);
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select shop.shop_num from shop where shop.business_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()){
				shop_num = rs.getString(1);
				
				pstmt2 = conn.prepareStatement("select max(staff_num) from staff");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					number = rs2.getInt(1)+1;
				else
					number=1; 
				
					// 쿼리 작성5
					pstmt = conn.prepareStatement(
					    "insert into STAFF values (?,?,?,?)");
					pstmt.setInt(1, number);
					pstmt.setString(2, shop_num);
					pstmt.setString(3, staff.getStaff_names3());
					pstmt.setInt(4, 2);
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select shop.shop_num from shop where shop.business_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()){
				shop_num = rs.getString(1);
				
				pstmt2 = conn.prepareStatement("select max(staff_num) from staff");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					number = rs2.getInt(1)+1;
				else
					number=1; 
				
					// 쿼리 작성5
					pstmt = conn.prepareStatement(
					    "insert into STAFF values (?,?,?,?)");
					pstmt.setInt(1, number);
					pstmt.setString(2, shop_num);
					pstmt.setString(3, staff.getStaff_names4());
					pstmt.setInt(4, 2);
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select shop.shop_num from shop where shop.business_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()){
				shop_num = rs.getString(1);
				
				pstmt2 = conn.prepareStatement("select max(staff_num) from staff");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					number = rs2.getInt(1)+1;
				else
					number=1; 
				
					// 쿼리 작성5
					pstmt = conn.prepareStatement(
					    "insert into STAFF values (?,?,?,?)");
					pstmt.setInt(1, number);
					pstmt.setString(2, shop_num);
					pstmt.setString(3, staff.getStaff_names5());
					pstmt.setInt(4, 2);
					pstmt.executeUpdate();

			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}

		// surgery 넣기 직원1
		try{
			conn = getConnection();

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names1());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail1());
					pstmt.setTime(4, new Time(staff.getD_sg_time1().getTime()));
					pstmt.setInt(5, staff.getSg_price1());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names1());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail11());
					pstmt.setTime(4, new Time(staff.getD_sg_time11().getTime()));
					pstmt.setInt(5, staff.getSg_price11());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names1());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail12());
					pstmt.setTime(4, new Time(staff.getD_sg_time12().getTime()));
					pstmt.setInt(5, staff.getSg_price12());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names1());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail13());
					pstmt.setTime(4, new Time(staff.getD_sg_time13().getTime()));
					pstmt.setInt(5, staff.getSg_price13());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names1());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail14());
					pstmt.setTime(4, new Time(staff.getD_sg_time14().getTime()));
					pstmt.setInt(5, staff.getSg_price14());
					pstmt.executeUpdate();

			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		
		// surgery 넣기 직원2
		try{
			conn = getConnection();

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names2());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail2());
					pstmt.setTime(4, new Time(staff.getD_sg_time2().getTime()));
					pstmt.setInt(5, staff.getSg_price2());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names2());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail21());
					pstmt.setTime(4, new Time(staff.getD_sg_time21().getTime()));
					pstmt.setInt(5, staff.getSg_price21());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names2());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail22());
					pstmt.setTime(4, new Time(staff.getD_sg_time22().getTime()));
					pstmt.setInt(5, staff.getSg_price22());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names2());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail23());
					pstmt.setTime(4, new Time(staff.getD_sg_time23().getTime()));
					pstmt.setInt(5, staff.getSg_price23());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names2());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail24());
					pstmt.setTime(4, new Time(staff.getD_sg_time24().getTime()));
					pstmt.setInt(5, staff.getSg_price24());
					pstmt.executeUpdate();

			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		
		
		// surgery 넣기 직원3
		try{
			conn = getConnection();

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names3());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail3());
					pstmt.setTime(4, new Time(staff.getD_sg_time3().getTime()));
					pstmt.setInt(5, staff.getSg_price3());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names3());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail31());
					pstmt.setTime(4, new Time(staff.getD_sg_time31().getTime()));
					pstmt.setInt(5, staff.getSg_price31());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names3());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail32());
					pstmt.setTime(4, new Time(staff.getD_sg_time32().getTime()));
					pstmt.setInt(5, staff.getSg_price32());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names3());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail33());
					pstmt.setTime(4, new Time(staff.getD_sg_time33().getTime()));
					pstmt.setInt(5, staff.getSg_price33());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names3());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail34());
					pstmt.setTime(4, new Time(staff.getD_sg_time34().getTime()));
					pstmt.setInt(5, staff.getSg_price34());
					pstmt.executeUpdate();

			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		
		// surgery 넣기 직원4
		try{
			conn = getConnection();

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names4());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail4());
					pstmt.setTime(4, new Time(staff.getD_sg_time4().getTime()));
					pstmt.setInt(5, staff.getSg_price4());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names4());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail41());
					pstmt.setTime(4, new Time(staff.getD_sg_time41().getTime()));
					pstmt.setInt(5, staff.getSg_price41());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names4());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail42());
					pstmt.setTime(4, new Time(staff.getD_sg_time42().getTime()));
					pstmt.setInt(5, staff.getSg_price42());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names4());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail43());
					pstmt.setTime(4, new Time(staff.getD_sg_time43().getTime()));
					pstmt.setInt(5, staff.getSg_price43());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names4());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail44());
					pstmt.setTime(4, new Time(staff.getD_sg_time44().getTime()));
					pstmt.setInt(5, staff.getSg_price44());
					pstmt.executeUpdate();

			}	
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		
		// surgery 넣기 직원5
		try{
			conn = getConnection();

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names5());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail5());
					pstmt.setTime(4, new Time(staff.getD_sg_time5().getTime()));
					pstmt.setInt(5, staff.getSg_price5());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names5());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail51());
					pstmt.setTime(4, new Time(staff.getD_sg_time51().getTime()));
					pstmt.setInt(5, staff.getSg_price51());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names5());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail52());
					pstmt.setTime(4, new Time(staff.getD_sg_time52().getTime()));
					pstmt.setInt(5, staff.getSg_price52());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names5());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail53());
					pstmt.setTime(4, new Time(staff.getD_sg_time53().getTime()));
					pstmt.setInt(5, staff.getSg_price53());
					pstmt.executeUpdate();

			}	
			
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

			pstmt = conn.prepareStatement("select staff_num from staff where staff_name = ?");
			pstmt.setString(1, staff.getStaff_names5());
			rs = pstmt.executeQuery();

			if (rs.next()){
				staff_num = rs.getInt(1);
				
				pstmt2 = conn.prepareStatement("select max(surgery_num) from surgery");
				rs2 = pstmt2.executeQuery();
				
				if (rs2.next())
					surgery_num = rs2.getInt(1)+1;
				else
					surgery_num=1;
				
				
					pstmt = conn.prepareStatement(
					    "insert into SURGERY values (?,?,?,?,?)");

					// 쿼리작성
					pstmt.setInt(1, surgery_num);
					pstmt.setInt(2, staff_num);
					pstmt.setString(3, staff.getSg_detail54());
					pstmt.setTime(4, new Time(staff.getD_sg_time54().getTime()));
					pstmt.setInt(5, staff.getSg_price54());
					pstmt.executeUpdate();

			}	
			
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