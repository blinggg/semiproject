package cart;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import order.OrderVO;

@WebServlet(value = { "/cart/insert", "/cart/delete", "/cart/update" })
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		switch (request.getServletPath()) {
		case "/cart/insert":
			String category_code = request.getParameter("category_code");
			String category_name = request.getParameter("category_name");
			String product_name = request.getParameter("product_name");
			String sproduct_code = request.getParameter("product_code");
			String sproduct_price = request.getParameter("product_price");
			String company = request.getParameter("company");
			int product_code = Integer.parseInt(sproduct_code);
			int product_price = Integer.parseInt(sproduct_price);
			CartVO cvo = new CartVO();
			cvo.setCategory_code(category_code);
			cvo.setProduct_code(product_code);
			cvo.setProduct_name(product_name);
			cvo.setProduct_price(product_price);
			cvo.setCategory_name(category_name);
			cvo.setCompany(company);
			cvo.setOrder_quantity(1);

			HttpSession session = request.getSession();
			ArrayList<CartVO> listCart = (ArrayList<CartVO>) session.getAttribute("listCart");

			boolean find = false;
			if (listCart == null) {
				listCart = new ArrayList<CartVO>();
			} else {
				for (CartVO v : listCart) {
					if (v.getProduct_code() == product_code && v.getCategory_code().equals(category_code)) {
						v.setOrder_quantity(v.getOrder_quantity() + 1);
						find = true;
					}
				}
			}
			if (find == false) {
				listCart.add(cvo);
			}
			session.setAttribute("listCart", listCart);
			break;
		case "/cart/update":
			session=request.getSession();
			listCart=(ArrayList<CartVO>) session.getAttribute("listCart");
			product_code=Integer.parseInt(request.getParameter("product_code"));
			category_code=request.getParameter("category_code");
			int quantity=Integer.parseInt(request.getParameter("order_quantity"));
			find=false;
			for(CartVO v:listCart) {
				if(v.getProduct_code() == product_code && v.getCategory_code().equals(category_code)) {
					v.setOrder_quantity(quantity);
				find=true;
				}
			}
			break;
		case "/cart/delete":
			session=request.getSession();
			listCart=(ArrayList<CartVO>) session.getAttribute("listCart");
			product_code=Integer.parseInt(request.getParameter("product_code"));
			category_code=request.getParameter("category_code");
		
			for(CartVO v:listCart) {
				if(v.getProduct_code() == product_code && v.getCategory_code().equals(category_code)) {
				listCart.remove(v);
				break;
				}
			};
			break;
		}
	}

}
