<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="convetryshop.ProductDTO"%>
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
        <h5>Search all products in the shopping mall.</h5>
	    <div class="row">
	      <div class="col-md-8">
	      </div>
	      <div class="col-md-4 mb-3">
	       	 <form action="productlistuser?bbstype=event" method="get">
	         <div class="input-group">
					<label>Title : </label>
					<input type="text" class="form-control ml-2" name = "search" >
					<button type="submit" class="btn btn-primary ml-2">Search</button>
			 </div>
			 </form>
		   </div>
		 </div>
		 <% ArrayList<ProductDTO> list = (ArrayList)request.getAttribute("list");   
		
		 %>
		  <table class="table table-striped">
		    <thead>
		      <tr>
		        <th>No</th>
		        <th>Event</th>
		        <th>Image</th>
		        <th>Description</th>
		        <th>Event Date</th>
		      </tr>
		    </thead>
		    <tbody>
		      <%
		      for(int i=0;i<list.size();i++){
		    	  
		      %>
		      <tr>
		        <th><%=i+1%></th>
		        <th><a href="ProductOrder?idx=<%=list.get(i).getIdx()%>&view=modify" data-toggle="tooltip" title=""><%=list.get(i).getTitle() %></a></th>
		        <th><a href="ProductOrder?idx=<%=list.get(i).getIdx()%>&view=modify" data-toggle="tooltip" title=""><img class="img-rounded" width="200" height="150" src="<%=list.get(i).getFilename() %>"></a></th>
		        <th><%=list.get(i).getContents() %></th>
		        <th><%=list.get(i).getWritedate() %></th>
		      </tr>
		      <% } %>
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
  <script>
	$(document).ready(function(){
	  $('[data-toggle="tooltip"]').tooltip();   
	});
</script>
</body>
</html>