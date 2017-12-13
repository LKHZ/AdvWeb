package ssb.dbmanage;
import java.sql.*;

public class SigninBean {

	private String userid;
	private String passwd;
			
//	final String _userid = "root";
//	final String _passwd = "1234";


//	public boolean checkUser() {
//		if(userid.equals(_userid) && passwd.equals(_passwd)) {
//			return true;
//		}
//		else {
//			return false;
//		}
//	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public boolean checkUser() {
		// 로그인 성공 여부
		boolean success = false;
		
		// 데이터베이스 연결 관련 변수 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		// 데이터베이스 연결관련 정보를 문자열로 선언
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false";
		
		try {
			// JDBC 드라이버 로드
			Class.forName(jdbc_driver);
			
			// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
			conn = DriverManager.getConnection(jdbc_url, "root", "1313");
			
			// Connection 클래스의 인스턴스로부터 SQL문 작성을 위한 Statement 준비
			String sql = "select memberpasswd from member where memberident = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			
			ResultSet rs = pstmt.executeQuery();
			
//			// userid가 있는경우  값을 입력한 경우 SQL문을 수행
//			if(userid != null) {
//				pstmt.executeQuery();
//			}
			
			
			// 매 row를 불러옴
			while(rs.next()) {
				if(passwd.equals(rs.getString(1))) {
					success = true;
					break;
				}
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
		}
		catch(Exception e) {
			System.out.println("SigninBean : " + e);
		}

		return success;
		
	}
  
}
