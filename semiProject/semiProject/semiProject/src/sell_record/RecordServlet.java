package sell_record;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

/**
 * Servlet implementation class RecordServlet
 */
@WebServlet(value={"/record/topTen"})
public class RecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); //한글깨짐 방지
		PrintWriter out=response.getWriter(); //브라우저에 출력하기 위한 객체
		RecordDAO rdao=new RecordDAO();
		
		switch(request.getServletPath()) {
		
		case "/record/topTen" :
			
			String strMonth=request.getParameter("selMonth");
			int month=Integer.parseInt(strMonth);
			out.println(rdao.list(month));
			break;
		
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
