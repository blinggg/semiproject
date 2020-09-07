package product;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import database.Database;
import database.SqlVO;

public class ProductDAO {
	//상품 등록
	public void insert(ProductVO vo) {
		try {
			String sql="insert into product(product_code, product_name, product_price, company, product_date, product_exp, category_code, img, prod_del) "
					+ "values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=Database.CON.prepareStatement(sql);
			ps.setInt(1, vo.getProduct_code());
			ps.setString(2, vo.getProduct_name());
			ps.setInt(3, vo.getProduct_price());
			ps.setString(4, vo.getCompany());
			ps.setDate(5, (Date)vo.getProduct_date());
			ps.setDate(6, (Date)vo.getProduct_exp());
			ps.setString(7, vo.getCategory_code());
			ps.setString(8, vo.getImg());
			ps.setString(9, vo.getProd_del());
			ps.execute();
		} catch(Exception e) {
			System.out.println("상품등록 : "+e.toString());
		}	
	}
	  // 상품목록출력
	   public JSONObject list(SqlVO vo) {
	      JSONObject jobject = new JSONObject();
	      try {
	         String sql = "call list(?,?,?,?,?,?,?)";
	         CallableStatement cs = Database.CON.prepareCall(sql);
	         cs.setString(1, "product");
	         cs.setString(2, vo.getKey());
	         cs.setString(3, vo.getWord());
	         cs.setString(4, vo.getOrder());
	         cs.setString(5, vo.getDesc());
	         cs.setInt(6, vo.getPage());
	         cs.setInt(7, vo.getPerPage());
	         cs.execute();

	         ResultSet rs = cs.getResultSet();
	         JSONArray jArray = new JSONArray();
	         while (rs.next()) {
	            JSONObject obj = new JSONObject();
	            obj.put("product_code", rs.getInt("product_code"));
	            obj.put("product_name", rs.getString("product_name"));
	            obj.put("product_price", rs.getInt("product_price"));
	            obj.put("company", rs.getString("company"));
	            obj.put("category_code", rs.getString("category_code"));
	            obj.put("img", rs.getString("img"));
	            obj.put("product_del", rs.getString("prod_del"));
	            
	            DecimalFormat df = new DecimalFormat("#,###");
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	            
	            String strDate = sdf.format(rs.getDate("product_date"));
	            String strExp = sdf.format(rs.getDate("product_exp"));
	            obj.put("product_date", strDate);
	            obj.put("product_exp", strExp);
	            jArray.add(obj);
	         }
	         jobject.put("array", jArray);
	      
	         //검색 데이터 갯수
	            cs.getMoreResults();
	            rs=cs.getResultSet();
	            int count=0;
	            if(rs.next()) { count=rs.getInt("total"); }
	            int perPage =vo.getPerPage();
	            int totPage = count%vo.getPerPage()==0?
	                  count/perPage:count/perPage+1;
	               jobject.put("count", count); //전체 데이터
	               jobject.put("page", vo.getPage());//현재페이지
	               jobject.put("perPage", vo.getPerPage());//페이지당 갯수
	               jobject.put("totPage", totPage);//전체페이지
	      
	      } catch (Exception e) {
	         System.out.println("상품목록" + e.toString());
	      }
	      return jobject;
	   }

	
	//상품정보 읽기
	public ProductVO read(String product_code) {
		ProductVO vo=new ProductVO();
		try {
			String sql="select p.*,category_name from product p left join category c on p.category_code=c.category_code where product_code=?";
			PreparedStatement ps=Database.CON.prepareStatement(sql);
			ps.setString(1, product_code);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				vo.setProduct_code(rs.getInt("product_code"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setProduct_price(rs.getInt("product_price"));
				vo.setCompany(rs.getString("company"));
				vo.setProduct_date(rs.getDate("product_date"));
				vo.setProduct_exp(rs.getDate("product_exp"));
				vo.setCategory_code(rs.getString("category_code"));
				vo.setImg(rs.getString("img"));
				vo.setProd_del(rs.getString("prod_del"));
				vo.setCategory_name(rs.getString("category_name"));
			}
		}catch(Exception e) {
			System.out.println("상품정보 읽기:"+e.toString());
		}
		return vo;
	}
	
	//상품 수정
	public void update(ProductVO vo) {
		try {
			String sql="update product set product_name=?,product_price=?,company=?,category_code=?,prod_del=?,img=? where product_code=?";
			PreparedStatement ps=Database.CON.prepareStatement(sql);
			ps.setString(1, vo.getProduct_name());
			ps.setInt(2, vo.getProduct_price());
			ps.setString(3, vo.getCompany());
			ps.setString(4, vo.getCategory_code());
			ps.setString(5, vo.getProd_del());
			ps.setString(6, vo.getImg());
			ps.setInt(7, vo.getProduct_code());
			ps.execute();
		}catch(Exception e) {
			System.out.println("상품수정:"+e.toString());
		}
	}
	
}
