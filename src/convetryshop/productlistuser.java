package convetryshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class productlistuser
 */
@WebServlet("/productlistuser")
public class productlistuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		if(search==null) search = "%";		
		String bbstype = request.getParameter("bbs");
		if(bbstype==null) bbstype = "event";
		 
		ShopDAO myproduct = new ShopDAO();
		ArrayList<ProductDTO> list = myproduct.SearchProduct(bbstype, search);
		request.setAttribute("list", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("productlistuser.jsp");
		dispatcher.forward(request, response);
	}

}
