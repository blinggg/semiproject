package sell_record;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import database.Database;

public class RecordDAO {
	
	
	//월별 탑10 상품 출력
	
	public JSONObject list(int month) {
		JSONObject jObject=new JSONObject();
		try {
			String sql="select img, product_name, sold_quantity\r\n" + 
					"from product p, sell_record s\r\n" + 
					"where p.product_code=s.product_code and p.category_code=s.category_code and month=?\r\n" + 
					"order by sold_quantity desc limit 0, 5";
			PreparedStatement ps=Database.CON.prepareStatement(sql);
			ps.setInt(1, month);
			ResultSet rs=ps.executeQuery();
			JSONArray jArray=new JSONArray();
			while(rs.next()) {
				JSONObject obj=new JSONObject();
				obj.put("img", rs.getString("img"));
				obj.put("product_name", rs.getString("product_name"));
				obj.put("sold_quantity", rs.getInt("sold_quantity"));
				jArray.add(obj);
			}
			jObject.put("array", jArray);
		} catch(Exception e) {
			System.out.println("top10상품목록 : "+e.toString());
		}
		
		return jObject;
	}
	
}
