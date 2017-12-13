package ssb.makeview;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


class RealTimeGame{
	String htName;
	String atName;
	String htLogo;
	String atLogo;
	int htScore=0;
	int atScore=0;
	String leagueName;
	
	RealTimeGame(){};
}

public class RTGameBean {
	private RealTimeGame[] rtg;
	private int size=0;
	
	public static void main(String[] args) {
		RTGameBean a = new RTGameBean();
		a.setValue(1);
	}
	public String getatLogo(int num) {
		if(this.size ==0) {
			return "0";
		}
		else {
			return this.rtg[num].atLogo;
		}
		
	}
	public String gethtLogo(int num) {
		if(this.size ==0) {
			return "0";
		}
		else {
			return this.rtg[num].htLogo;
		}
	
	}
	public int getatScore(int num) {
		if(this.size ==0) {
			return 0;
		}
		else {
			return this.rtg[num].atScore;
		}
		
	}
	public int gethtScore(int num) {
		if(this.size ==0) {
			return 0;
		}
		else {
			return this.rtg[num].htScore;
		}
		
	}
	public String gethtName(int num) {
		if(this.size==0) {
			return "0";
		}
		else {
			return this.rtg[num].htName;
		}
		
	}
	public String getatName(int num) {
		if(this.size ==0) {
			return "0";
		}
		return this.rtg[num].atName;
	}
	public String getLeagueName(int num) {
		if(this.size ==0) {
			return "0";
		}
		else {
			return this.rtg[num].leagueName;
		}
	}
	public int getSize() {
		return this.size;
	}
	
	public void setValue(int sptnum) {
		Connection conn = null;
		PreparedStatement pstmt = null, ps = null, pps=null;	
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/ssbdb?useSSL=false";
		try {
			ResultSet rs, rss, rsss;
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "root", "111111");
			String sql, ssql;
			
			sql= "select leagueid from league where sportsid = "+sptnum+";";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				ssql = "select count(*) from game where gamestatus='진행' and leagueid="+rs.getInt(1)+";";
				pstmt = conn.prepareStatement(ssql);
				rss = pstmt.executeQuery();
				while(rss.next()) {
					this.size += rss.getInt(1);
				}
			}
			if(this.size !=0) {
				this.rtg= new RealTimeGame[this.size];
				for(int i=0; i<this.size; i++) {
					this.rtg[i] = new RealTimeGame();
				}
				sql= "select leagueid from league where sportsid = "+sptnum+";";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				int i=0;
				while(rs.next()) {
					ssql = "select p.hometeamid,p.awayteamid, g.gamestatusdetail from game as g join `participated team` as p on p.gameid=g.gameid where g.gamestatus = '진행' and g.leagueid="+rs.getInt(1)+";";
					pstmt = conn.prepareStatement(ssql);
					rss = pstmt.executeQuery();
					while(rss.next()) {
						String sssql = "select teamname, teamlogopath from team where teamid= "+ rss.getInt(1)+";";
						pps = conn.prepareStatement(sssql);
						rsss = pps.executeQuery();
						while(rsss.next()) {
							
							this.rtg[i].htName = rsss.getString(1);
							this.rtg[i].htLogo = rsss.getString(2);
						}
						
						sssql = "select leaguename from league where leagueid= "+ rs.getInt(1)+";";
						pps = conn.prepareStatement(sssql);
						rsss = pps.executeQuery();
						while(rsss.next()) {
							this.rtg[i].leagueName=rsss.getString(1);
						}

	                	String rsdata = rss.getString(3);
	                	String gamedata[];
	                	gamedata = rsdata.split("\"");
						this.rtg[i].htScore = Integer.parseInt(gamedata[3]);
						this.rtg[i].atScore = Integer.parseInt(gamedata[7]);
						sssql = "select teamname, teamlogopath from team where teamid= "+ rss.getInt(2)+";";
						pps = conn.prepareStatement(sssql);
						rsss = pps.executeQuery();
						while(rsss.next()) {
							this.rtg[i].atName = rsss.getString(1);
							this.rtg[i].atLogo = rsss.getString(2);
						}
						i++;
					}
				}
			}
			
		conn.close();		
		}catch(Exception e) {
				System.out.println("SigninBean : " + e);
		}
	 }
}
