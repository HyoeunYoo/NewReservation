<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="newr.business.BusinessModifyDBBean" %>
<%@ page import="newr.business.BusinessModifyDataBean2" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="newr.login.LoginDBBean"%>

<%
	String id = (String)session.getAttribute("id");
	request.setCharacterEncoding("utf-8");
	String dir="C:/_server/eclipseWorkspace/ebban/WebContent/newr/img";;
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

	String shop_name = m.getParameter("shop_name");
	String shop_addr1 = m.getParameter("shop_addr1");
	String shop_addr2 = m.getParameter("shop_addr2");
	String shop_phone = m.getParameter("shop_phone");
	String shop_intro = m.getParameter("shop_intro");

	String shop_hash_content1 = m.getParameter("shop_hash_content1");
	String shop_hash_content2 = m.getParameter("shop_hash_content2");
	String shop_hash_content3 = m.getParameter("shop_hash_content3");

	String shop_kind = m.getParameter("shop_kind");

%>

<jsp:useBean id="business" class="newr.business.BusinessModifyDataBean2">
	<jsp:setProperty name="business" property="*"/>
</jsp:useBean>

<%
	business.setShop_name(shop_name);
	business.setShop_addr1(shop_addr1);
	business.setShop_addr2(shop_addr2);
	business.setShop_phone(shop_phone);
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



	BusinessModifyDBBean businessModify = BusinessModifyDBBean.getInstance();
	businessModify.modifyBusiness2(business, id); 

%>


<%-- <jsp:getProperty name="business" property="shop_name" />매장이름<br> --%>
<%-- <jsp:getProperty name="business" property="shop_addr1" />매장주소1<br> --%>
<%-- <jsp:getProperty name="business" property="shop_addr2" />매장주소2<br> --%>
<%-- <jsp:getProperty name="business" property="shop_phone" />매장폰1<br> --%>
<%-- <jsp:getProperty name="business" property="shop_intro" />소개<br><br><br> --%>


<%-- <jsp:getProperty name="business" property="s_img_path1" />이미지경로1<br> --%>
<%-- <jsp:getProperty name="business" property="s_img_path2" />이미지경로2<br> --%>
<%-- <jsp:getProperty name="business" property="s_img_path3" />이미지경로3<br> --%>
<%-- <jsp:getProperty name="business" property="s_img_path4" />이미지경로4<br> --%>
<%-- <jsp:getProperty name="business" property="s_img_path5" />이미지경로5<br><br><br> --%>

<%-- <jsp:getProperty name="business" property="shop_hash_content1" />해시1<br> --%>
<%-- <jsp:getProperty name="business" property="shop_hash_content2" />해시2<br> --%>
<%-- <jsp:getProperty name="business" property="shop_hash_content3" />해시3<br><br><br> --%>
<script>
// 테이블 수정 후 join_ok 로 넘어감
setTimeout(function(){
	location.href = 'business_mypage2.jsp'
	//alert("수정 되었습니다.");
}, 10);
</script>