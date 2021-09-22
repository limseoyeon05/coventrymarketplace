package convetryshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class ProductOrder
 */
@WebServlet("/ProductOrder")
public class ProductOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Search
		String idx = request.getParameter("idx");
		if(idx==null) idx = "";
		String view = request.getParameter("view");
		if(view==null) view = "event";	
		String bbstype = request.getParameter("bbs");
		if(bbstype==null) bbstype = "product";	
		
		System.out.println("GET CALL"+idx+view);
		String title = ""; 
		String name = "";		
		String contents = "" ;				
		String filename = "";	
		String price = "";
		String writedate = "";

		if(view.equals("modify")) {
			System.out.println("Search one");
			ShopDAO mybbs = new ShopDAO();
			ArrayList<ProductDTO> list = mybbs.SearchProductOne(idx);
			title = list.get(0).getTitle();
			if(title==null) title="";
			name = list.get(0).getId();
			if(name==null) name="";		
			contents = list.get(0).getContents();
			if(contents==null) contents="";				
			filename = list.get(0).getFilename();
			if(filename==null) filename="";				
			writedate = list.get(0).getWritedate();
			if(writedate==null) writedate="";	
			price = list.get(0).getPrice();
		}
		request.setAttribute("idx", idx);
		request.setAttribute("title", title);
		request.setAttribute("name", name);
		request.setAttribute("contents", contents);
		request.setAttribute("filename", filename);
		request.setAttribute("price", price);
		request.setAttribute("writedate", writedate);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("productorder.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Order 
		String idx = request.getParameter("idx");
		if(idx==null) idx = "";
		String price = request.getParameter("price");
		if(price==null) price = "";	
		String qty = request.getParameter("qty");
		if(qty==null) qty = "";	
		String writedate = request.getParameter("writedate");
		if(writedate==null) writedate = "";
		String address = request.getParameter("address");
		if(address==null) address = "";	
		
		HttpSession  session = request.getSession();
		String userid = (String)session.getAttribute("id");
		
		// Order Information 
		System.out.println("productidx: "+idx);
		System.out.println("userid: "+userid);
		System.out.println("price: "+price);
		System.out.println("qty"+qty);
		System.out.println("writedate"+writedate);
		System.out.println("address"+address);
		ShopDAO order = new ShopDAO();
		order.ProductOrder(idx,userid,price,qty,writedate,address);
		request.setAttribute("modal", "block");
		request.setAttribute("modalbody","Your order has been completed.");
		RequestDispatcher dispatcher = request.getRequestDispatcher("productorder.jsp");
		dispatcher.forward(request, response);
	}


}
