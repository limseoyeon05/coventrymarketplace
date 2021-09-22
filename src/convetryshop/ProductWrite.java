package convetryshop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


/**
 * Servlet implementation class ProductWrite
 */
@WebServlet("/ProductWrite")
@MultipartConfig
public class ProductWrite extends HttpServlet {
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
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("productwrite.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String realpath =request.getSession().getServletContext().getRealPath("/");
		System.out.println(realpath);
		String bbstype = request.getParameter("bbs");
		if(bbstype==null) bbstype = "event";
		String title = request.getParameter("title");
		if(title==null) title = "";
		String name = request.getParameter("name");
		if(name==null) name = "";
		String contents = request.getParameter("contents");
		if(contents==null) contents = "";
		String writedate = request.getParameter("writedate");
		if(writedate==null) writedate = "";
		String price = request.getParameter("price");
		if(price==null) price = "0";
		String filename="";

		
		// Delete
		String idx = request.getParameter("idx");
		if(idx==null) idx = "";
		String button = request.getParameter("button");
		if(button==null) button = "";
		if(button.equals("delete")) {
			System.out.println("delete: " + idx);
			ShopDAO mybbs = new ShopDAO();
			boolean result = mybbs.DeleteProduct(idx);
			request.setAttribute("modal", "block");
			if(result==true)
				request.setAttribute("modalbody","The product has been successfully deleted. Go to the main page.");
			else
				request.setAttribute("modalbody","Error. Go to the main page.");

		}
		else {
			if(bbstype.equals("event")){
				// File upload function
				Part part = request.getPart("filename");
				if(part!=null) {
					String filepath="";
					if(!part.equals("")) filepath =fileupload(part, realpath);
					filename = part.getSubmittedFileName();
				}
				// insert data
				ShopDAO myproduct = new ShopDAO();
				myproduct.InsertProduct(bbstype, name, title, contents, filename, writedate,price);
				request.setAttribute("modal", "block");
				request.setAttribute("modalbody","The event has been successfully saved. Go to the main page.");
			}
		}
		request.setAttribute("idx", idx);		
		request.setAttribute("title", title);
		request.setAttribute("name", name);
		request.setAttribute("contents", contents);
		request.setAttribute("filename", filename);
		request.setAttribute("writedate", writedate);
		request.setAttribute("price", price);
		RequestDispatcher dispatcher = request.getRequestDispatcher("productwrite.jsp");
		dispatcher.forward(request, response);
	}
	String fileupload(Part filename, String realpath) {
		
        //String dir ="c://upload//";
		String dir = realpath+"\\";
        Part part = filename; 
        String filepath="";
        try {
			part.write(dir+part.getSubmittedFileName());
		} catch (IOException e) {
			e.printStackTrace();
		}
        filepath = dir+part.getSubmittedFileName();
        System.out.println(dir+part.getSubmittedFileName());
        System.out.println(part.getName());
        return filepath;
	}

}
