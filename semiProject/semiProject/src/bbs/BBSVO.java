package bbs;

import java.sql.Date;

public class BBSVO {

	private int bno;
	private String title;
	private String contents;
	private int ulike;
	private int dislike;
	private Date date;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getDislike() {
		return dislike;
	}
	public void setDislike(int dislike) {
		this.dislike = dislike;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "BBSVO [bno=" + bno + ", title=" + title + ", contents=" + contents + ", ulike=" + ulike + ", dislike="
				+ dislike + ", date=" + date + "]";
	}
	
}
