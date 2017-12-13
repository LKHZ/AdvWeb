package ssb.scoredata;

import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.sql.Connection;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import java.util.Calendar;

public class AllDataBean {
	public static void main(String[] args) {
		//SqlChk connection = new SqlChk();
		//System.out.println("관리자 여부 : " + connection.isAdmin("admin", "admin"));
		AllDataBean a = new AllDataBean();
		a.AllData();
	}
	private Connection con;
	private Statement st;
	private String sql;

	public void AllData() {
		try {
            //OpenAPI call하는 URL
            /*String urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v&sportsName=baseball&date=20170503&nationSeq=47";*/
			Calendar calendar = Calendar.getInstance();
			int todayYear, todayDay, todayMonth;
			todayYear = calendar.get(Calendar.YEAR);
			todayMonth = calendar.get(Calendar.MONTH)+1;
			todayDay = calendar.get(Calendar.DAY_OF_MONTH);
        	int lastday;
        	boolean s=true;
        	
        	for(int i=12; i<=12; i++) {
        		if(s==false) {break;}
        		calendar.set(2017,i-1,1);
            	lastday=calendar.getActualMaximum(Calendar.DATE);
            
            	for(int j=1; j<=lastday; j++) {
            		if(i==todayMonth && j==todayDay) {s=false; break;}
            		for(int q=0; q<3; q++) {
            			if(i==1 && j==23 && q==2) {continue;}	
            			//OpenAPI call하는 URL
            			/*String urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v&sportsName=baseball&date=20170503&nationSeq=47";*/
            			String urlstr;
        				if(q==0) {
        					urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v&sportsName=soccer&date=2017"+String.format("%02d", i)+String.format("%02d",  j)+"&nationSeq=47";
        				}
        				else if(q==1) {
        					urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v&sportsName=baseball&date=2017"+String.format("%02d", i)+String.format("%02d",  j)+"&nationSeq=47";
        					
        				}
        				else {
        					urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v&sportsName=basketball&date=2017"+String.format("%02d", i)+String.format("%02d",  j)+"&nationSeq=47";
        				}
        				System.out.println(i+" "+ j + " " + q);
        				URL url = new URL(urlstr);
        				BufferedReader bf;
        				String line;
        				String result="";
        				int sportsid;
        				
        				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        				//날씨 정보를 받아온다.
        				bf = new BufferedReader(new InputStreamReader(url.openStream()));
        				
        				//버퍼에 있는 정보를 문자열로 변환.
        				while((line=bf.readLine())!=null){
        					result=result.concat(line);
        					//System.out.println(line);
        				}	
        				
        				//문자열을 JSON으로 파싱
        				JSONParser jsonParser = new JSONParser();
        				JSONObject jsonObj = (JSONObject) jsonParser.parse(result);
        				
        				//JSON 정보 출력
        				//System.out.println(jsonObj.get("row"));
        				
        				//배열 출력
        				JSONArray sprotArray = (JSONArray) jsonObj.get("row");
        				
        				//Database 선언
        				Class.forName("com.mysql.jdbc.Driver");
        				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ssbdb?useSSL=false", "root", "111111");
        				st = con.createStatement();
        				
        				
        				for(int k=0; k<sprotArray.size(); k++) {
        					JSONObject obj = (JSONObject) sprotArray.get(k);
        					
        					if(obj.get("progressStatus").toString().equals("대기")) {continue;}
        					if(obj.get("progressStatusDetail".toString()).equals("연기")){continue;}
        					if(obj.get("leagueName".toString()).equals("FA컵")) {continue;}
        					if(obj.get("homeTeamScore").toString().equals("null") || obj.get("awayTeamScore").toString().equals("null")) {continue;}
        					
        					//System.out.println(String.format("%02d", i)+String.format("%02d",  j));
        					
        					if(obj.get("sportsCate").equals("soccer")) {
        						sportsid=1;
        					}	
        					else if(obj.get("sportsCate".toString()).equals("baseball")) {
        						sportsid=2;
        					}
        					else if(obj.get("sportsCate".toString()).equals("basketball")){
        						sportsid=3;
        					}	
        					else {
        						System.out.println("erro!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!r");
        						sportsid = 0;
        					}
        					
        					
        					//sql = "insert into sports values('sportsid', 'sportsname')";
        					//st.executeUpdate(sql);
        					
        					
        					sql = "insert ignore into team values('"+Integer.parseInt(obj.get("homeTeamSeq").toString())+"', '"+obj.get("homeTeamName")+"','"+obj.get("homeTeamLogoPath")+"','"+sportsid+"');";
        					st.executeUpdate(sql);
        					
        					sql = "insert ignore into team values('"+Integer.parseInt(obj.get("awayTeamSeq").toString())+"', '"+obj.get("awayTeamName")+"','"+obj.get("awayTeamLogoPath")+"','"+sportsid+"');";
        					st.executeUpdate(sql);
        					
        					//	System.out.println("hi");
        					
        					
        					sql = "insert ignore into league values('"+Integer.parseInt(obj.get("leagueSeq").toString())+"', '"+obj.get("leagueName") +"','"+sportsid+"')on duplicate key update sportsid = sportsid;;";
        					st.executeUpdate(sql);
        					
        					//	System.out.println("hi");
        					
        					java.util.Date date = sdf.parse(obj.get("startTimeKST").toString());
        					java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
        					
        					sql = "insert ignore INTO game values('"+Integer.parseInt(obj.get("matchSeq").toString())+"','"+timestamp+"','"+obj.get("progressStatus")+"', '"+Integer.parseInt(obj.get("leagueSeq").toString())+"','"+obj.get("matchPartScore")+"')on duplicate key update leagueid = leagueid;";
        					
        					st.executeUpdate(sql);
        					
        					//System.out.println("hi");
        					
        					
        					sql = "insert ignore into `participated team` values('"+Integer.parseInt(obj.get("homeTeamSeq").toString())+"','"+Integer.parseInt(obj.get("awayTeamSeq").toString())+"','"+Integer.parseInt(obj.get("matchSeq").toString())+"');";
        					st.executeUpdate(sql);				
        				}	
        				
        				// System.out.println(obj.get("matchSeq"));
        				/*
        				 * System.out.println(obj.get("sportsCate"));
                        	System.out.println(obj.get("leagueSeq"));
                        System.out.println(obj.get("leagueName"));
                        System.out.println(obj.get("startTimeKST"));
                        System.out.println(obj.get("homeTeamSeq"));
                        System.out.println(obj.get("homeTeamLogoPath"));
                        System.out.println(obj.get("homeTeamName"));
                        System.out.println(obj.get("awayTeamSeq"));
                        System.out.println(obj.get("awayTeamLogoPath"));
                        System.out.println(obj.get("awayTeamName"));
                        System.out.println(obj.get("progressStatus"));
                        System.out.println(obj.get("progressStatusDetail"));
                        System.out.println(obj.get("matchPartScore"));
                     */            	
        				bf.close();
        			
        			//sql = "select * from sports";
        			//rs=st.executeQuery(sql);
            		}
            	}
        	}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("DB Driver Error!");
		}catch(Exception e)
		{
			System.out.println("연결오류");
		}
	}
	/*
	public boolean isAdmin(String adminID, String adminPassword) {
		try {
			String SQL = "SELECT * FROM ADMIN WHERE adminID = '" + adminID + "' and adminPAssword = '" + adminPassword+"'";
			rs = st.executeQuery(SQL);
			if(rs.next()) {
				return true;
			}
		}
		catch(Exception e) {
			System.out.println("데이터베이스 검색 오류");
		}
		return false;
	}
	*/
}
