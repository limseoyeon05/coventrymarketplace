package convetryshop;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);
		String passwd = request.getParameter("password");
		System.out.println(passwd);
		if(id != null) {
			HttpSession session = request.getSession();
			ShopDAO mylogin = new ShopDAO();
			try {
				String result = mylogin.Passwordcheck(id, passwd);
				if(!result.equals("")) {
					session.setAttribute("isLogin", "true");
					session.setAttribute("id", id);
					session.setAttribute("name", result);
					System.out.println("logined");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

}
