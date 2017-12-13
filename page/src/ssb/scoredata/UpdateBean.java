package ssb.scoredata;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.commons.daemon.Daemon;
import org.apache.commons.daemon.DaemonContext;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class UpdateBean extends Thread{
	public void run() {
		try {
			String sql;
			Statement st;
			Connection con;
			while(true) {
				String urlstr;
				//OpenAPI call하는 URL
				/*String urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v&sportsName=baseball&date=20170503&nationSeq=47";*/
				Calendar calendar = Calendar.getInstance();
				for(int i=0; i<3; i++) {
				if(i==0) {
					urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v&sportsName=soccer&date="+calendar.get(Calendar.YEAR)+String.format("%02d", calendar.get(Calendar.MONTH)+1)+String.format("%02d", calendar.get(Calendar.DAY_OF_MONTH))+"&nationSeq=47";
					//urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v&sportsName=soccer&date=20170812&nationSeq=47";
				}
				else if(i==1) {
					urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v&sportsName=baseball&date="+calendar.get(Calendar.YEAR)+String.format("%02d", calendar.get(Calendar.MONTH)+1)+String.format("%02d", calendar.get(Calendar.DAY_OF_MONTH))+"&nationSeq=47";
					//urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v&sportsName=baseball&date=20170812&nationSeq=47";
				}
				else {
					urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v&sportsName=basketball&date="+calendar.get(Calendar.YEAR)+String.format("%02d", calendar.get(Calendar.MONTH)+1)+String.format("%02d", calendar.get(Calendar.DAY_OF_MONTH))+"&nationSeq=47";
					//urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v&sportsName=basketball&date=20170812&nationSeq=47";
				}
				URL url = new URL(urlstr);
				BufferedReader bf;
				String line;
				String result="";
				int sportsid;
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
				
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
				System.out.println(jsonObj.get("row"));
				
				//배열 출력
				JSONArray sprotArray = (JSONArray) jsonObj.get("row");
				
				//Database 선언
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ssbdb?useSSL=false", "root", "111111");
				st = con.createStatement();
				
				
				for(int k=0; k<sprotArray.size(); k++) {
					JSONObject obj = (JSONObject) sprotArray.get(k);
					
					if(obj.get("progressStatusDetail".toString()).equals("연기") && !obj.get("leagueName".toString()).equals("FA컵")) {continue;}
						
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
					
					sql = "INSERT IGNORE INTO team values('"+Integer.parseInt(obj.get("homeTeamSeq").toString())+"', '"+obj.get("homeTeamName")+"','"+obj.get("homeTeamLogoPath")+"','"+sportsid+"');";
					st.executeUpdate(sql);
					sql = "INSERT IGNORE INTO team values('"+Integer.parseInt(obj.get("awayTeamSeq").toString())+"', '"+obj.get("awayTeamName")+"','"+obj.get("awayTeamLogoPath")+"','"+sportsid+"');";
					st.executeUpdate(sql);

					
					sql = "INSERT IGNORE INTO league values('"+Integer.parseInt(obj.get("leagueSeq").toString())+"', '"+obj.get("leagueName")+"','"+sportsid+"') on duplicate key update sportsid = sportsid;";
					st.executeUpdate(sql);
					
					
					java.util.Date date = sdf.parse(obj.get("startTimeKST").toString());
					java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
					sql = "insert INTO game values('"+Integer.parseInt(obj.get("matchSeq").toString())+"','"+timestamp+"','종료', '"+Integer.parseInt(obj.get("leagueSeq").toString())+"','"+obj.get("matchPartScore")+"') on duplicate key update gamestatus='종료';";            		
					st.executeUpdate(sql);           		

					sql = "INSERT IGNORE INTO `participated team` values('"+Integer.parseInt(obj.get("homeTeamSeq").toString())+"','"+Integer.parseInt(obj.get("awayTeamSeq").toString())+"', '"+Integer.parseInt(obj.get("matchSeq").toString())+"');";
					st.executeUpdate(sql);   				
				}
				bf.close();
				}
				Thread.sleep(30000);
			}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("DB Driver Error!");
		}catch(Exception e)
		{
			System.out.println("연결오류");
		}
	}

	public static void main(String[] args) {
		//SqlChk connection = new SqlChk();
		//System.out.println("관리자 여부 : " + connection.isAdmin("admin", "admin"));
		UpdateBean a = new UpdateBean();
		a.UpdateData();
	}
	public void UpdateData() {
		try {
			UpdateBean thJson = new UpdateBean();
			thJson.start();
		}catch(Exception e) {
			System.out.println("Thread Error");
		}
	}
		
}
