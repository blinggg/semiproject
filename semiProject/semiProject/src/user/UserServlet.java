package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

@WebServlet(value= {"/user/cvs_login","/user/company_login","/user/logout","/user/cvs_insert"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		RequestDispatcher dis=null;
		
		switch(request.getServletPath()) {
	      case "/user/logout":
	          HttpSession session=request.getSession();
	          session.invalidate();
	          response.sendRedirect("../index.jsp");
	          break;
	          

	          
			 case "/user/cvs_insert":
		         dis=request.getRequestDispatcher("insert.jsp");
		         dis.forward(request, response);
		         break;
	      }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		String cvs_id=request.getParameter("cvs_id");
		String company_id=request.getParameter("company_id");
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String tel=request.getParameter("tel");
		UserDAO udao=new UserDAO();
		
		switch(request.getServletPath()) {
		case "/user/cvs_login" :
			   UserVO vo=udao.cvs_login(cvs_id);
			   int check=0; //아이디가 없는경우
			   if(vo.getCvs_id()!=null) { 
			      if(vo.getPass().equals(pass)) {
			         check=2; //id, pass가 일치하는 경우
			         HttpSession session=request.getSession();
			         session.setAttribute("cvs_id", vo.getCvs_id());
			         session.setAttribute("name", vo.getName());
			      } else {
			         check=1; //id 있으나 pass가 일치하는 않는경우
			      }
			   } 
			   JSONObject jObject=new JSONObject();
			   jObject.put("check", check);
			   out.println(jObject);
			   System.out.println("check : " + check);
			   break;
			   
			case "/user/company_login" :
			   vo=udao.company_login(company_id);
			   check=0; //아이디가 없는경우
			   if(vo.getCompany_id()!=null) { 
			      if(vo.getPass().equals(pass)) {
			         check=2; //id, pass가 일치하는 경우
			         HttpSession session=request.getSession();
			         session.setAttribute("company_id", vo.getCompany_id());
			         session.setAttribute("name", vo.getName());
			      } else {
			         check=1; //id 있으나 pass가 일치하는 않는경우
			      }
			   } 
			   jObject=new JSONObject();
			   jObject.put("check", check);
			   out.println(jObject);
			   System.out.println("check : " + check);
			   break;
			   
			 case "/user/cvs_insert":
				 System.out.println("insert");
				 vo=new UserVO();
		         vo.setCvs_id(request.getParameter("cvs_id"));
		         vo.setPass(request.getParameter("pass"));
		         vo.setName(request.getParameter("name"));
		         vo.setEmail(request.getParameter("email"));
		         vo.setTel(request.getParameter("tel"));
		         jObject=udao.insert(vo);
		         out.println(jObject);
		         break;
		         
		}
	}
}
