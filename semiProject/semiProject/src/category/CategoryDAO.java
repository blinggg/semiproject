package category;

import java.sql.CallableStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import database.Database;
import database.SqlVO;

public class CategoryDAO {

	//카테고리 list
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
	         System.out.println("카테고리목록:" + e.toString());
	      }
	      return jobject;
	   }
}
