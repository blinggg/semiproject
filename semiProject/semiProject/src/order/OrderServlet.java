package order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import database.SqlVO;




@WebServlet(value= {"/order/list","/order/insert"})
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		OrderDAO odao = new OrderDAO();
		switch (request.getServletPath()) {
		case "/order/list":
			SqlVO sqlVO = new SqlVO();
			String key = request.getParameter("key") == null ? "cvs_code" : request.getParameter("key");
			String word = request.getParameter("word") == null ? "" : request.getParameter("word");
			String order = request.getParameter("order") == null ? "order_date" : request.getParameter("order");
			String desc = request.getParameter("desc") == null ? "desc" : request.getParameter("desc");
			String page = request.getParameter("page") == null ? "1" : request.getParameter("page");
			String perPage = request.getParameter("perPage") == null ? "5" : request.getParameter("perPage");
			sqlVO.setKey(key);
			sqlVO.setWord(word);
			sqlVO.setOrder(order);
			sqlVO.setDesc(desc);
			sqlVO.setPage(Integer.parseInt(page));
			sqlVO.setPerPage(Integer.parseInt(perPage));
			out.println(odao.list(sqlVO));
			break;
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		OrderVO vo= new OrderVO();
		vo.setCvs_code(request.getParameter("cvs_code"));
		vo.setProduct_code(Integer.parseInt(request.getParameter("product_code")));
		vo.setCategory_code(request.getParameter("category_code"));
		vo.setOrder_quantity(Integer.parseInt(request.getParameter("order_quantity")));
		OrderDAO dao=new OrderDAO();
		
		switch(request.getServletPath()){
		case "/order/insert":
			int order_id=dao.insert(vo);
			JSONObject jObject=new JSONObject();
			jObject.put("order_id", order_id);
			out.print(jObject);
			HttpSession session=request.getSession();
			session.invalidate();
			break;
		}
		
	}

}
