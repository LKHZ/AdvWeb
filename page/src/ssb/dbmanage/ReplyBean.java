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

	private final String dbpasswd = "111111";


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
		
		// �뜲�씠�꽣踰좎씠�뒪 �뿰寃� 愿��젴 蹂��닔 �꽑�뼵
		Connection conn = null;
		PreparedStatement pstmt = null;

		// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곌��젴 �젙蹂대�� 臾몄옄�뿴濡� �꽑�뼵
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false&useUnicode=true&characterEncoding=UTF-8";

		// �쁽�옱 �떆媛� 諛쏆븘�삤湲�
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");

		try {
			// JDBC �뱶�씪�씠踰� 濡쒕뱶
			Class.forName(jdbc_driver);

			// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곗젙蹂대�� �씠�슜�빐 Connection �씤�뒪�꽩�뒪 �솗蹂�
			conn = DriverManager.getConnection(jdbc_url, "root", dbpasswd);

			// Connection �겢�옒�뒪�쓽 �씤�뒪�꽩�뒪濡쒕��꽣 SQL臾� �옉�꽦�쓣 �쐞�븳 Statement 以�鍮�

			String sql = "select c.commentcreatedate, c.commentcontent, m.membernickname,"
					+ " c.commentid from comment c, member m where c.commentvalid = 1"
					+ " and c.memberid = m.memberid and c.bulletinid = ? order by c.commentid desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bulletinNum);

			ResultSet rs = pstmt.executeQuery();
			

			while(rs.next()) {
				ReplyDTO reply = new ReplyDTO();
				reply.setDate(sdf.format(new Date(rs.getTimestamp(1).getTime())));
				reply.setContent(rs.getString(2));
				reply.setUserid(rs.getString(3));
				reply.setId(rs.getInt(4));
				
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
	
	public ReplyDTO mostReply(int bulletinNum) {
		ReplyDTO updateReply = new ReplyDTO();
		int create = 0;
		
		if(content == null) {
			create = -2;
			updateReply.setId(create);
		}
		else if(boardNum == 0) {
			create = -4;
			updateReply.setId(create);
		}
		else if(userSeq == 0) {
			create = -5;
			updateReply.setId(create);
		}
		else if(bulletinNum == 0) {
			create = -6;
			updateReply.setId(create);
		}
		else {
			// �뜲�씠�꽣踰좎씠�뒪 �뿰寃� 愿��젴 蹂��닔 �꽑�뼵
			Connection conn = null;
			PreparedStatement pstmt = null;

			// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곌��젴 �젙蹂대�� 臾몄옄�뿴濡� �꽑�뼵
			String jdbc_driver = "com.mysql.jdbc.Driver";
			String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false&useUnicode=true&characterEncoding=UTF-8";

			try {
				// JDBC �뱶�씪�씠踰� 濡쒕뱶
				Class.forName(jdbc_driver);

				// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곗젙蹂대�� �씠�슜�빐 Connection �씤�뒪�꽩�뒪 �솗蹂�
				conn = DriverManager.getConnection(jdbc_url, "root", dbpasswd);

				
				String sql2 = "select commentid, bulletinid from comment where bulletinid = ?"
						+ " order by commentid desc limit 1";
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, bulletinNum);

				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					updateReply.setId(rs.getInt(1));
					updateReply.setBulletinNum(rs.getInt(2));
					break;
				}

				rs.close();
				pstmt.close();
				conn.close();

			} catch (Exception e) {
				System.out.println("ReplyBean : " + e);
				updateReply.setId(create);
			}

		}
		
		return updateReply;
	}
	
	public ReplyDTO replyCreate() {
		ReplyDTO updateReply = new ReplyDTO();
		int create = 0;
		
		if(content == null) {
			create = -2;
			updateReply.setId(create);
		}
		else if(boardNum == 0) {
			create = -4;
			updateReply.setId(create);
		}
		else if(userSeq == 0) {
			create = -5;
			updateReply.setId(create);
		}
		else if(bulletinNum == 0) {
			create = -6;
			updateReply.setId(create);
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
				System.out.println("ReplyBean : " + e1);
			}
			if (date == null) {
				System.out.println("ReplyBean : date == null");
				updateReply.setId(create);
				return updateReply;
			}
			Timestamp timestamp = new Timestamp(date.getTime());

			try {
				// JDBC �뱶�씪�씠踰� 濡쒕뱶
				Class.forName(jdbc_driver);

				// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곗젙蹂대�� �씠�슜�빐 Connection �씤�뒪�꽩�뒪 �솗蹂�
				conn = DriverManager.getConnection(jdbc_url, "root", dbpasswd);

				// Connection �겢�옒�뒪�쓽 �씤�뒪�꽩�뒪濡쒕��꽣 SQL臾� �옉�꽦�쓣 �쐞�븳 Statement 以�鍮�
				
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

				
				String sql2 = "select commentid, bulletinid from comment where bulletinid = ?"
						+ " order by commentid desc limit 1";
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, bulletinNum);

				ResultSet rs = pstmt.executeQuery();
				

				while(rs.next()) {
					updateReply.setId(rs.getInt(1));
					updateReply.setBulletinNum(rs.getInt(2));
					break;
				}

				rs.close();
				pstmt.close();
				conn.close();

			} catch (Exception e) {
				System.out.println("ReplyBean : " + e);
				updateReply.setId(create);
			}

		}
		
		return updateReply;
	}

}
