package ssb.makeview;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;


class scoreg{
	int win;
	int lose;
	int same;
	scoreg(){};
}

class teamdata{
	int teamnum;
	double rank;
	teamdata(){};
}

class League {
	int leagueid;
	scoreg[][] score=null;
	teamdata[] teamda=null; 
	int size;
	
	League(){};
}


public class TSVBean {
	private League[] league;
	private int leaguenum =0;
	private int wing=0;
	private int loseg=0;
	private int sameg=0;
	
	
	public static void main(String[] args) {
		TSVBean a = new TSVBean();
		a.AllScore();
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
	
	public void setTeamWin(int b) {
		for(int i=0; i<this.league[this.leaguenum].size; i++) {
			this.wing += this.league[this.leaguenum].score[b][i].win;
		}
	}
	public int getTeamWin() {
		return this.wing;
	}
	public void setTeamLose(int b) {
		for(int i=0; i<this.league[this.leaguenum].size; i++) {
			this.loseg += this.league[this.leaguenum].score[b][i].lose;
		}
	}
	
	public int getTeamLose() {
		return this.loseg;
	}
	public int getTeamSame() {
		return this.sameg;
	}
	public void setTeamSame(int b) {
		for(int i=0; i<this.league[this.leaguenum].size; i++) {
			this.sameg += this.league[this.leaguenum].score[b][i].same;
		}
	}
	public int getTeamRate() {
		return getTeamWin() / (getTeamLose()+getTeamWin()+getTeamSame());
	}
	
    public void AllScore() {
    	PreparedStatement pss = null, ps = null;
    	ResultSet rs = null, rss =null;
    	Connection con;
    	String sql = "select count(*) from league";
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
    		
    		sql = "select leagueid from league order by leagueid asc;";
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
        		i++;
    		}
    	
    		for(i=0; i<this.leaguenum; i++) {
    			int j=0;
    			sql = "select distinct hometeamid from `participated team` where gameid = any(select gameid from game where leagueid = "+ league[i].leagueid+") order by hometeamid asc;";
        		ps = con.prepareStatement(sql);
            	rs = ps.executeQuery();
            	while(rs.next()) {
            		this.league[i].teamda[j] = new teamdata();
            		j++;
            	}
            	j=0;
        		sql = "select distinct hometeamid from `participated team` where gameid = any(select gameid from game where leagueid = "+ league[i].leagueid+") order by hometeamid asc;";
        		ps = con.prepareStatement(sql);
            	rs = ps.executeQuery();
            	while(rs.next()) {
            		this.league[i].teamda[j].teamnum = rs.getInt(1);
            		j++;
            	}
            	sql = "select p.hometeamid, p.awayteamid, g.gamestatusdetail from game as g join `participated team` as p on p.gameid = g.gameid where g.leagueid="+league[i].leagueid+";";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
               // System.out.println("hi");
                while(rs.next()){
                	
                	int reverseteam=0;
                	int firstteam = 0;
                	String rsdata = rs.getString(3);
                	String gamedata[];
                	gamedata = rsdata.split(",|:|\"");
                	//System.out.println(rs.getInt(1) + " " + rs.getInt(2));
                	for(int k=0; k<this.league[i].size; k++) {
                		if(this.league[i].teamda[k].teamnum == rs.getInt(1))	firstteam = k;
                	}
                	for(int k=0; k<league[i].size; k++) {
                		if(this.league[i].teamda[k].teamnum == rs.getInt(2))	reverseteam = k;
                	}
                	//System.out.println(Integer.parseInt(gamedata[4]) + " " + Integer.parseInt(gamedata[10]));
                	if(Integer.parseInt(gamedata[4])>Integer.parseInt(gamedata[10])) {
                		this.league[i].score[firstteam][reverseteam].win +=1;
                		this.league[i].score[reverseteam][firstteam].lose +=1;
                	}
                	else if(Integer.parseInt(gamedata[4])==Integer.parseInt(gamedata[10]))	 {
                		this.league[i].score[firstteam][reverseteam].lose +=1;
                		this.league[i].score[reverseteam][firstteam].win +=1;
                	}
                	else {
                		this.league[i].score[firstteam][reverseteam].same +=1;
                		this.league[i].score[reverseteam][firstteam].same +=1;
                	}
                }
                
                
                int win1, same1, lose1;
                for(int l=0; l<this.league[i].size; l++) {
                	win1 =0; same1=0; lose1=0;
                    for(int k=0; k<this.league[i].size; k++) {
                		win1 += this.league[i].score[l][k].win;
                		same1 += this.league[i].score[l][k].same;
                		lose1 += this.league[i].score[l][k].lose;
                    }
                    this.league[i].teamda[l].rank = (double)win1/(double)(win1+same1+lose1);
                    
                    //System.out.println(i+" : " + l + " : " + this.league[i].teamda[l].rank);
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
