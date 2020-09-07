package sell_record;

import product.ProductVO;

public class RecordVO extends ProductVO {
	
	private int sold_quantity;
	private int month;
	
	public int getSold_quantity() {
		return sold_quantity;
	}
	public void setSold_quantity(int sold_quantity) {
		this.sold_quantity = sold_quantity;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	
	@Override
	public String toString() {
		return "RecordVO [sold_quantity=" + sold_quantity + ", month=" + month + ", getSold_quantity()="
				+ getSold_quantity() + ", getMonth()=" + getMonth() + ", getProduct_code()=" + getProduct_code()
				+ ", getProduct_name()=" + getProduct_name() + ", getProduct_price()=" + getProduct_price()
				+ ", getCompany()=" + getCompany() + ", getProduct_date()=" + getProduct_date() + ", getProduct_exp()="
				+ getProduct_exp() + ", getCategory_code()=" + getCategory_code() + ", getImg()=" + getImg()
				+ ", getProd_del()=" + getProd_del() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
