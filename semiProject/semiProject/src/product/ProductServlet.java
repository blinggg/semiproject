package product;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import database.SqlVO;

@WebServlet(value = { "/product/list", "/product/read", "/product/update", "/product/insert" })
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		ProductDAO pdao = new ProductDAO();
		String product_code = request.getParameter("product_code");
		switch (request.getServletPath()) {
		case "/product/read":
			ProductVO vo=pdao.read(product_code);
			request.setAttribute("vo", vo);
			RequestDispatcher dis = request.getRequestDispatcher("read.jsp");
			dis.forward(request, response);
			break;
		case "/product/list":
			SqlVO sqlVO = new SqlVO();
			String key = request.getParameter("key") == null ? "product_code" : request.getParameter("key");
			String word = request.getParameter("word") == null ? "" : request.getParameter("word");
			String order = request.getParameter("order") == null ? "product_code" : request.getParameter("order");
			String desc = request.getParameter("desc") == null ? "" : request.getParameter("desc");
			String page = request.getParameter("page") == null ? "1" : request.getParameter("page");
			String perPage = request.getParameter("perPage") == null ? "5" : request.getParameter("perPage");

			sqlVO.setKey(key);
			sqlVO.setWord(word);
			sqlVO.setOrder(order);
			sqlVO.setDesc(desc);
			sqlVO.setPage(Integer.parseInt(page));
			sqlVO.setPerPage(Integer.parseInt(perPage));
			out.println(pdao.list(sqlVO));
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ProductDAO dao = new ProductDAO();

		String uploadPath = "c:" + File.separator + "semi" + File.separator + "product" + File.separator;
		File mdPath = new File(uploadPath);
		if (!mdPath.exists())
			mdPath.mkdir();
		MultipartRequest multi = new MultipartRequest(request, uploadPath, 1024 * 1024 * 10, "UTF-8",
				new DefaultFileRenamePolicy());

		String image = multi.getFilesystemName("image");
		String product_code = multi.getParameter("product_code");

		ProductVO vo = new ProductVO();
		vo.setProduct_code(Integer.parseInt(product_code));
		vo.setProduct_name(multi.getParameter("product_name"));
		vo.setProduct_price(Integer.parseInt(multi.getParameter("product_price")));
		vo.setCompany(multi.getParameter("company"));

		String product_date = multi.getParameter("product_date");
		try {
			java.sql.Date product_date1 = Date.valueOf(product_date);
			vo.setProduct_date(product_date1);
		} catch (Exception e) {
			System.out.println(vo.toString());
		}

		String product_exp = multi.getParameter("product_exp");
		try {
			java.sql.Date product_exp1 = Date.valueOf(product_exp);
			vo.setProduct_exp(product_exp1);
		} catch (Exception e) {
			System.out.println(vo.toString());
		}

		String category_code = multi.getParameter("category_code");
		vo.setCategory_code(category_code);
		String prod_del = multi.getParameter("prod_del");
		if (prod_del == null) {
			vo.setProd_del("0");
		} else {
			vo.setProd_del(multi.getParameter("prod_del"));
		}

		switch (request.getServletPath()) {
		case "/product/insert":
			vo.setImg(image);
			dao.insert(vo);

			response.sendRedirect("list.jsp");
			break;

		case "/product/update":

			ProductVO oldVO = dao.read(product_code);
			if (image != null) {
				if (oldVO.getImg() != null) {
					System.gc();
					File oldImage = new File(uploadPath + oldVO.getImg());
					oldImage.delete();
				}
				vo.setImg(image);
			} else {
				vo.setImg(oldVO.getImg());
			}
			dao.update(vo);

			response.sendRedirect("list.jsp");

			break;
		}

	}

}
