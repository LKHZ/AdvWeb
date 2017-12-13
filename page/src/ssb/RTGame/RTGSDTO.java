package ssb.RTGame;

public class RTGSDTO{

	private RealTimeBGame rtg;
	private int size=0;
 //2015. 1. 15 [최초작성자 한성대 이지훈]
 //DB와 연동할 DTO클래스 생성
 //DB에 있는 변수명과 동일하게 생성.
 //접근자 메서드, 생성자 2가지, toString메서드 생성.
	
	public RTGSDTO() {}
	
	public void setRealTimeBGame(RealTimeBGame rtg) {
		this.rtg = rtg;
	}
	public RealTimeBGame getRealTimeBGame() {
		return this.rtg;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getSize() {
		return this.size;
	}
}