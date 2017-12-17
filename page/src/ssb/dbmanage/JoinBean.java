package ssb.dbmanage;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class JoinBean {

	private String userid;
	private String passwd;
	private String passwdagain;
	private String nickname;
	private boolean checkedUserid;
	private boolean checkedNick;
	
	private final String dbpasswd = "111111";
	

	public String getPasswdagain() {
		return passwdagain;
	}


	public void setPasswdagain(String passwdagain) {
		this.passwdagain = passwdagain;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


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
	
	
	public boolean duplicationCheckIdent(String ident) {
		this.checkedUserid = false;
		
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
			String sql = "select memberident from member";
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			// // userid媛� �엳�뒗寃쎌슦 媛믪쓣 �엯�젰�븳 寃쎌슦 SQL臾몄쓣 �닔�뻾
			// if(userid != null) {
			// pstmt.executeQuery();
			// }

			// 留� row瑜� 遺덈윭�샂
			while (rs.next()) {
				if (ident.equals(rs.getString(1))) {
					this.checkedUserid = true;
					break;
				}
			}

			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("JoinBean : dup check ident : " + e);
		}

		return this.checkedUserid;
	}
	
	public boolean duplicationCheckNick(String nick) {
		this.checkedNick = false;
		
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
			String sql = "select membernickname from member";
			pstmt = conn.prepareStatement(sql);


			ResultSet rs = pstmt.executeQuery();

			// // userid媛� �엳�뒗寃쎌슦 媛믪쓣 �엯�젰�븳 寃쎌슦 SQL臾몄쓣 �닔�뻾
			// if(userid != null) {
			// pstmt.executeQuery();
			// }

			// 留� row瑜� 遺덈윭�샂
			while (rs.next()) {
				if (nick.equals(rs.getString(1))) {
					this.checkedNick = true;
					break;
				}
			}

			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("JoinBean : dup check ident : " + e);
		}

		return this.checkedNick;
	}
	
	public int joinUser() {
		// �쉶�썝媛��엯 �꽦怨� �뿬遺�
		int join = 0;
		
		if(userid == null) {
			join = -1;
		}
		else if(passwd == null) {
			join = -2;
		}
		else if(passwdagain == null) {
			join = -3;
		}
		else if(nickname == null) {
			join = -4;
		}
		//else if(checkedUserid == false) {
		//	join = -5;
		//}
		//else if(checkedNick == false) {
		//	join = -6;
		//}
		else {

			// �뜲�씠�꽣踰좎씠�뒪 �뿰寃� 愿��젴 蹂��닔 �꽑�뼵
			Connection conn = null;
			PreparedStatement pstmt = null;

			// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곌��젴 �젙蹂대�� 臾몄옄�뿴濡� �꽑�뼵
			String jdbc_driver = "com.mysql.jdbc.Driver";
			String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false&useUnicode=true&characterEncoding=ISO-8859-1";
			
			// �쁽�옱 �떆媛� 諛쏆븘�삤湲�
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Calendar cal = Calendar.getInstance();
			String time = sdf.format(cal.getTime());
			Date date= null;
			try {
				date = sdf.parse(time);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				System.out.println("JoinBean : " + e1);
			}
			if(date == null) {
				System.out.println("JoinBean : date == null");
				return join;
			}
			Timestamp timestamp = new Timestamp(date.getTime());

			try {
				// JDBC �뱶�씪�씠踰� 濡쒕뱶
				Class.forName(jdbc_driver);

				// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곗젙蹂대�� �씠�슜�빐 Connection �씤�뒪�꽩�뒪 �솗蹂�
				conn = DriverManager.getConnection(jdbc_url, "root", "111111");

				// Connection �겢�옒�뒪�쓽 �씤�뒪�꽩�뒪濡쒕��꽣 SQL臾� �옉�꽦�쓣 �쐞�븳 Statement 以�鍮�
				
				
				String sql = "insert into member(memberident, memberpasswd, membernickname, memberjoindate)"
						+ "values(?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				pstmt.setString(2, passwd);
				pstmt.setString(3, nickname);
				pstmt.setTimestamp(4, timestamp);

				pstmt.executeUpdate();
				
				join = 1;

				pstmt.close();
				conn.close();

			} catch (Exception e) {
				System.out.println("JoinBean : " + e);
			}
		}

		return join;
		
	}
  
}