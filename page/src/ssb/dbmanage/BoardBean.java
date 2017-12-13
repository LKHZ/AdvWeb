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

public class BoardBean {
	private String title;
	private String content;
	private String category;
	private int userSeq;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public int bulletinCreate() {
		int create = 0;
		
		if(title == null) {
			create = -1;
		}
		else if(content == null) {
			create = -2;
		}
		else if(category == null) {
			create = -3;
		}
		else if(boardNum == 0) {
			create = -4;
		}
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
				// JDBC �뱶�씪�씠踰� 濡쒕뱶
				Class.forName(jdbc_driver);

				// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곗젙蹂대�� �씠�슜�빐 Connection �씤�뒪�꽩�뒪 �솗蹂�
				conn = DriverManager.getConnection(jdbc_url, "root", "111111");

				// Connection �겢�옒�뒪�쓽 �씤�뒪�꽩�뒪濡쒕��꽣 SQL臾� �옉�꽦�쓣 �쐞�븳 Statement 以�鍮�
				
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
