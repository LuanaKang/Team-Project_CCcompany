package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public userDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "su", "0000");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String id, String password) {
		String sql = "select password from member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("password").equals(password)) {
					System.out.println("로그인 성공입니다");
					return 1;	// 로그인 성공
				}else {
					return 0;	// 비밀번호 불일치
				}
			}else {
				return -1;	//아이디가 없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;		// 데이터 베이스 오류
	}
	
	public int join(userVO user) {
		String sql = "insert into member values(?, ?, ?, ?, ?)";
//		id마다 시퀀스 자동 부여
		String ssql = "CREATE SEQUENCE qanda_" + user.getId() + "_seq";
		try {
//			id마다 시퀀스 자동 부여
			pstmt = conn.prepareStatement(ssql);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getId());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getAddress());
			System.out.println(user.getName());
			System.out.println(user.getId());
			System.out.println(user.getPassword());
			System.out.println(user.getEmail());
			System.out.println(user.getAddress());
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn != null) {conn.close();}} catch (Exception ex) {ex.printStackTrace();}
			try {if(rs != null)   {rs.close();}}   catch (Exception ex) {ex.printStackTrace();}
			try {if(pstmt != null){pstmt.close();}}catch (Exception ex) {ex.printStackTrace();}
		}
		return -1;
	}
	

	
	
}