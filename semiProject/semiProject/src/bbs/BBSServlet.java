package bbs;

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

import database.SqlVO;

@WebServlet(value= {"/bbs/ulike","/bbs/list","/bbs/insert","/bbs/read","/bbs/update","/bbs/delete","/bbs/replylist","/bbs/replyinsert","/bbs/replydelete"})
public class BBSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); 
	    PrintWriter out=response.getWriter();
	    BBSDAO bdao=new BBSDAO();
    	
		switch(request.getServletPath()) {
		case "/bbs/read":
			int count=bdao.count();
			String strbno=request.getParameter("bno");
	    	int bno=Integer.parseInt(strbno);
	    	JSONObject jObject=new JSONObject();
	    	request.setAttribute("count", count);
	    	request.setAttribute("vo", bdao.read(bno));
			RequestDispatcher dis=request.getRequestDispatcher("read.jsp");
			dis.forward(request, response);
			break;
		case "/bbs/update":
			count=bdao.count();
			strbno=request.getParameter("bno");
	    	bno=Integer.parseInt(strbno);
	    	jObject=new JSONObject();
	    	request.setAttribute("count", count);
	    	request.setAttribute("vo", bdao.read(bno));
			dis=request.getRequestDispatcher("update.jsp");
			dis.forward(request, response);
			break;
		case "/bbs/insert":
			response.sendRedirect("insert.jsp");
			break;
		case "/bbs/list":
			SqlVO sqlVO=new SqlVO();
			String key=request.getParameter("key")==null?"bno":request.getParameter("key");
			String word=request.getParameter("word")==null?"":request.getParameter("word");
			String order=request.getParameter("order")==null?"bno":request.getParameter("order");
			String desc=request.getParameter("desc")==null?"":request.getParameter("desc");
			String page=request.getParameter("page")==null?"1":request.getParameter("page");
			String perPage=request.getParameter("perPage")==null?"5":request.getParameter("perPage");
			
			sqlVO.setKey(key);
			sqlVO.setWord(word);
			sqlVO.setOrder(order);
			sqlVO.setDesc(desc);
			sqlVO.setPage(Integer.parseInt(page));
			sqlVO.setPerPage(Integer.parseInt(perPage));
			out.println(bdao.list(sqlVO));
			break;
		case "/bbs/ulike":
			strbno=request.getParameter("bno");
	    	bno=Integer.parseInt(strbno);
	    	String strulike=request.getParameter("ulike");
	    	int ulike=Integer.parseInt(strulike);
	    	bdao.ulikeUpdate(bno, ulike);
	    	break;
		case "/bbs/replylist":
			strbno=request.getParameter("bno");
	    	bno=Integer.parseInt(strbno);
	    	BBS_replyVO vo=new BBS_replyVO();
	    	vo.setBno(bno);
	    	out.println(bdao.blist(vo));
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		JSONObject jObject=new JSONObject();
		PrintWriter out=response.getWriter();
	    switch(request.getServletPath()) {
	    case "/bbs/insert" :
	       BBSVO vo=new BBSVO();
	       vo.setTitle(request.getParameter("title"));
	       vo.setContents(request.getParameter("contents"));
	       BBSDAO dao=new BBSDAO();
	       dao.insert(vo);
	       response.sendRedirect("list.jsp");
	       break;
	    case "/bbs/replyinsert":
	    	BBS_replyVO bvo=new BBS_replyVO();
	    	String strbno=request.getParameter("bno");
	    	int bno=Integer.parseInt(strbno);
		    bvo.setBno(bno);
		    bvo.setContents(request.getParameter("contents"));
		    dao=new BBSDAO();
		    dao.binsert(bvo);
	    	break;
	    case "/bbs/update":
	    	dao=new BBSDAO();
	    	HttpSession session=request.getSession();
	    	String company_id = (String) session.getAttribute("company_id");
	    	strbno=request.getParameter("bno");
	    	bno=Integer.parseInt(strbno);
	    	String title=request.getParameter("title");
	    	String contents=request.getParameter("contents");
	    	session.setAttribute("company_id", company_id);
			int count=dao.update(company_id, title, contents, bno);
			jObject.put("count", count);
			out.print(jObject);
			break;
	    case "/bbs/delete":
	    	dao=new BBSDAO();
	    	session=request.getSession();
	    	company_id = (String) session.getAttribute("company_id");
	    	strbno=request.getParameter("bno");
	    	bno=Integer.parseInt(strbno);
	    	session.setAttribute("company_id", company_id);
			count=dao.delete(company_id, bno);
			jObject.put("count", count);
			out.print(jObject);
			break;
	    case "/bbs/replydelete":
	    	dao=new BBSDAO();
	    	strbno=request.getParameter("bno");
	    	bno=Integer.parseInt(strbno);
	    	String strrno=request.getParameter("rno");
	    	int rno=Integer.parseInt(strrno);
	    	dao.bdelete(bno, rno);
			break;
		}
	}
	    	
}
