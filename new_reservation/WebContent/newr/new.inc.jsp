<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>

<style>
.new_thumb {
	margin-bottom: 30px;
}
.detail {
	font-size: 12px;
	margin-top: 10px;
}
</style>

<div class="page-title">NEW SHOP</div>

<%
request.setCharacterEncoding("utf-8");

String dbUrl = "jdbc:mysql://localhost:3306/newr";
Class.forName("com.mysql.jdbc.Driver");
try {
	Connection conn = DriverManager.getConnection(dbUrl, "bban","1234");
	Statement stmt = conn.createStatement();
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
					
	//샵 넘 제일 큰 값
	pstmt1 = conn.prepareStatement("SELECT MAX(shop_num) FROM searchimgview");
	rs1 = pstmt1.executeQuery();

	if(rs1.next()){
		int num = rs1.getInt(1);
		%>
		<div class="row new_thumb">
			<%
			for(int i=num; i>(num-4); i--){
				pstmt2 = conn.prepareStatement("SELECT * FROM searchimgview where shop_num = ?");
				pstmt2.setInt(1, i);
				rs2 = pstmt2.executeQuery();
				
				while(rs2.next()){
					String shop_name = rs2.getString(3);
					String shop_addr = rs2.getString(4);
					String shop_phone = rs2.getString(5);
					String shop_intro = rs2.getString(6);
					String shop_img_path = rs2.getString(9);
				%>
					<div class="col-xs-6 col-md-3">
						<div class="thumbnail">
							<a href="reserve.jsp?shop_num=<%=i%>"><img src="img/<%=shop_img_path%>" alt="<%=shop_name%>" width="300px" height="200px" style="height: 100%;"></a>
							<div class="info"><%=shop_name%>
								<div class="detail">
									<%=shop_addr%>
									<br><%=shop_intro%>
								</div>
							</div>
						</div>
					</div>
		<%
				}//while문 끝
			}//for문 끝
	%>
		</div>
		<div class="row new_thumb">
	<%
		for(int j=(num-4); j>(num-8); j--){
			pstmt2 = conn.prepareStatement("SELECT * FROM searchimgview where shop_num = ?");
			pstmt2.setInt(1, j);
			rs2 = pstmt2.executeQuery();
			
			while(rs2.next()){
				String shop_name = rs2.getString(3);
				String shop_addr = rs2.getString(4);
				String shop_phone = rs2.getString(5);
				String shop_intro = rs2.getString(6);
				String shop_img_path = rs2.getString(9);
			%>
				<div class="col-xs-6 col-md-3">
					<div class="thumbnail">
						<a href="reserve.jsp?shop_num=<%=j%>"><img src="img/<%=shop_img_path%>" alt="<%=shop_name%>" width="300px" height="200px" style="height: 100%;"></a>
						<div class="info"><%=shop_name%>
							<div class="detail">
								<%=shop_addr%>
								<br><%=shop_intro%>
							</div>
						</div>
					</div>
				</div>
			<%
			}//while문 끝
		}//for문 끝
	%>
		</div>
		<div class="row new_thumb">
	<%
		for(int k=(num-8); k>(num-12); k--){
			pstmt2 = conn.prepareStatement("SELECT * FROM searchimgview where shop_num = ?");
			pstmt2.setInt(1, k);
			rs2 = pstmt2.executeQuery();
			
			while(rs2.next()){
				String shop_name = rs2.getString(3);
				String shop_addr = rs2.getString(4);
				String shop_phone = rs2.getString(5);
				String shop_intro = rs2.getString(6);
				String shop_img_path = rs2.getString(9);
			%>
				<div class="col-xs-6 col-md-3">
					<div class="thumbnail">
						<a href="reserve.jsp?shop_num=<%=k%>"><img src="img/<%=shop_img_path%>" alt="<%=shop_name%>" width="300px" height="200px" style="height: 100%;"></a>
						<div class="info"><%=shop_name%>
							<div class="detail">
								<%=shop_addr%>
								<br><%=shop_intro%>
							</div>
						</div>
					</div>
				</div>
			<%
			}//while문 끝
		}//for문 끝
	%>
		</div>
	<%
	}//if문 끝
	rs1.close();
	rs2.close();
	stmt.close();
	conn.close();

} catch(SQLException e) {
out.print(e.toString());
}
%>