package ssb.dbmanage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import ssb.content.*;

public class BoardBean {
	private String title;
	private String content;
	private int userSeq = 0;
	private int boardNum = 0;
	
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public ArrayList<BulletinDTO> bulletinList() {
		ArrayList<BulletinDTO> bulletins = new ArrayList<BulletinDTO>();
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
		Date date = null;
		try {
			date = sdf.parse(time);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("JoinBean : " + e1);
		}
		if (date == null) {
			System.out.println("JoinBean : date == null");
		}
		Timestamp timestamp = new Timestamp(date.getTime());

		try {
			// JDBC 드라이버 로드
			Class.forName(jdbc_driver);

			// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
			conn = DriverManager.getConnection(jdbc_url, "root", "1313");

			// Connection 클래스의 인스턴스로부터 SQL문 작성을 위한 Statement 준비

			String sql = "insert into bulletin(bulletintitle, bulletincontent, bulletinvalid"
					+ ", bulletincreatedate, memberid, boardid)" + "values(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, 1);
			pstmt.setTimestamp(4, timestamp);
			pstmt.setInt(5, userSeq);
			pstmt.setInt(6, boardNum);

			pstmt.executeUpdate();


			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("JoinBean : " + e);
		}
		return bulletins;
	}
	
	public int bulletinCreate() {
		int create = 0;
		
		if(title == null) {
			create = -1;
		}
		else if(content == null) {
			create = -2;
		}
		else if(boardNum == 0) {
			create = -4;
		}
		else if(userSeq == 0) {
			create = -5;
		}
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
			Date date = null;
			try {
				date = sdf.parse(time);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				System.out.println("JoinBean : " + e1);
			}
			if (date == null) {
				System.out.println("JoinBean : date == null");
				return create;
			}
			Timestamp timestamp = new Timestamp(date.getTime());

			try {
				// JDBC 드라이버 로드
				Class.forName(jdbc_driver);

				// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
				conn = DriverManager.getConnection(jdbc_url, "root", "1313");

				// Connection 클래스의 인스턴스로부터 SQL문 작성을 위한 Statement 준비
				
				String sql = "insert into bulletin(bulletintitle, bulletincontent, bulletinvalid"
						+ ", bulletincreatedate, memberid, boardid)"
						 + "values(?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, title);
				pstmt.setString(2, content);
				pstmt.setInt(3, 1);
				pstmt.setTimestamp(4, timestamp);
				pstmt.setInt(5, userSeq);
				pstmt.setInt(6, boardNum);

				pstmt.executeUpdate();

				create = 1;

				pstmt.close();
				conn.close();

			} catch (Exception e) {
				System.out.println("JoinBean : " + e);
			}

		}
		
		return create;
	}
}
