package convetryshop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class myorderlist
 */
@WebServlet("/myorderlist")
public class myorderlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession  session = request.getSession();
		String userid = (String)session.getAttribute("id");
		if(userid==null) {
		       PrintWriter out = response.getWriter();
		       out.print("<script>");
		       out.print("alert('You must login!!!');");
		       out.print("location.href = 'index'");
		       out.print("</script>");			
		}
		else {
			String option = request.getParameter("option");
			if(option==null) option="";
			
			ShopDAO myproduct = new ShopDAO();
			ArrayList<OrderDTO> list = myproduct.MyProduct(userid,option);
			request.setAttribute("list", list);
	
			RequestDispatcher dispatcher = request.getRequestDispatcher("myorderlist.jsp");
			dispatcher.forward(request, response);
		}
	}
}
