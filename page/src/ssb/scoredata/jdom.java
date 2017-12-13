package ssb.scoredata;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class jdom {
    public static void main(String[] args) {
        try{
            //서울시청의 위도와 경도
            String lon = "126.977948";  //경도
            String lat = "37.566386";   //위도

            
           

            //OpenAPI call하는 URL
            String urlstr = "https://api.scoreapi.co.kr/matches?apiKey=evr488quxrj30hxkn41lfu0absrskr2v";
            URL url = new URL(urlstr);
            BufferedReader bf;
            String line;
            String result="";

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
            System.out.println(jsonObj.get("row"));

            //배열 출력
            JSONArray sprotArray = (JSONArray) jsonObj.get("row");
            for(int i=0; i<sprotArray.size(); i++) {
                JSONObject obj = (JSONObject) sprotArray.get(i);
                System.out.println(obj.get("sportsCate"));
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
                System.out.println(obj.get("homeTeamScore"));
                System.out.println(obj.get("awayTeamScore"+"\n\n"));
                System.out.println(obj.get("matchSeq"));
                System.out.println(obj.get("matchPartScore"));
                System.out.println(obj.get("leagueSeq"));
                System.out.println(obj.get("progressStatus"));
                
            }

            bf.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}