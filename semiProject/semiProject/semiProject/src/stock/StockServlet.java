package stock;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import database.SqlVO;


@WebServlet(value= {"/stock/list"})
public class StockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8"); 
	       PrintWriter out=response.getWriter();
	       StockDAO pdao=new StockDAO();
		switch(request.getServletPath()) {
		case "/stock/list":  
		      SqlVO sqlVO = new SqlVO();
		      String key = request.getParameter("key") == null ? "cvs_code" : request.getParameter("word");
		      String word = request.getParameter("word") == null ? "" : request.getParameter("word");
		      String order = request.getParameter("order") == null ? "product_code" : request.getParameter("order");
		      String desc = request.getParameter("desc") == null ? "" : request.getParameter("desc");
		      String page = request.getParameter("page") == null ? "1" : request.getParameter("page");
		      String perPage = request.getParameter("perPage") == null ? "25" : request.getParameter("perPage");
		      
		      sqlVO.setKey(key);
		      sqlVO.setWord(word);
		      sqlVO.setOrder(order);
		      sqlVO.setDesc(desc);
		      sqlVO.setPage(Integer.parseInt(page));
		      sqlVO.setPerPage(Integer.parseInt(perPage));
		        out.println(pdao.pslist(sqlVO));
		}
} 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
