package ssb.RTGame;

public class RTGBDTO{

	private RealTimeBGame rtg;
	private int size=0;
 //2015. 1. 15 [�����ۼ��� �Ѽ��� ������]
 //DB�� ������ DTOŬ���� ����
 //DB�� �ִ� ������� �����ϰ� ����.
 //������ �޼���, ������ 2����, toString�޼��� ����.
	
	public RTGBDTO() {}
	
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