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
	
	private final String dbpasswd = "1313";
	

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
			conn = DriverManager.getConnection(jdbc_url, "root", dbpasswd);

			// Connection 클래스의 인스턴스로부터 SQL문 작성을 위한 Statement 준비
			String sql = "select memberident from member";
			pstmt = conn.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			// // userid가 있는경우 값을 입력한 경우 SQL문을 수행
			// if(userid != null) {
			// pstmt.executeQuery();
			// }

			// 매 row를 불러옴
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
			conn = DriverManager.getConnection(jdbc_url, "root", dbpasswd);

			// Connection 클래스의 인스턴스로부터 SQL문 작성을 위한 Statement 준비
			String sql = "select membernickname from member";
			pstmt = conn.prepareStatement(sql);


			ResultSet rs = pstmt.executeQuery();

			// // userid가 있는경우 값을 입력한 경우 SQL문을 수행
			// if(userid != null) {
			// pstmt.executeQuery();
			// }

			// 매 row를 불러옴
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
		// 회원가입 성공 여부
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

			// 데이터베이스 연결 관련 변수 선언
			Connection conn = null;
			PreparedStatement pstmt = null;

			// 데이터베이스 연결관련 정보를 문자열로 선언
			String jdbc_driver = "com.mysql.jdbc.Driver";
			String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false&useUnicode=true&characterEncoding=ISO-8859-1";
			
			// 현재 시간 받아오기
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
				// JDBC 드라이버 로드
				Class.forName(jdbc_driver);

				// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
				conn = DriverManager.getConnection(jdbc_url, "root", dbpasswd);

				// Connection 클래스의 인스턴스로부터 SQL문 작성을 위한 Statement 준비
				
				
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