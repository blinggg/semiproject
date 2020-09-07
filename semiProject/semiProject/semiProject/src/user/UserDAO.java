package user;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONObject;
import database.Database;

public class UserDAO {
	  //ȸ������
    public JSONObject insert(UserVO vo) {
       JSONObject jObject=new JSONObject();
       try {
          String sql="call add_user(?,?,?,?,?,?)";
          CallableStatement cs=Database.CON.prepareCall(sql);
          cs.setString(1,vo.getCvs_id());
          cs.setString(2,vo.getPass());
          cs.setString(3,vo.getName());
          cs.setString(4, vo.getEmail());
          cs.setString(5, vo.getTel());
          cs.registerOutParameter(6,java.sql.Types.INTEGER);
          cs.execute();
          jObject.put("count",cs.getInt(6));
          
       }catch(Exception e) {
          System.out.println("ȸ������:"+e.toString());
       }
       return jObject;   
    }
	
	//ȸ�� �α��� üũ
    public UserVO company_login(String company_id) {
       UserVO vo=new UserVO();
       try {
          String sql="select * from company_user where company_id=?";
          PreparedStatement ps=Database.CON.prepareStatement(sql);
          ps.setString(1, company_id);
          ResultSet rs=ps.executeQuery();
          if(rs.next()) {
             vo.setCompany_id(rs.getString("company_id"));
             vo.setPass(rs.getString("pass"));
             vo.setName(rs.getString("name"));
             vo.setEmail(rs.getString("email"));
             vo.setTel(rs.getString("tel"));
          }
       } catch(Exception e) {
          System.out.println("�α���üũ : " + e.toString());
       }
       return vo;
    }
    
    //���� �α���
    public UserVO cvs_login(String cvs_id) {
       UserVO vo=new UserVO();
       try {
          String sql="select * from cvs_user where cvs_id=?";
          PreparedStatement ps=Database.CON.prepareStatement(sql);
          ps.setString(1, cvs_id);
          ResultSet rs=ps.executeQuery();
          if(rs.next()) {
             vo.setCvs_id(rs.getString("cvs_id"));
             vo.setPass(rs.getString("pass"));
             vo.setName(rs.getString("name"));
             vo.setEmail(rs.getString("email"));
             vo.setTel(rs.getString("tel"));
          }
       } catch(Exception e) {
          System.out.println("�α���üũ : " + e.toString());
       }
       return vo;
    }
	
	//�α��� üũ
		/*public UserVO login(String id) {
			UserVO vo=new UserVO();
			try {
				String sql="select * from user where id=?";
				PreparedStatement ps=Database.CON.prepareStatement(sql);
				ps.setString(1, id);
				ResultSet rs=ps.executeQuery();
				if(rs.next()) {
					vo.setId(rs.getString("id"));
					vo.setPass(rs.getString("pass"));
					vo.setName(rs.getString("name"));
					vo.setSort(rs.getString("sort"));
					vo.setEmail(rs.getString("email"));
					vo.setTel(rs.getString("tel"));
				}
			}catch(Exception e){
				System.out.println("�α���üũ:"+e.toString());
			}
			return vo;
		}*/
}
