package convetryshop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class memberwrite
 */
@WebServlet("/memberwrite")
public class memberwrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id==null) id="";
		String name = request.getParameter("name");
		if(name==null) name="";	
		String password = request.getParameter("password");
		if(password==null) password="";			
		String gender = request.getParameter("gender");
		if(gender==null) gender="";			
		String email = request.getParameter("mail");
		if(email==null) email="";	
		String address = request.getParameter("address");
		if(address==null) address="";	
		 
		// Insert new member
		if(!id.equals("") && !password.equals("")) {
			ShopDAO mymember = new ShopDAO();
			mymember.InsertMember(id, password, name, email, gender, address);
		
			request.setAttribute("modal", "block");
			request.setAttribute("modalbody","Congratulations. You are now a member. Go to the login page");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("memberwrite.jsp");
		dispatcher.forward(request, response);
		
	}


}
