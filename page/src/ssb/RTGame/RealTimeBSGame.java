package ssb.RTGame;

public class RealTimeBSGame{
	public void setatLogo(String Logo) {
		this.atLogo = Logo;
	}
	public String getatLogo() {
			return this.atLogo;
	}
	
	public void sethtLogo(String Logo) {
		this.htLogo=Logo;
	}
	public String gethtLogo() {
			return this.htLogo;
	}
	public void setatScore( int score) {
		this.atScore=score;
	}
	public int getatScore() {
			return this.atScore;		
	}
	public void sethtScore( int score) {
		this.htScore=score;
	}
	public int gethtScore() {
			return this.htScore;
	}
	public void sethtName( String Name) {
		this.htName = Name;
	}
	public String gethtName() {
			return this.htName;	
	}
	public void setatName( String Name) {
		this.atName = Name;
	}
	public String getatName() {
		return this.atName;
	}
	public void setLeagueName( String Name) {
		this.leagueName = Name;
	}
	public String getLeagueName() {
			return this.leagueName;
	}
	
	private	 String htName;
	private	String atName;
	private	String htLogo;
	private	String atLogo;
	private	int htScore=0;
	private	 int atScore=0;
	private	 String leagueName;
	public	 RealTimeBSGame(){};
}
