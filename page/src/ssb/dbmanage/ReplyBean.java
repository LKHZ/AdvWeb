package ssb.dbmanage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import ssb.content.ReplyDTO;

public class ReplyBean {
	private String content;
	private int userSeq = 0;
	private int boardNum = 0;
	private int bulletinNum = 0;

	private final String dbpasswd = "1313";


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

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

	public int getBulletinNum() {
		return bulletinNum;
	}

	public void setBulletinNum(int bulletinNum) {
		this.bulletinNum = bulletinNum;
	}
	
	public ArrayList<ReplyDTO> replyList(int bulletinNum) {
		ArrayList<ReplyDTO> replys = new ArrayList<ReplyDTO>();
		
		// 데이터베이스 연결 관련 변수 선언
		Connection conn = null;
		PreparedStatement pstmt = null;

		// 데이터베이스 연결관련 정보를 문자열로 선언
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false&useUnicode=true&characterEncoding=UTF-8";

		// 현재 시간 받아오기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");

		try {
			// JDBC 드라이버 로드
			Class.forName(jdbc_driver);

			// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
			conn = DriverManager.getConnection(jdbc_url, "root", dbpasswd);

			// Connection 클래스의 인스턴스로부터 SQL문 작성을 위한 Statement 준비

			String sql = "select c.commentcreatedate, c.commentcontent, m.memberident"
					+ " from comment c, member m where c.commentvalid = 1"
					+ " and c.memberid = m.memberid and c.bulletinid = ? order by c.commentid desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bulletinNum);

			ResultSet rs = pstmt.executeQuery();
			

			while(rs.next()) {
				ReplyDTO reply = new ReplyDTO();
				reply.setDate(sdf.format(new Date(rs.getTimestamp(1).getTime())));
				reply.setContent(rs.getString(2));
				reply.setUserid(rs.getString(3));
				
				replys.add(reply);
			}

			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("BoardBean : " + e);
		}
		return replys;
	}
	
	public int replyCreate() {
		int create = 0;
		
		if(content == null) {
			create = -2;
		}
		else if(boardNum == 0) {
			create = -4;
		}
		else if(userSeq == 0) {
			create = -5;
		}
		else if(bulletinNum == 0) {
			create = -6;
		}
		else {
			// 데이터베이스 연결 관련 변수 선언
			Connection conn = null;
			PreparedStatement pstmt = null;

			// 데이터베이스 연결관련 정보를 문자열로 선언
			String jdbc_driver = "com.mysql.jdbc.Driver";
			String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false&useUnicode=true&characterEncoding=UTF-8";

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
				System.out.println("ReplyBean : " + e1);
			}
			if (date == null) {
				System.out.println("ReplyBean : date == null");
				return create;
			}
			Timestamp timestamp = new Timestamp(date.getTime());

			try {
				// JDBC 드라이버 로드
				Class.forName(jdbc_driver);

				// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
				conn = DriverManager.getConnection(jdbc_url, "root", dbpasswd);

				// Connection 클래스의 인스턴스로부터 SQL문 작성을 위한 Statement 준비
				
				String sql = "insert into comment(commentcontent, commentvalid"
						+ ", commentcreatedate, memberid, boardid, bulletinid)"
						 + "values(?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, content);
				pstmt.setInt(2, 1);
				pstmt.setTimestamp(3, timestamp);
				pstmt.setInt(4, userSeq);
				pstmt.setInt(5, boardNum);
				pstmt.setInt(6, bulletinNum);

				pstmt.executeUpdate();

				create = 1;

				pstmt.close();
				conn.close();

			} catch (Exception e) {
				System.out.println("ReplyBean : " + e);
			}

		}
		
		return create;
	}

}
