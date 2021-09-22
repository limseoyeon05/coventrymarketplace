<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
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
          <small>write</small>
        </h1>
        <h5>Register product information</h5>
        <%
        String idx =(String)request.getAttribute("idx");
		if(idx==null) idx="";
		String title =(String)request.getAttribute("title");
		String name =(String)request.getAttribute("name");
		String contents =(String)request.getAttribute("contents");			
		String filename = (String)request.getAttribute("filename");			
		String writedate =(String)request.getAttribute("writedate"); 
		String price =(String)request.getAttribute("price"); 
        %>
        <div class="card mb-4">
           <div class="card-body">
           	 <form  method="post" action="ProductWrite" enctype="multipart/form-data">
	           	 <div class="form-controll">
	           	 	<% if(!filename.equals("")){ 
				    %>
				    	<img class="img-rounded" width="500" height="436" src="<%=filename%>">
				    	</br>
				    <% } %>
				    <label for="exampleInputPassword1">Product Name</label>
					    <div class="input-group">
						    <input type="text" class="form-control" id="title" name="title" placeholder="" value=<%=title%>>
						    <input type="hidden" class="form-control" name="bbs" value="event">
						    <input type="hidden" class="form-control" name="idx" value=<%=idx%>>
					 	</div>
				 </div>
				 </br>
				 <div class="form-controll">
				    <label for="exampleInputPassword1">Name</label>
				    <input type="text" class="form-control" id="name" placeholder="" name = "name" value=<%=name%>>
				 </div>	
				 </br>
				 <div class="form-controll">
				    <label for="exampleInputPassword1">Description</label>
				    <textarea class="md-textarea form-control" rows="8" name="contents"><%=contents%></textarea>
				 </div>	
				 <div class="form-controll">
				    <label for="exampleInputPassword1">Price(SGD)</label>
				    <input type="text" class="form-control"  name="price" value=<%=price%>>
				 </div>					 
				 </br>	
				 <div class="form-controll">
				    <label for="exampleInputPassword1">Product Image</label>	
				    <input type="file" class="form-control" id="filename" placeholder="" name="filename">
				    
				 </div>	
				 </br>	
				 <div class="form-controll">
				    <label for="exampleInputPassword1">Write Date</label>
				    <input type="date" class="form-control" id="writedate" placeholder="" name = "writedate" value=<%=writedate%>>
				 </div>	
				 </br>				 				 			 	
				<button type="submit" class="btn btn-primary" name="button" value="new" >Save</button>
				<% if(!idx.equals("")){ %>
					<button type="submit" class="btn btn-primary" name="button" value="delete" >Delete</button>
				<% } %>
				<a href="index"><button type="button" class="btn btn-danger" name="button" >Home</button></a>
			 </form>
           </div>
        </div>
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
  document.getElementById('writedate').value = new Date().toISOString().substring(0, 10);
   function validate() { 
		var result = ""
   		var id = document.getElementById("title");
   		if(id.value == ""){
   			alert("Please enter your title");
       		return false;
       		
   		}
    	var pw = document.getElementById("contents");
		if(pw.value == ""){
			return false;
		}
   	}
	<% String modal =(String)request.getAttribute("modal");
	   if(modal==null){
			modal="none";
	    }
	   String modalbody =(String)request.getAttribute("modalbody");
	   if(modalbody==null){
		   modalbody="Congratulations. You are now a member";
	    }	   
	%>  
	var modal = document.getElementById('myModal');
	//var modalbody = document.getElementById('messagebody');
	modal.style.display = <%="'"+modal+"'"%>
	//modalbody.innerHTML = modalbody;
	
	window.onclick = function(event){
		if(event.target == modal){
			modal.style.display = "none";
		}
	}
	function modalclose() { 
		   var modal = document.getElementById('myModal');
		   modal.style.display = "none";
		   location.href="productlist";
	}
	   
   </script>
</body>
</html>