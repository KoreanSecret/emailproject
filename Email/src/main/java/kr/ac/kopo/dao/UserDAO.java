package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.util.ConnectionFactory;
import kr.ac.kopo.vo.UserVO;

public class UserDAO {

	
	
	public UserVO login(UserVO loginVO) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select id,password,name,phone");
		sql.append(" from t_user");
		sql.append(" where id = ? and password = ? ");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				){
			pstmt.setString(1, loginVO.getId());
			pstmt.setString(2, loginVO.getPwd());

			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
			
				String id = rs.getString("id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String phone = rs.getString("phone");
				
				UserVO user = new UserVO();
				user.setId(id);
				user.setName(name);
				user.setPwd(password);
				user.setPhone(phone);
				
				return user;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 회원가입
	public void insertUser(UserVO user) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_user(id, name , password , phone)");
		sql.append("values(?, ?, ?,?)");
		
		try (
				Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				
				){
			
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getPwd());
			pstmt.setString(4, user.getPhone());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
}
