<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="convetryshop.OrderDTO"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Coventry Marketplace</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">

</head>
  <%@ include file="header.jsp" %>  

  <!-- Page Content -->
  <div class="container pt-4">
    <div class="row">
      <div class="col-md-12">
        <h1 class="my-4">Product
          <small>list(User)</small>
        </h1>
        <h5>View product order history.</h5>
	    <div class="row">
	      <div class="col-md-8">
	      </div>
	      <div class="col-md-4 mb-3">
		   </div>
		 </div>
		 <% ArrayList<OrderDTO> list = (ArrayList)request.getAttribute("list");   
		    if(list!=null) {
		 %>
		  <table class="table table-striped">
		    <thead>
		      <tr>
		        <th>No</th>
		        <th>UserID</th>
		        <th>Name</th>
		        <th>Order No</th>
		        <th>Product Name</th>
		        <th>Price</th>
		        <th>Quantity</th>
		        <th>Order Date</th>
		        <th>Delivery Address</th>
		      </tr>
		    </thead>
		    <tbody>
		      <%
		      for(int i=0;i<list.size();i++){
		    	  
		      %>
		      <tr>
		        <th><%=i+1%></th>
		        <th><%=list.get(i).getId() %></th>
		        <th><%=list.get(i).getName() %></th>
		        <th><%=list.get(i).getOrderno() %></th>
		        <th><%=list.get(i).getTitle() %></th>
		        <th><%=list.get(i).getPrice() %></th>
		        <th><%=list.get(i).getQty() %></th>
		        <th><%=list.get(i).getWritedate() %></th>
		        <th><%=list.get(i).getDeveliyaddress() %></th>
		      </tr>
		      <% } 
		    } 
		     %>
		    </tbody>
		  </table>		 
       </div>
    </div>
  </div>
  <!-- Footer -->
 <%@ include file="footer.jsp" %>  
 <%@ include file="modal.jsp" %> 
 <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>