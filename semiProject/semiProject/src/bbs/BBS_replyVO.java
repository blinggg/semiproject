package bbs;

import java.sql.Date;

public class BBS_replyVO {

	private int bno;
	private int rno;
	private String contents;
	private int ulike;
	private Date date;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getUlike() {
		return ulike;
	}
	public void setUlike(int ulike) {
		this.ulike = ulike;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "BBS_replyVO [bno=" + bno + ", rno=" + rno + ", contents=" + contents + ", ulike=" + ulike + ", date="
				+ date + "]";
	}
	
}
