package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.vo.EmailVO;

public class EmailDAO {

	
	
	public int selectNo() {
		int no = 0;
		String sql = "select seq_t_email_no.nextval from dual";
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
		){
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				no = rs.getInt(1);
			}
		} catch (Exception e) {
		}
		return no;
	}
	
	public void insertEmail(EmailVO email) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_email(no,sender,receiver,title,content) ");
		sql.append("values(t_email_seq.nextval,?,?,?,?)");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			int loc = 1;
			pstmt.setString(loc++,email.getSender());
			pstmt.setString(loc++, email.getReceiver());
			pstmt.setString(loc++, email.getTitle());
			pstmt.setString(loc++, email.getContent());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public EmailVO selectByNo(int EmailVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("select no, sender,receiver,title,content");
		sql.append("  ,to_char(reg_date, 'yyyy-mm-dd') reg_date");
		sql.append(" from t_email");
		sql.append(" where no =?");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			   PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
			     pstmt.setInt(1, EmailVO);
			     ResultSet rs = pstmt.executeQuery();
			     if(rs.next()) {
			    	 int no = rs.getInt("no");
			    	 String sender = rs.getString("sender");
			    	 String receiver = rs.getString("receiver");
			    	 String title = rs.getString("title");
			    	 String content = rs.getString("content");
			    	 String regDate = rs.getString("reg_date");
			    	 
			    	 EmailVO email = new EmailVO(no, sender, receiver,title,content,regDate);
			    	 return email;
			     }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
