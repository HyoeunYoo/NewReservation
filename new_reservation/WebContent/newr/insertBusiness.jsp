<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="newr.business.BusinessJoinDBBean" %>
<%@ page import="newr.business.BusinessJoinDataBean" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String dir= "C:/_server/eclipseWorkspace/ebban/WebContent/newr/img";
	int max=20*1024*1024;
	MultipartRequest m=null;
	
	String file1=null;
	String file2=null;
	String file3=null;
	String file4=null;
	String file5=null;

	String ofile1 = null;
	String ofile2 = null;
	String ofile3 = null;
	String ofile4 = null;
	String ofile5 = null;

	try {
		m=new MultipartRequest(request,dir,max,"utf-8",new DefaultFileRenamePolicy());

		file1=m.getFilesystemName("s_img_path1");
		file2=m.getFilesystemName("s_img_path2");
		file3=m.getFilesystemName("s_img_path3");
		file4=m.getFilesystemName("s_img_path4");
		file5=m.getFilesystemName("s_img_path5");

 		ofile1=m.getOriginalFileName("s_img_path1");
 		ofile2=m.getOriginalFileName("s_img_path2");
 		ofile3=m.getOriginalFileName("s_img_path3");
 		ofile4=m.getOriginalFileName("s_img_path4");
 		ofile5=m.getOriginalFileName("s_img_path5");
 		
 		
	} catch(Exception e) {
		out.println(e);
	}

	
	

	
	
	String business_name = m.getParameter("business_name");
	String business_num = m.getParameter("business_num");
	String business_id = m.getParameter("business_id");
	String business_passwd1 = m.getParameter("business_passwd1");
	String business_phone1 = m.getParameter("business_phone1");
	String business_phone2 = m.getParameter("business_phone2");	
	String business_phone3 = m.getParameter("business_phone3");
	String business_email1 = m.getParameter("business_email1");
	String business_email2 = m.getParameter("business_email2");

	String shop_name = m.getParameter("shop_name");
	String shop_addr1 = m.getParameter("shop_addr1");

	out.println(shop_addr1);

	String shop_addr2 = m.getParameter("shop_addr2");
	String shop_phone1 = m.getParameter("shop_phone1");	
	String shop_phone2 = m.getParameter("shop_phone2");
	String shop_phone3 = m.getParameter("shop_phone3");
	String shop_intro = m.getParameter("shop_intro");

	String shop_hash_content1 = m.getParameter("shop_hash_content1");
	String shop_hash_content2 = m.getParameter("shop_hash_content2");
	String shop_hash_content3 = m.getParameter("shop_hash_content3");
	
	String shop_kind = m.getParameter("shop_kind");

%>

<jsp:useBean id="business" class="newr.business.BusinessJoinDataBean">
	<jsp:setProperty name="business" property="*"/>
</jsp:useBean>

<%


	business.setBusiness_name(business_name);
	business.setBusiness_num(business_num);
	business.setBusiness_id(business_id);
	business.setBusiness_passwd1(business_passwd1);
	business.setBusiness_phone1(business_phone1);
	business.setBusiness_phone2(business_phone2);
	business.setBusiness_phone3(business_phone3);
	business.setBusiness_email1(business_email1);
	business.setBusiness_email2(business_email2);

	business.setShop_name(shop_name);
	business.setShop_addr1(shop_addr1);
	business.setShop_addr2(shop_addr2);
	business.setShop_phone1(shop_phone1);
	business.setShop_phone2(shop_phone2);
	business.setShop_phone3(shop_phone3);
	business.setShop_intro(shop_intro);

	business.setShop_hash_content1(shop_hash_content1);
	business.setShop_hash_content2(shop_hash_content2);
	business.setShop_hash_content3(shop_hash_content3);
	
	business.setShop_kind(shop_kind);
	
	business.setS_img_path1(ofile1);
	business.setS_img_path2(ofile2);
	business.setS_img_path3(ofile3);
	business.setS_img_path4(ofile4);
	business.setS_img_path5(ofile5);


	BusinessJoinDBBean businessJoin = BusinessJoinDBBean.getInstance();
	businessJoin.insertBusiness(business); 
	
	response.sendRedirect("index.jsp");

%>





<%-- <jsp:getProperty name="business" property="business_name" />님 회원가입을 축하합니다. <br> --%>
<%-- <jsp:getProperty name="business" property="business_num" />사업자번호<br> --%>
<%-- <jsp:getProperty name="business" property="business_id" />아이디<br> --%>
<%-- <jsp:getProperty name="business" property="business_passwd1" />비번<br> --%>
<%-- <jsp:getProperty name="business" property="business_phone1" />폰1<br> --%>
<%-- <jsp:getProperty name="business" property="business_phone2" />폰2<br> --%>
<%-- <jsp:getProperty name="business" property="business_phone3" />폰3<br> --%>
<%-- <jsp:getProperty name="business" property="business_email1" />이메일1<br> --%>
<%-- <jsp:getProperty name="business" property="business_email2" />이메일2<br><br><br> --%>


<%-- <jsp:getProperty name="business" property="shop_name" />매장이름<br> --%>
<%-- <jsp:getProperty name="business" property="shop_addr1" />매장주소1<br> --%>
<%-- <jsp:getProperty name="business" property="shop_addr2" />매장주소2<br> --%>
<%-- <jsp:getProperty name="business" property="shop_phone1" />매장폰1<br> --%>
<%-- <jsp:getProperty name="business" property="shop_phone2" />매장폰2<br> --%>
<%-- <jsp:getProperty name="business" property="shop_phone3" />매장폰3<br> --%>
<%-- <jsp:getProperty name="business" property="shop_intro" />소개<br><br><br> --%>


<%-- <jsp:getProperty name="business" property="s_img_path1" />이미지경로1<br> --%>
<%-- <jsp:getProperty name="business" property="s_img_path2" />이미지경로2<br> --%>
<%-- <jsp:getProperty name="business" property="s_img_path3" />이미지경로3<br> --%>
<%-- <jsp:getProperty name="business" property="s_img_path4" />이미지경로4<br> --%>
<%-- <jsp:getProperty name="business" property="s_img_path5" />이미지경로5<br><br><br> --%>

<%-- <jsp:getProperty name="business" property="shop_hash_content1" />해시1<br> --%>
<%-- <jsp:getProperty name="business" property="shop_hash_content2" />해시2<br> --%>
<%-- <jsp:getProperty name="business" property="shop_hash_content3" />해시3<br><br><br> --%>

<%-- <jsp:getProperty name="business" property="shop_kind" />종류<br> --%>
