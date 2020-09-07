package order;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import database.Database;
import database.SqlVO;

public class OrderDAO {

	public int insert(OrderVO vo) {
		int count = 1;
		try {
			String sql = "call add_orders(?,?,?,?,?)";
			CallableStatement cs = Database.CON.prepareCall(sql);
			cs.setString(1, vo.getCvs_code());
			cs.setInt(2, vo.getProduct_code());
			cs.setString(3, vo.getCategory_code());
			cs.setInt(4, vo.getOrder_quantity());
			cs.registerOutParameter(5, java.sql.Types.INTEGER);
			cs.execute();
			
			count = cs.getInt(5);

		} catch (Exception e) {
			System.out.println("orderinsert:" + e.toString());
		}

		return count;
	}
	public JSONObject list(SqlVO vo) {
		JSONObject jobject = new JSONObject();
		try {
			String sql = "call list(?,?,?,?,?,?,?)";
			CallableStatement cs = Database.CON.prepareCall(sql);
			cs.setString(1, "(select po.*, category_name, cvs_name from polist po, category c, cvs v where c.category_code=po.category_code and v.cvs_code=po.cvs_code) tbl");
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
				int product_price=rs.getInt("product_price");
				int order_quantity=rs.getInt("order_quantity");
				int total=product_price*order_quantity;
				obj.put("total", total);
				obj.put("product_price", product_price);
				obj.put("cvs_code", rs.getString("cvs_code"));
				obj.put("cvs_name", rs.getString("cvs_name"));
				obj.put("category_code", rs.getString("category_code"));
				obj.put("category_name", rs.getString("category_name"));
				obj.put("order_quantity", rs.getString("order_quantity"));
				obj.put("order_id", rs.getString("order_id"));
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String order_date = sdf.format(rs.getDate("order_date"));
				obj.put("order_date", order_date);
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

}
