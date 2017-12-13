package ssb.RTGame;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RTGSDAO {

	public static void main(String[] args) {
		RTGSDAO a = new RTGSDAO();
		a.getList();
	}
	
	
	public RTGSDAO() {};

 	public List<RTGSDTO> getList() {
 		List<RTGSDTO> list = null;
 		list = new ArrayList<RTGSDTO>();
 			try {
 				Connection con;
 				PreparedStatement ps, pss, psss;
 				ResultSet rs, rss, rsss;
 				con = DriverManager.getConnection("jdbc:mysql://localhost/ssbdb?useSSL=false", "root", "111111");
 				String sql= "select leagueid from league where sportsid = 1;";
 				ps = con.prepareStatement(sql);
 				if(ps != null){ //�� ��ü�� Null�� �ƴ϶�� ���� ���𰡸� �޾ƿԴٴ� �ǹ�. SQL������ �޾ƿ� ��.
 					rs = ps.executeQuery();
 					while(rs.next()) {
 							int chk=0;
 							String ssql = "select count(*) from game as g join `participated team` as p on p.gameid=g.gameid where g.gamestatus = '����' and g.leagueid="+rs.getInt(1)+";";
 	 						pss = con.prepareStatement(ssql);
 	 						rss = pss.executeQuery();
 	 						while(rss.next()) {
 	 							
 	 							chk += rss.getInt(1);
 	 						}
 	 						if(chk!=0) {
 	 							ssql = "select p.hometeamid,p.awayteamid, g.gamestatusdetail from game as g join `participated team` as p on p.gameid=g.gameid where g.gamestatus = '����' and g.leagueid="+rs.getInt(1)+";";
 	 	 						pss = con.prepareStatement(ssql);
 	 	 						rss = pss.executeQuery();
 	 	 						while(rss.next()) {
 	 	 	 						RTGSDTO dto = new RTGSDTO();
 	 	 	 						RealTimeBGame rtbgo = new RealTimeBGame();
 	 	 	 						dto.setSize(chk);
 	 	 							//System.out.println(rss.getInt(1));
 	 	 							String sssql = "select teamname, teamlogopath from team where teamid= "+ rss.getInt(1)+";";
 	 	 							psss = con.prepareStatement(sssql);
 	 	 							rsss=psss.executeQuery();
 	 	 							while(rsss.next()) {
 	 	 								rtbgo.sethtName(rsss.getString(1));
 	 	 								rtbgo.sethtLogo(rsss.getString(2));
 	 	 							}
 	 	 							sssql = "select teamname, teamlogopath from team where teamid= "+ rss.getInt(2)+";";
 	 	 							psss = con.prepareStatement(sssql);
 	 	 							rsss=psss.executeQuery();
 	 	 							while(rsss.next()) {
 	 	 								rtbgo.setatName(rsss.getString(1));
 	 	 								rtbgo.setatLogo(rsss.getString(2));
 	 	 							}
 	 	 							sssql = "select leaguename from league where leagueid= "+ rs.getInt(1)+";";
 	 	 							psss = con.prepareStatement(sssql);
 	 	 							rsss = psss.executeQuery();
 	 	 							while(rsss.next()) {
 	 	 								rtbgo.setLeagueName(rsss.getString(1));
 	 	 							}
 	 	 							String rsdata = rss.getString(3);
 	 	 		                	String gamedata[];
 	 	 		                	gamedata = rsdata.split("\"");
 	 	 		                	//System.out.println(gamedata[3] + " " + gamedata[7]);
 	 	 							rtbgo.sethtScore(Integer.parseInt(gamedata[3]));
 	 	 							rtbgo.setatScore(Integer.parseInt(gamedata[7]));

 	 	 	 						dto.setRealTimeBGame(rtbgo);
 	 	 	 						list.add(dto);
 	 	 						}
 	 						}
 					}
 					con.close();
 				}
 			}catch (SQLException e) {
 				System.out.println("�̰� ����");
 			}
 		return list;
 	}
} 