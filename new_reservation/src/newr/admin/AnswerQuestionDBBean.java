package newr.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import newr.admin.QuestionDataBean;

public class AnswerQuestionDBBean {
	
    private static AnswerQuestionDBBean instance = new AnswerQuestionDBBean();
    public static AnswerQuestionDBBean getInstance() {
        return instance;
    }
    
    private AnswerQuestionDBBean() {}
    
    //커넥션풀로부터 Connection객체를 얻어냄
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/newr");
        return ds.getConnection();
    }
 
    // 답글작성
    public void answering(QuestionDataBean question) 
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;

        String sql="";

        try {
            conn = getConnection();
	    
            // 쿼리를 작성
            sql = "update question set question_answer = ?, question_title = ?  where question_num = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, question.getAnswer());
            pstmt.setString(2, question.getQ_title() + " [답변완료]");
            pstmt.setInt(3, question.getQ_num());
         			

            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    
    @SuppressWarnings("resource")
	public void insertArticle(QuestionDataBean article) 
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;

		int number=0;
        String sql="";

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select max(question_num) from question");//board에 있는 레코드 갯수는 몇개냐
			rs = pstmt.executeQuery();
			
			if (rs.next())
		      number=rs.getInt(1)+1;
		    else
		      number=1; 
		   
            // 쿼리를 작성
            sql = "insert into question(question_num,question_writer,question_title,question_content,question_time,question_passwd,question_answer) values(?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, number);
            pstmt.setString(2, article.getQuestion_writer());
            pstmt.setString(3, article.getQ_title());
            pstmt.setString(4, article.getQuestion_content());
            pstmt.setTimestamp(5, article.getQuestion_date());
            pstmt.setString(6, article.getQuestion_passwd());
            pstmt.setString(7, null);

			
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    public int deleteArticle(int q_num, String question_passwd)
            throws Exception {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs= null;
            String dbpasswd="";
            int x=-1;
            try {
    			conn = getConnection();

                pstmt = conn.prepareStatement(
                	"select question_passwd from question where question_num = ?");//pwd가 맞다면
                pstmt.setInt(1, q_num);
                rs = pstmt.executeQuery();
                
    			if(rs.next()){
    				dbpasswd= rs.getString("question_passwd"); 
    				if(dbpasswd.equals(question_passwd)){
    					pstmt = conn.prepareStatement(
                	      "delete from question where question_num=?");//삭제해라
                        pstmt.setInt(1, q_num);
                        pstmt.executeUpdate();
    					x= 1; //글삭제 성공
    				}else
    					x= 0; //비밀번호 틀림
    			}
            } catch(Exception ex) {
                ex.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch(SQLException ex) {}
                if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
                if (conn != null) try { conn.close(); } catch(SQLException ex) {}
            }
    		return x;
        }
    
    
    public int checkArticle(int idx, String question_passwd)
            throws Exception {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs= null;
            String dbpasswd="";
            int x=-1;
            try {
    			conn = getConnection();

                pstmt = conn.prepareStatement(
                	"select question_passwd from question where question_num = ?");//pwd가 맞다면
                pstmt.setInt(1, idx);
                rs = pstmt.executeQuery();
                
    			if(rs.next()){
    				dbpasswd= rs.getString("question_passwd"); 
    				if(dbpasswd.equals(question_passwd)){
    					x= 1; //글삭제 성공
    				}else
    					x= 0; //비밀번호 틀림
    			}
            } catch(Exception ex) {
                ex.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch(SQLException ex) {}
                if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
                if (conn != null) try { conn.close(); } catch(SQLException ex) {}
            }
    		return x;
        }
   
}