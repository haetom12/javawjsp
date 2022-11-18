package study.database;

public class JusorokVO {
	private int idx;
	private String mid;
	private String pwd;
	private String name;
	private int point;
	private String lastDate;
	
	
	int getIdx() {
		return idx;
	}
	void setIdx(int idx) {
		this.idx = idx;
	}
	String getMid() {
		return mid;
	}
	void setMid(String mid) {
		this.mid = mid;
	}
	String getPwd() {
		return pwd;
	}
	void setPwd(String pwd) {
		this.pwd = pwd;
	}
	String getName() {
		return name;
	}
	void setName(String name) {
		this.name = name;
	}
	int getPoint() {
		return point;
	}
	void setPoint(int point) {
		this.point = point;
	}
	String getLastDate() {
		return lastDate;
	}
	void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	@Override
	public String toString() {
		return "JusorokVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", point=" + point
				+ ", lastDate=" + lastDate + "]";
	}

}
