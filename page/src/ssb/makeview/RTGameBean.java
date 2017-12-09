package ssb.makeview;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class RTGameBean {
	private String userid;
	private String passwd;
	private int SoccerNum=0;
	private int BaseballNum=0;
	private int BasketballNum=0;
	private String htName = null;
	private String atName = null;
	private String htLogo = null;
	private String atLogo = null;
	private int htScore =0;
	private int atScore =0;
	private String leagueName=null;
	
	public void getCount() {
		 try{
			 Connection conn = null;
			 PreparedStatement pstmt = null, ps = null;
			
			// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곌��젴 �젙蹂대�� 臾몄옄�뿴濡� �꽑�뼵
			 String jdbc_driver = "com.mysql.jdbc.Driver";
			 String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false";
			 Class.forName(jdbc_driver);
			 conn = DriverManager.getConnection(jdbc_url, "root", "111111");
		
			 String sql = "select gameid from game where gamestatus='진행';";
			 pstmt = conn.prepareStatement(sql);
			 ResultSet rs = pstmt.executeQuery();
			 while(rs.next()) {
				 String ssql = "select sportsid from team where teamid = any(select hometeamid from `participated team` where gameid = "+ rs.getInt(1)+");";
				 ps = conn.prepareStatement(ssql);
				 ResultSet rss = ps.executeQuery();
				 while(rss.next()) {	
					 if(rss.getInt(1) == 1) {
						 this.SoccerNum +=1;
					 }
					 else if(rss.getInt(1) == 2) {
						 this.BaseballNum+=1;
					 }
					 else {
						 this.BasketballNum+=1;
					 }
				 }
			 }
		 }
		catch(Exception e) {
			System.out.println("SigninBean : " + e);
		}
	}
	
	public void getValue() {
		 
		 Connection conn = null;
		 PreparedStatement pstmt = null, ps = null;
			
		// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곌��젴 �젙蹂대�� 臾몄옄�뿴濡� �꽑�뼵
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false";
			
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "111111");
			
			String sql;		
			sql = "select p.hometeamid,p.awayteamid, g.leagueid, g.gamestatusdetail from game as g join `participated team` as p on p.gameid=g.gameid where g.gamestatus = '진행'";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String ssql = "select teamname, teamlogopath from team where teamid= "+ rs.getInt(1)+";";
				ps = conn.prepareStatement(ssql);
				ResultSet rss = ps.executeQuery();
				while(rss.next()) {
					this.htName = rss.getString(1);
					this.htLogo = rss.getString(2);
				}
				
				ssql = "select teamname, teamlogopath from team where teamid= "+ rs.getInt(2)+";";
				ps = conn.prepareStatement(ssql);
				rss = ps.executeQuery();
				while(rss.next()) {
					this.atName = rss.getString(1);
					this.atLogo = rss.getString(2);	
				}
				ssql = "select leaguename from league where leagueid= "+ rs.getInt(3)+";";
				ps = conn.prepareStatement(ssql);
				rss = ps.executeQuery();
				while(rss.next()) {
					this.leagueName = rss.getString(1);
				}
				String rtdata = rs.getString(4);
               	String rtgamedata[];
               	rtgamedata = rtdata.split(",|:");
               	this.htScore = Character.getNumericValue(rtgamedata[1].charAt(2));
               	this.atScore = Character.getNumericValue(rtgamedata[3].charAt(2));
				//System.out.println(rs.getInt(1) + " " + rs.getInt(2) + " " + rs.getInt(3) + " " + rs.getString(4));
			}
			rs.close();
			pstmt.close();
			conn.close();		
		}catch(Exception e) {
				System.out.println("SigninBean : " + e);
		}
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
	
	public boolean checkUser() {
		// 濡쒓렇�씤 �꽦怨� �뿬遺�
		boolean success = false;
		
		// �뜲�씠�꽣踰좎씠�뒪 �뿰寃� 愿��젴 蹂��닔 �꽑�뼵
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		// �뜲�씠�꽣踰좎씠�뒪 �뿰寃곌��젴 �젙蹂대�� 臾몄옄�뿴濡� �꽑�뼵
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false";
		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "");
			String sql = "select p.hometeamid,p.awayteamid, g.leagueid, g.gamestatusdetail from game as g join `participated team` as p on p.gameid=g.gameid where g.gamestatus = '종료'";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
		
			while(rs.next()) {
				System.out.println(rs.getInt(1) + " " + rs.getInt(2) + " " + rs.getInt(3) + " " + rs.getInt(4));
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
