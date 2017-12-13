package ssb.makeview;

import java.sql.Connection;
import java.lang.Double;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;


class scoreg{
	int win;
	int lose;
	int same;
	scoreg(){};
}

/*
class teamdata{
	int teamnum;
	String teamname;
	double rank;
	
}
*/

class League {
	int leagueid;
	String leaguename;
	int sportsnum;
	scoreg[][] score=null;
	teamdata[] teamda=null; 
	int size;
	
	League(){};
}

class teamdata implements Comparable<teamdata>{
	int teamnum;
	String teamname;
	double rank;
	int win=0;
	int lose=0;
	int same=0;
	teamdata(){};
	
	@Override
	public int compareTo(teamdata a) {
		return new Double(a.rank).compareTo(new Double(this.rank));
	}
}

public class TSVBean {
	private League[] league;
	private int leaguenum =0;
	private int leaguecount = 0;
	
	public static void main(String[] args) {
		TSVBean a = new TSVBean();
		a.AllScore(3);
	}
	
	public void setSportsnum(int a) {
		PreparedStatement ps = null;
    	ResultSet rs = null;
    	Connection con;
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		String sql = "select count(*) from league where sportsid = "+a+";";
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ssbdb?useSSL=false", "root", "111111");
    		
        	ps = con.prepareStatement(sql);
        	rs = ps.executeQuery();
        	while(rs.next()) {
        		this.leaguecount = rs.getInt(1);
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
	public int getSportsnum() {
		return this.leaguecount;
	}
	
	
	public String getLeagueName() {
		return this.league[this.leaguenum].leaguename;
	}
	
	public void setRank() {
		Arrays.sort(this.league[this.leaguenum].teamda);
	}
	
	public double getRank(int a) {
		return this.league[this.leaguenum].teamda[a].rank;
	}
	
	public double getRate(int a) {
		if(this.league[this.leaguenum].teamda[a].win+this.league[this.leaguenum].teamda[a].lose ==0) {
			return 0;
		}
		else {
			return Math.round(((double)this.league[this.leaguenum].teamda[a].win/((double)this.league[this.leaguenum].teamda[a].win+(double)this.league[this.leaguenum].teamda[a].lose)*100)*10d)/10d;
		}
		
	}
	public int getSize() {
		return this.league[this.leaguenum].size;
	}
	
	public void setleagueNum(int a) {
		this.leaguenum = a;
	}
	
	public int getTeamNum(int a) {
		return this.league[this.leaguenum].teamda[a].teamnum;
	}
	
	public String getTeamName(int a) {
		return this.league[this.leaguenum].teamda[a].teamname;
	}
	/*
	public void setTeamWin(int b){
		
	}
	*/
	public int getTeamWin(int a) {
		return this.league[this.leaguenum].teamda[a].win;
	}
	/*
	public void setTeamLose(int b) {
		for(int i=0; i<this.league[this.leaguenum].size; i++) {
			this.league[this.leaguenum].teamda[b].lose += this.league[this.leaguenum].score[b][i].lose;
		}
	}
	*/
	
	public int getTeamLose(int a) {
		return this.league[this.leaguenum].teamda[a].lose;
	}
	public int getTeamSame(int a) {
		return this.league[this.leaguenum].teamda[a].same;
	}
	/*
	public void setTeamSame(int b) {
		for(int i=0; i<this.league[this.leaguenum].size; i++) {
			this.league[this.leaguenum].teamda[b].same += this.league[this.leaguenum].score[b][i].same;
		}
	}
	*/
    public void AllScore(int a) {
    	PreparedStatement pss = null, ps = null;
    	ResultSet rs = null, rss =null;
    	Connection con;
    	String sql = "select count(*) from league where sportsid = "+a+";";
        try {
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ssbdb?useSSL=false", "root", "111111");
        	ps = con.prepareStatement(sql);
        	rs = ps.executeQuery();
    		int arraysize=0;
    		
    		while(rs.next()) {
    			this.leaguenum = rs.getInt(1);
    		}
    		
    		this.league = new League[this.leaguenum];	
    		
    		sql = "select leagueid, leaguename, sportsid from league where sportsid="+a+" order by leagueid asc;";
    		ps = con.prepareStatement(sql);
        	rs = ps.executeQuery();    
        	int i=0;
        	
    		while(rs.next()){
    			sql = "select count(distinct hometeamid) from `participated team` where gameid = any(select gameid from game where leagueid ="+rs.getInt(1)+");";
        		pss = con.prepareStatement(sql);
            	rss = pss.executeQuery();
        		while(rss.next()) {  
        			arraysize = rss.getInt(1);
        			this.league[i] = new League();
        			this.league[i].score = new scoreg[arraysize][];
        			for(int z=0; z<arraysize; z++) {
        				this.league[i].score[z] = new scoreg[arraysize];
        			}
        			for(int z=0; z<arraysize ;z++) {
        				for (int j=0; j<arraysize; j++){
        					this.league[i].score[z][j] = new scoreg();
        				}	
        			}
        			for(int z=0; z<arraysize ;z++) {
        				for (int j=0; j<arraysize; j++){
        					this.league[i].score[z][j].win = 0;
        					this.league[i].score[z][j].lose = 0;
        					this.league[i].score[z][j].same = 0;
        				}	
        			}
        			
        			this.league[i].teamda = new teamdata[arraysize];
        		}	
        		this.league[i].size = arraysize;
        		this.league[i].leagueid = rs.getInt(1);
        		this.league[i].leaguename = rs.getString(2);
        		this.league[i].sportsnum = rs.getInt(3);
        		i++;
    		}
    	
    		for(i=0; i<this.leaguenum; i++) {
    			int j=0;
    			sql = "select distinct hometeamid from `participated team` where gameid = any(select gameid from game where gamestatus = '종료' and leagueid = "+ this.league[i].leagueid+") order by hometeamid asc;";
        		ps = con.prepareStatement(sql);
            	rs = ps.executeQuery();
            	while(rs.next()) {
            		this.league[i].teamda[j] = new teamdata();
            		j++;
            	}
            	j=0;
        		sql = "select distinct hometeamid from `participated team` where gameid = any(select gameid from game where gamestatus = '종료' and leagueid = "+ this.league[i].leagueid+") order by hometeamid asc;";
        		ps = con.prepareStatement(sql);
            	rs = ps.executeQuery();
            	while(rs.next()) {
            		//System.out.println(rs.getInt(1));
            		this.league[i].teamda[j].teamnum = rs.getInt(1);
            		String ssql = "select teamname from team where teamid="+this.league[i].teamda[j].teamnum+";";
            		pss = con.prepareStatement(ssql);
            		rss = pss.executeQuery();
            		while(rss.next()) {
            			//System.out.println(rss.getString(1));
            			this.league[i].teamda[j].teamname = rss.getString(1);
            		}
            		j++;
            	}
            	sql = "select p.hometeamid, p.awayteamid, g.gamestatusdetail from game as g join `participated team` as p on p.gameid = g.gameid where g.gamestatus='종료' and g.leagueid="+this.league[i].leagueid+";";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
               //System.out.println(this.league[i].leagueid);
                while(rs.next()){
                	int reverseteam=0;
                	int firstteam = 0;
                	String rsdata = rs.getString(3);
                	String gamedata[];
                	if(!rsdata.equals("[]")) {
                		gamedata = rsdata.split(",|:|\"");
                    	//System.out.println(rs.getInt(1) + " " + rs.getInt(2));
                        
                    	for(int k=0; k<this.league[i].size; k++) {
                    		if(this.league[i].teamda[k].teamnum == rs.getInt(1))	firstteam = k;
                    	}
                        
                    	for(int k=0; k<this.league[i].size; k++) {
                    		if(this.league[i].teamda[k].teamnum == rs.getInt(2))	reverseteam = k;
                    	}
                    	//System.out.println(Integer.parseInt(gamedata[4]) + " " + Integer.parseInt(gamedata[10]));
                    	if(Integer.parseInt(gamedata[4])>Integer.parseInt(gamedata[10])) {
                    		this.league[i].score[firstteam][reverseteam].win +=1;
                    		this.league[i].score[reverseteam][firstteam].lose +=1;
                    	}
                    	else if(Integer.parseInt(gamedata[4])<Integer.parseInt(gamedata[10]))	 {
                    		this.league[i].score[firstteam][reverseteam].lose +=1;
                    		this.league[i].score[reverseteam][firstteam].win +=1;
                    	}
                    	else {
                    		this.league[i].score[firstteam][reverseteam].same +=1;
                    		this.league[i].score[reverseteam][firstteam].same +=1;
                    	}
                	}
                }
                
                for(int l=0; l<this.league[i].size; l++) {
                	for(int k=0; k<this.league[i].size; k++) {
                		this.league[i].teamda[l].win+= this.league[i].score[l][k].win;
                		this.league[i].teamda[l].lose+= this.league[i].score[l][k].lose;
                		this.league[i].teamda[l].same+= this.league[i].score[l][k].same;
                	}
                    if((double)(this.league[i].teamda[l].win+this.league[i].teamda[l].lose)==0) {
                    	this.league[i].teamda[l].rank = 0;
                    }
                    else {
                    	this.league[i].teamda[l].rank = (double)this.league[i].teamda[l].win/(double)(this.league[i].teamda[l].win+this.league[i].teamda[l].lose);
                    }
                }
                
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
