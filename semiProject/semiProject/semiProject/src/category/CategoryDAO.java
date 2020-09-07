package category;

import java.sql.CallableStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import database.Database;
import database.SqlVO;

public class CategoryDAO {

	//ī�װ� list
	   public JSONObject list(SqlVO vo) {
	      JSONObject jobject = new JSONObject();
	      try {
	         String sql = "call list(?,?,?,?,?,?,?)";
	         CallableStatement cs = Database.CON.prepareCall(sql);
	         cs.setString(1, "category");
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
	            obj.put("category_code", rs.getString("category_code"));
	            obj.put("category_name", rs.getString("category_name"));
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
	         System.out.println("ī�װ����:" + e.toString());
	      }
	      return jobject;
	   }
}
