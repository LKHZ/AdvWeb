package ssb.content;

public class ReplyDTO {
	private int id;
	private String content;
	private String userid;
	private int bulletinNum = 0;
	private int boardNum = 0;
	private String date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getBulletinNum() {
		return bulletinNum;
	}
	public void setBulletinNum(int bulletinNum) {
		this.bulletinNum = bulletinNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
