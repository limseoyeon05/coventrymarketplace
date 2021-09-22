<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/blog-home.css" rel="stylesheet">
</head>
  <%@ include file="header.jsp" %>  

  <!-- Page Content -->
  <div class="container pt-4">
    <div class="row">
      <div class="col-md-12">
        <h1 class="my-4">Marketplace
          <small>Sign up</small>
        </h1>
        <h5>You must register as a member to place an order in the online store.</h5>
        <div class="card mb-4">
           <div class="card-body">
           	 <form id = "loginfrom" method="get" action="memberwrite" onsubmit="return validate()">
	           	 <div class="form-controll">
				    <label for="exampleInputPassword1">User ID</label>
					    <div class="input-group">
						    <input type="text" class="form-control" id="id" name="id" placeholder="ID must be at least 8 characters long.">
						 	<button type="button" class="btn btn-success" onclick="openidcheck()">ID duplicate check</button>
					 	</div>

				 </div>
				 </br>
	           	 <div class="form-controll">
				    <label for="exampleInputPassword1">Password</label>
				    <input type="password" class="form-control" id="password"  name="password" placeholder="Password must be at least 8 characters long.">
				 </div>	
				 </br>
				 <div class="form-controll">
				    <label for="exampleInputPassword1">Name</label>
				    <input type="text" class="form-control" id="name" placeholder="Your Name" name = "name" >
				 </div>	
				 </br>
				 <div class="form-controll">
				    <label for="exampleInputPassword1">Mail Address</label>
				    <input type="text" class="form-control" id="mail" placeholder="Your mail address" name = "mail" >
				 </div>	
				 </br>				 
				 <div class="form-controll">
					<label for="gender">Gender</label>
					<select class="form-control" name="gender" >
					  <option value="1">Male</option>
					  <option value="2">Female</option>
					</select>
				 </div>
				 </br>	
				 <div class="form-controll">
				    <label for="exampleInputPassword1">Address</label>
				    <textarea class="form-control" name="address"></textarea>
				 </div>	
				 </br>				 	
				<button type="submit" class="btn btn-primary" name="button" value="new" >Save</button>
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
   function validate() { 
		var result = ""
   		var id = document.getElementById("id");
   		if(id.value == ""){
   			alert("Please enter your ID");
       		return false;
       		
   		}
    	var pw = document.getElementById("password");
		if(pw.value == ""){
			alert("Please enter your password");
			return false;
		}
   	}
   function openidcheck() { 
	    var id = document.getElementById("id");
   		if(id.value == ""){
   			alert("member id ?");
       		return false;
   		}
	    var xhr = new XMLHttpRequest();
	    xhr.onreadystatechange = function() {
	        if (xhr.readyState == 4) {
	            var data = xhr.responseText;
	            //alert(data);
	        }
	    }
	    xhr.open('GET', 'idcheck?idcheck='+id.value, true);
	    xhr.send(null);
  	}   
	<% String modal =(String)request.getAttribute("modal");
	   if(modal==null){
			modal="none";
	    }
	   
	%>  
	var modal = document.getElementById('myModal');
	modal.style.display = <%="'"+modal+"'"%>

	window.onclick = function(event){
		if(event.target == modal){
			modal.style.display = "none";
		}
	}
	function modalclose() { 
		   var modal = document.getElementById('myModal');
		   modal.style.display = "none";
		   location.href="index";
	}
	   
   </script>
</body>
</html>