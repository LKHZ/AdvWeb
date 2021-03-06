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

import ssb.content.BulletinDTO;

public class BoardBean {
	private String title;
	private String content;
	private int userSeq = 0;
	private int boardNum = 0;

	private final String dbpasswd = "111111";
	
	
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
	
	public ArrayList<BulletinDTO> bulletinList(int boardNum) {
		ArrayList<BulletinDTO> bulletins = new ArrayList<BulletinDTO>();
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

			String sql = "select b.bulletinid, b.bulletincreatedate, b.bulletintitle"
					+ ", b.bulletincontent, m.memberident from bulletin b, member m"
					+ " where b.bulletinvalid = 1 and m.memberid = b.memberid and b.boardid = ? order by b.bulletinid desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);

			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				BulletinDTO bulletin = new BulletinDTO();
				bulletin.setId(rs.getInt(1));
				bulletin.setDate(sdf.format(new Date(rs.getTimestamp(2).getTime())));
				bulletin.setTitle(rs.getString(3));
				bulletin.setContent(rs.getString(4));
				bulletin.setUserid(rs.getString(5));
				
				bulletins.add(bulletin);
			}

			rs.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("BoardBean : " + e);
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
			// �뜲�씠�꽣踰좎씠�뒪 �뿰寃� 愿��젴 蹂��닔 �꽑�뼵
			Connection conn = null;
			PreparedStatement pstmt = null;

			// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곌��젴 �젙蹂대�� 臾몄옄�뿴濡� �꽑�뼵
			String jdbc_driver = "com.mysql.jdbc.Driver";
			String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false&useUnicode=true&characterEncoding=UTF-8";

			// �쁽�옱 �떆媛� 諛쏆븘�삤湲�
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			Calendar cal = Calendar.getInstance();
			String time = sdf.format(cal.getTime());
			Date date = null;
			try {
				date = sdf.parse(time);
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				System.out.println("BoardBean : " + e1);
			}
			if (date == null) {
				System.out.println("BoardBean : date == null");
				return create;
			}
			Timestamp timestamp = new Timestamp(date.getTime());
			
			String replacedTitle = title.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
					.replaceAll(">", "&gt;").replaceAll("\n", "<br>");
			String replacedContent = content.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
					.replaceAll(">", "&gt;").replaceAll("\n", "<br>");

			try {
				// JDBC �뱶�씪�씠踰� 濡쒕뱶
				Class.forName(jdbc_driver);

				// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곗젙蹂대�� �씠�슜�빐 Connection �씤�뒪�꽩�뒪 �솗蹂�
				conn = DriverManager.getConnection(jdbc_url, "root", "111111");

				// Connection �겢�옒�뒪�쓽 �씤�뒪�꽩�뒪濡쒕��꽣 SQL臾� �옉�꽦�쓣 �쐞�븳 Statement 以�鍮�
				
				String sql = "insert into bulletin(bulletintitle, bulletincontent, bulletinvalid"
						+ ", bulletincreatedate, memberid, boardid)"
						 + "values(?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, replacedTitle);
				pstmt.setString(2, replacedContent);
				pstmt.setInt(3, 1);
				pstmt.setTimestamp(4, timestamp);
				pstmt.setInt(5, userSeq);
				pstmt.setInt(6, boardNum);

				pstmt.executeUpdate();

				create = 1;

				pstmt.close();
				conn.close();

			} catch (Exception e) {
				System.out.println("BoardBean : " + e);
			}

		}
		
		return create;
	}
	
	
	public int bulletinDrop(int bulletinNum) {
		int create = 0;
	
	
		// 데이터베이스 연결 관련 변수 선언
		Connection conn = null;
		PreparedStatement pstmt = null;

		// 데이터베이스 연결관련 정보를 문자열로 선언
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false&useUnicode=true&characterEncoding=UTF-8";

		
		try {
			// JDBC 드라이버 로드
			Class.forName(jdbc_driver);

			// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
			conn = DriverManager.getConnection(jdbc_url, "root", dbpasswd);

			// Connection 클래스의 인스턴스로부터 SQL문 작성을 위한 Statement 준비
			
			String sql = "delete from bulletin where bulletinid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bulletinNum);

			pstmt.executeUpdate();

			create = 1;

			pstmt.close();
			conn.close();

		} catch (Exception e) {
			System.out.println("BoardBean : " + e);
		}

	
		
		return create;
	}
}
