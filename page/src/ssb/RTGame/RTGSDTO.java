package ssb.RTGame;

public class RTGSDTO{

	private RealTimeBGame rtg;
	private int size=0;
 //2015. 1. 15 [�����ۼ��� �Ѽ��� ������]
 //DB�� ������ DTOŬ���� ����
 //DB�� �ִ� ������� �����ϰ� ����.
 //������ �޼���, ������ 2����, toString�޼��� ����.
	
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