package sell_status;

import java.sql.CallableStatement;
import java.sql.ResultSet;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import database.Database;
import database.SqlVO;

public class Sell_StatusDAO {
	// �Ǹ���Ȳ ������
	   public JSONObject slist(SqlVO vo) {
	      JSONObject jobject = new JSONObject();
	      try {
	         String sql = "call list(?,?,?,?,?,?,?)";
	         CallableStatement cs = Database.CON.prepareCall(sql);
	         cs.setString(1, "(select r.*,p.product_price,p.product_name from sell_record r, product p where r.product_code=p.product_code and r.category_code=p.category_code) tbl");
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
	            obj.put("month", rs.getInt("month"));
	            obj.put("cvs_code", rs.getString("cvs_code"));
	            obj.put("product_code", rs.getInt("product_code"));
	            obj.put("product_name", rs.getString("product_name"));
	            obj.put("category_code", rs.getString("category_code"));
	            int price=rs.getInt("product_price");
	            int sold_quantity=rs.getInt("sold_quantity");
	            obj.put("sold_quantity", sold_quantity);
	            obj.put("price",price);
	            int total=price*sold_quantity;
	            obj.put("total",total);
	            
	            jArray.add(obj);
	         }
	         jobject.put("array", jArray);
	         
	         //�˻� ������ ����
	            cs.getMoreResults();
	            rs=cs.getResultSet();
	            int count=0;
	            if(rs.next()) { count=rs.getInt("total"); }
	            int perPage =vo.getPerPage();
	            int totPage = count%vo.getPerPage()==0?
	                  count/perPage:count/perPage+1;
	               jobject.put("count", count); //��ü ������
	               jobject.put("page", vo.getPage());//����������
	               jobject.put("perPage", vo.getPerPage());//�������� ����               
	               jobject.put("totPage", totPage);//��ü������
	      } catch (Exception e) {
	         System.out.println("�Ǹ���Ȳ���" + e.toString());
	      }
	      return jobject;
	   }
}
