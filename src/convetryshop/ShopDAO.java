package convetryshop;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ShopDAO {
	private final String JDBC_DRIVER="com.mysql.cj.jdbc.Driver";
	private final String DB_URL ="jdbc:mysql://localhost:3306/shop?serverTimezone=UTC";
	private final String USERNAME = "shop";
	private final String PASSWORD = "1234";

	private java.sql.Connection con = null;
	private static java.sql.Statement stmt = null;
	private static ResultSet rs = null;
	private PreparedStatement pstmt;

	public ShopDAO() { 
		try {
			Class.forName(JDBC_DRIVER);
			con = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public boolean InsertMember(String id, String password, String name, String email, 
		    String gender, String address) {
		try {
			
			String sql ="";
			sql ="Insert into t_shopmember values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, password);
			pstmt.setString(4, email);
			pstmt.setString(5, gender);
			pstmt.setString(6, address);
			System.out.println("sql==>"+sql);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
			
			return true;
		
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}		
	}
	public String Passwordcheck(String id, String pw) throws SQLException {
		String SQL= "Select name from t_shopmember where id = '"+id+"' and password='"+pw+"'";

		System.out.println(SQL);
		pstmt=con.prepareStatement(SQL);
		rs = pstmt.executeQuery(SQL);
		String name ="";
		while(rs.next()) {
			name = rs.getString("name");
		}
		if(!name.equals("")) {
			pstmt.close();
			con.close();
			return name;
		}
		pstmt.close();
		con.close();
		return "";
	}	

	public ArrayList<ProductDTO> SearchProductOne(String idx) {
		try {
			String sql ="";
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			sql = "select idx,title,contents,filename,writedate,price from t_product where idx = '"+idx+"'";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				ProductDTO sd = new ProductDTO();
				sd.setIdx(rs.getString(1));
				sd.setTitle(rs.getString(2));
				sd.setContents(rs.getString(3));
				sd.setFilename(rs.getString(4));
				sd.setWritedate(rs.getString(5));
				sd.setPrice(rs.getString(6));
				list.add(sd);
			}

			pstmt.close();
			con.close();
			
			return list;
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}		
	}

	public boolean InsertProduct(String bbstype, String id, String title, String contents,
			String filename, String writedate, String price) {
		try {
			String sql ="";
			String idx = "";
			
			sql = "select max(cast(idx as unsigned))+1 as cnt from t_product";
			pstmt=con.prepareStatement(sql);
			rs =pstmt.executeQuery(sql);
			while(rs.next()) {
				idx = rs.getString("cnt");
			}
			System.out.println("Max value"+idx);
			if(idx==null) idx ="1";
			sql ="Insert into t_product values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.setString(2, bbstype);
			pstmt.setString(3, title);
			pstmt.setString(4, contents);
			pstmt.setString(5, price);
			pstmt.setString(6, filename);
			pstmt.setString(7, writedate);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
			
			return true;
			
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}		
	}	
	public boolean DeleteProduct(String idx) {
		try {

			String sql ="";
			sql ="delete from t_product where bbstype = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, idx);
			System.out.println("sql==>"+sql);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
			
			return true;
			
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}			
	}
	
	public ArrayList<ProductDTO> SearchProduct(String bbstype, String title) {
		try {
			String sql ="";
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			System.out.println("DATA1");
			
			System.out.println("DATA="+bbstype+title);
			
			sql = "select idx,title,contents,filename,writedate,price from t_product where title like '%"+title+"' order by idx desc";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				ProductDTO sd = new ProductDTO();
				sd.setIdx(rs.getString(1));
				sd.setTitle(rs.getString(2));
				sd.setContents(rs.getString(3));
				sd.setFilename(rs.getString(4));
				sd.setWritedate(rs.getString(5));
				sd.setPrice(rs.getString(6));
				list.add(sd);
			}

			pstmt.close();
			con.close();
			
			return list;
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}		
	}	

	public boolean ProductOrder(String orderid, String userid, String price, String qty, 
		    String writedate, String address) {
		try {
			
			String sql ="";
			sql ="Insert into t_order(productidx,price,qty, develiyaddress,userid, writedate) values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, orderid);
			pstmt.setString(2, price);
			pstmt.setString(3, qty);
			pstmt.setString(4, address);
			pstmt.setString(5, userid);
			pstmt.setString(6, writedate);
			System.out.println("sql==>"+sql);
			pstmt.executeUpdate();

			pstmt.close();
			con.close();
			
			return true;
		
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}		
	}

	public ArrayList<OrderDTO> MyProduct(String useid, String option) {
		try {
			String sql ="";
			ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
			if(option.equals("admin"))
				sql = "select a.id,a.name,c.orderno,b.title,c.price,c.qty,c.writedate,c.develiyaddress  from t_shopmember a, t_product b, t_order c where a.id = c.userid and c.productidx = b.idx";
			else
				sql = "select a.id,a.name,c.orderno,b.title,c.price,c.qty,c.writedate,c.develiyaddress  from t_shopmember a, t_product b, t_order c where a.id = c.userid and c.productidx = b.idx and c.userid = '"+useid+"'";
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				OrderDTO sd = new OrderDTO();
				sd.setId(rs.getString(1));
				sd.setName(rs.getString(2));
				sd.setOrderno(rs.getString(3));
				sd.setTitle(rs.getString(4));
				sd.setPrice(rs.getString(5));
				sd.setQty(rs.getString(6));
				sd.setWritedate(rs.getString(7));
				sd.setDeveliyaddress(rs.getString(8));
				list.add(sd);
			}

			pstmt.close();
			con.close();
			
			return list;
			
		}catch(SQLException e) {
			e.printStackTrace();
			return null;
		}		
	}	
}
