package order;

import java.sql.Date;

import cart.CartVO;

public class OrderVO extends CartVO{
	
	private String cvs_code;
	private Date order_date;
	private int order_id;
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getCvs_code() {
		return cvs_code;
	}
	public void setCvs_code(String cvs_code) {
		this.cvs_code = cvs_code;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
	
}
