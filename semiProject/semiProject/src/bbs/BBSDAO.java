package bbs;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import database.Database;
import database.SqlVO;

public class BBSDAO {
	
	//��� ����
 	public void bdelete(int bno,int rno) {
 		try {
 			String sql="delete from bbs_reply where bno=? and rno=?";
 			PreparedStatement ps=Database.CON.prepareStatement(sql);
 			ps.setInt(1, bno);
 			ps.setInt(2, rno);
 			ps.execute();
 		}catch(Exception e){
 			System.out.println("��� ���� :"+e.toString());
 		}
 	}
	
	//��۵��
	public boolean binsert(BBS_replyVO vo) {
	      boolean success=false;
	      try {
	         String sql="insert into bbs_reply(bno,contents,ulike,date) values(?,?,?,now())";
	         PreparedStatement ps=Database.CON.prepareStatement(sql);
	         ps.setInt(1, vo.getBno());
	         ps.setString(2, vo.getContents());
	         ps.setInt(3, vo.getUlike());
	         ps.execute();
	         success=true;
	      }catch(Exception e) {
	         success=false;
	         System.out.println("��۵��:"+e.toString());
	      }
	      return success;
	   }
	
	//�Խñ۸��� ��۸��
	public JSONObject blist(BBS_replyVO vo) {
	      JSONObject jobject = new JSONObject();
	      try {
	         String sql = "select * from bbs_reply where bno=?";
	         PreparedStatement ps=Database.CON.prepareStatement(sql);
	         ps.setInt(1, vo.getBno());
	         ps.execute();
	         ResultSet rs=ps.executeQuery();
	         JSONArray jArray = new JSONArray();
	         while (rs.next()) {
	            JSONObject obj = new JSONObject();
	            obj.put("bno", rs.getInt("bno"));
	            obj.put("rno", rs.getString("rno"));
	            obj.put("contents", rs.getString("contents"));
	            obj.put("ulike", rs.getInt("ulike"));
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	            String strDate = sdf.format(rs.getDate("date"));
	            obj.put("date", strDate);
	            jArray.add(obj);
	         }
	         jobject.put("bArray", jArray);
	        
	      } catch (Exception e) {
	         System.out.println("��۸��" + e.toString());
	      }
	      return jobject;
	   }
	
	//���ƿ� �޼��� �����
   public void ulikeUpdate(int bno, int ulike) {
	   try {
		   String sql="update bbs set ulike=? where bno=?";
		      PreparedStatement ps=Database.CON.prepareStatement(sql);
		      ps.setInt(1, ulike);
		      ps.setInt(2, bno);
		      ps.execute();
	   }catch(Exception e) {
		   System.out.println("���ƿ�:"+e.toString());
	   }
   }   
   
   public int count() {
	   int count=-1;
	   try {
		   String sql="select count(*) cnt from bbs";
		   PreparedStatement ps=Database.CON.prepareStatement(sql);
		   ResultSet rs=ps.executeQuery();
		   if(rs.next()) {
			   count=rs.getInt("cnt");
		   }
	   }catch (Exception e) {
		// TODO: handle exception
	}
	   return count;
   }
	
   //�Խñ� ����
 	public int delete(String company_id,int bno) {
 		int count=-1;
 		try {
 			String sql="call delete_bbs_user(?,?,?)";
 			CallableStatement cs=Database.CON.prepareCall(sql);
 			cs.setString(1, company_id);
 			cs.setInt(2, bno);
 			cs.registerOutParameter(3, java.sql.Types.INTEGER);
 			cs.execute();
 			count=cs.getInt(3);
 		}catch(Exception e){
 			System.out.println("�Խñ� ���� :"+e.toString());
 		}
 		return count;
 	}

	//�Խñ� ����
	public int update(String company_id,String title,String contents,int bno) {
		int count=-1;
		try {
			String sql="call update_bbs_user(?,?,?,?,?)";
			CallableStatement cs=Database.CON.prepareCall(sql);
			cs.setString(1, company_id);
			cs.setString(2, title);
			cs.setString(3, contents);
			cs.setInt(4, bno);
			cs.registerOutParameter(5, java.sql.Types.INTEGER);
			cs.execute();
			count=cs.getInt(5);
		}catch(Exception e){
			System.out.println("�Խñ� ���� :"+e.toString());
		}
		return count;
	}
	
	//�Խñ� �б�
	public BBSVO read(int bno) {
		BBSVO vo=new BBSVO();
		try {
			String sql="select * from bbs where bno=?";
			PreparedStatement ps=Database.CON.prepareStatement(sql);
			ps.setInt(1, bno);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				vo.setBno(rs.getInt("bno"));
				vo.setTitle(rs.getString("title"));
				vo.setContents(rs.getString("contents"));
				vo.setDate(rs.getDate("date"));
			}
		}catch(Exception e) {
			System.out.println("�Խñ� �б�:"+e.toString());
		}
		return vo;
	}
	
	//�Խñ� ����ϱ�
   public boolean insert(BBSVO vo) {
      boolean success=false;
      try {
         String sql="insert into bbs(title,contents,ulike,date) values(?,?,?,now())";
         PreparedStatement ps=Database.CON.prepareStatement(sql);
         ps.setString(1, vo.getTitle());
         ps.setString(2, vo.getContents());
         ps.setInt(3, vo.getUlike());
         ps.execute();
         success=true;
      }catch(Exception e) {
         success=false;
         System.out.println("�Խ��� �۾���:"+e.toString());
      }
      return success;
   }
	
	//�Խ��� ���
   public JSONObject list(SqlVO vo) {
      JSONObject jobject = new JSONObject();
      try {
         String sql = "call list(?,?,?,?,?,?,?)";
         CallableStatement cs = Database.CON.prepareCall(sql);
         cs.setString(1, "bbs");
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
            obj.put("bno", rs.getInt("bno"));
            obj.put("title", rs.getString("title"));
            obj.put("contents", rs.getString("contents"));
            obj.put("ulike", rs.getInt("ulike"));
            obj.put("dislike", rs.getInt("dislike"));
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String strDate = sdf.format(rs.getDate("date"));
            obj.put("date", strDate);
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
         System.out.println("�Խñ۸��" + e.toString());
      }
      return jobject;
   }
}