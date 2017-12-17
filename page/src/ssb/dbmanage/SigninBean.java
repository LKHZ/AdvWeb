package ssb.dbmanage;
import java.sql.*;

public class SigninBean {

	private String userid;
	private String passwd;

	private final String dbpasswd = "111111";
	
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
	
	public int checkUser() {
		// 濡쒓렇�씤 �꽦怨� �뿬遺�
		int id = 0;
		
		// �뜲�씠�꽣踰좎씠�뒪 �뿰寃� 愿��젴 蹂��닔 �꽑�뼵
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곌��젴 �젙蹂대�� 臾몄옄�뿴濡� �꽑�뼵
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false";
		
		try {
			// JDBC �뱶�씪�씠踰� 濡쒕뱶
			Class.forName(jdbc_driver);
			

			// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곗젙蹂대�� �씠�슜�빐 Connection �씤�뒪�꽩�뒪 �솗蹂�
			conn = DriverManager.getConnection(jdbc_url, "root", "111111");

			// Connection �겢�옒�뒪�쓽 �씤�뒪�꽩�뒪濡쒕��꽣 SQL臾� �옉�꽦�쓣 �쐞�븳 Statement 以�鍮�
			String sql = "select memberpasswd, memberid from member where memberident = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			
			ResultSet rs = pstmt.executeQuery();
			
//			// userid媛� �엳�뒗寃쎌슦  媛믪쓣 �엯�젰�븳 寃쎌슦 SQL臾몄쓣 �닔�뻾
//			if(userid != null) {
//				pstmt.executeQuery();
//			}
			
			
			// 留� row瑜� 遺덈윭�샂
			while(rs.next()) {
				if(passwd.equals(rs.getString(1))) {
					id = rs.getInt(2);
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

		return id;
		
	}
  
}
