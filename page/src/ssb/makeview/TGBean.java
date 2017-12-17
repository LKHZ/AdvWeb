package ssb.makeview;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

class Match{
	int homescore;
	int awayscore;
	Match() {};
}

class TeamGame{
	String awayTeamName;
	int awayTeamScore;
	Match[] match;
	int matchSize;
	TeamGame() {};
}

public class TGBean {
	
	public static void main(String[] args) {
		//SqlChk connection = new SqlChk();
		//System.out.println("관리자 여부 : " + connection.isAdmin("admin", "admin"));
		TGBean a = new TGBean();
		a.TeamGame(5416, "2017-01-01", "2017-12-03");
		System.out.println(a.getMatchaScore());
	}
	
	private int teamnum;
	private int matchnum;
	private TeamGame[] tg;
	private String teamName;
	private int gamecount;
	
	public void setTeamNum(int a) {
		this.teamnum = a;
	}
	public void setMatchNum(int a) {
		this.matchnum = a;
	}
	
	public int getMatchhScore() {
		return this.tg[this.teamnum].match[this.matchnum].homescore;
	}
	public int getMatchaScore() {
		return this.tg[this.teamnum].match[this.matchnum].homescore;
	}
	
	public int getAwayTeamScore() {
		return this.tg[this.teamnum].awayTeamScore;
	}
	public String getAwayTeamName() {
		return this.tg[this.teamnum].awayTeamName;
	}
	
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getTeamName() {
		return this.teamName;
	}
	
	public int getTeamCount() {
		return this.gamecount;
	}
	
	public int getMatchCount() {
		return this.tg[this.teamnum].matchSize;
	}
	
    public void TeamGame(int a, String at, String to) {
    	PreparedStatement pss = null, ps = null;
    	ResultSet rs = null, rss =null;
    	Connection con;
    	String sql = "select * from team where teamid = "+ a+";";
    	
        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ssbdb?useSSL=false", "root", "111111");
        	ps = con.prepareStatement(sql);
        	rs = ps.executeQuery();
        	
        	while(rs.next()) {
        		setTeamName(rs.getString(2));
        	}		
    		
    		sql = "select count(*) from "+a+this.teamName+" where gamedate between '"+at+"' and '"+to+"' order by gamedate asc;";
        	ps = con.prepareStatement(sql);
        	rs = ps.executeQuery();
        	
    		while(rs.next()) {
    			this.gamecount = rs.getInt(1);
    		}
			
    		this.tg = new TeamGame[this.gamecount];
    		sql = "select * from "+a+this.teamName+" where gamedate between '"+at+"' and '"+to+"' order by gamedate asc;";
        	ps = con.prepareStatement(sql);
        	rs = ps.executeQuery();
    		int i=0;
    		while(rs.next()) {
    			this.tg[i] = new TeamGame();
    			String rsdata = rs.getString(3);
            	String gamedata[]= null;
            	String gamenumdata[] = null;
            	if(!rsdata.equals("[]")) {
            		gamenumdata = rsdata.split("}");
            		gamedata = rsdata.split(",|:|\"");
            	}
            	this.tg[i].matchSize = gamenumdata.length -1;
            	this.tg[i].match = new Match[this.tg[i].matchSize]; 	
            	
    			if(rs.getInt(4) == a) {
    				
    				String ssql = "select * from team where teamid = "+ rs.getInt(5)+";";
    				pss = con.prepareStatement(ssql);
    				rss = pss.executeQuery();
    				while(rss.next()) {
    					this.tg[i].awayTeamName=rss.getString(2);
    				}
    				
    				for(int j=0; j<gamenumdata.length-2; j++) {
    					this.tg[i].match[j] = new Match();
    					this.tg[i].awayTeamScore = Integer.parseInt(gamedata[4]);
    					this.tg[i].match[j].homescore = Integer.parseInt(gamedata[18*(j+1)+4]);
    					this.tg[i].match[j].awayscore = Integer.parseInt(gamedata[18*(j+1)+10]);
    				}	
    			}
    			else {
    				String ssql = "select * from team where teamid = "+ rs.getInt(4)+";";
    				pss = con.prepareStatement(ssql);
    				rss = pss.executeQuery();
    				while(rss.next()) {
    					this.tg[i].awayTeamName=rss.getString(2);
    				}
    				for(int j=0; j<gamenumdata.length-2; j++) {
    					this.tg[i].match[j] = new Match();
    					this.tg[i].awayTeamScore = Integer.parseInt(gamedata[10]);
    					this.tg[i].match[j].homescore = Integer.parseInt(gamedata[18*(j+1)+10]);
    					this.tg[i].match[j].awayscore = Integer.parseInt(gamedata[18*(j+1)+4]);
    				}
    			}
    			i++;
    		}    		
        con.close();
        }catch (SQLException s) {
            System.out.println("Table already exists!");
        }catch(ClassNotFoundException e) {
        	e.printStackTrace();
        	System.out.println("DB Driver Error!");
        }catch(Exception e)
        {
        	System.out.println(e);
        }
    }

}
