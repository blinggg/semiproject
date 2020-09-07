package stock;

import java.sql.*;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


import database.Database;
import database.SqlVO;

public class StockDAO {
	// �����Ȳ������
	public JSONObject pslist(SqlVO vo) {
	      JSONObject jobject = new JSONObject();
	      try {
	          String sql = "call list(?,?,?,?,?,?,?)";
	            CallableStatement cs = Database.CON.prepareCall(sql);
	            cs.setString(1, "pslist");
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
	            obj.put("cvs_code", rs.getString("cvs_code"));
	            obj.put("category_code", rs.getString("category_code"));
	            obj.put("product_code", rs.getInt("product_code"));
	            obj.put("product_name", rs.getString("product_name"));
	            obj.put("stock", rs.getInt("stock"));
	         
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	            
	            String strDate = sdf.format(rs.getDate("product_date"));
	            String strExp = sdf.format(rs.getDate("product_exp"));
	            obj.put("product_date", strDate);
	            obj.put("product_exp", strExp);
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
	         System.out.println("�����Ȳ���" + e.toString());
	      }
	      return jobject;
	   }
}
