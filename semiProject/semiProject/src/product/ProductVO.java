package product;

import java.util.Date;

public class ProductVO {
   private int product_code;
   private String product_name;
   private int product_price;
   private String company;
   private Date product_date;
   private Date product_exp;
   private String category_code;
   private String img;
   private String prod_del;
   private String category_name;
   
public int getProduct_code() {
	return product_code;
}
public void setProduct_code(int product_code) {
	this.product_code = product_code;
}
public String getProduct_name() {
	return product_name;
}
public void setProduct_name(String product_name) {
	this.product_name = product_name;
}
public int getProduct_price() {
	return product_price;
}
public void setProduct_price(int product_price) {
	this.product_price = product_price;
}
public String getCompany() {
	return company;
}
public void setCompany(String company) {
	this.company = company;
}
public Date getProduct_date() {
	return product_date;
}
public void setProduct_date(Date product_date) {
	this.product_date = product_date;
}
public Date getProduct_exp() {
	return product_exp;
}
public void setProduct_exp(Date product_exp) {
	this.product_exp = product_exp;
}
public String getCategory_code() {
	return category_code;
}
public void setCategory_code(String category_code) {
	this.category_code = category_code;
}
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public String getProd_del() {
	return prod_del;
}
public void setProd_del(String prod_del) {
	this.prod_del = prod_del;
}
public String getCategory_name() {
	return category_name;
}
public void setCategory_name(String category_name) {
	this.category_name = category_name;
}
@Override
public String toString() {
	return "ProductVO [product_code=" + product_code + ", product_name=" + product_name + ", product_price="
			+ product_price + ", company=" + company + ", product_date=" + product_date + ", product_exp=" + product_exp
			+ ", category_code=" + category_code + ", img=" + img + ", prod_del=" + prod_del + ", category_name="
			+ category_name + "]";
}
   
}