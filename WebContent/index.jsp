<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="kor">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Coventry Marketplace</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/blog-home.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

  <%@ include file="header.jsp" %>  
  <div class="container">
    <div class="row mt-3">
    	<div class="col-7">
	        <h3 class="my-3 mt-2">Coventry Shopping Mall
	          <small>delivery Service</small>
	        </h3>
        </div>
    	<div class="col-5">
        <%
			session = request.getSession();
		    String myid = (String)session.getAttribute("id"); 
		    String name = (String)session.getAttribute("name"); 
		    System.out.println(name);
			if(myid==null){	
		%>
			<form action="login" method="post">
				<div class="input-group mb-1 my-3 mt-4">
				  <input type="text" class="form-control" name="id" placeholder="User ID" aria-label="Recipient's username" aria-describedby="basic-addon2">
				  <input type="password" class="form-control ml-2" name="password" placeholder="password" aria-label="Recipient's username" aria-describedby="basic-addon2">
				  <button type="submit" class="btn btn-primary ml-2">Login</button>
				</div>
			</form>
		<% } else { %>
			 <form action="logout" method="get">
				<div class="input-group mb-1 my-3 mt-4">
				  <label for="exampleInputEmail1">Login name: <%=name%></label> 
				  <button type="submit" class="btn btn-danger ml-3">Logout</button>
				</div>	
			 </form>	
		<% } %>
        </div>        
    </div>
  </div>  
  <div class="container">
    <div class="row">
    	<div class="col-12">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
			  <!-- Indicators -->
			  <ul class="carousel-indicators">
			    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			    <li data-target="#myCarousel" data-slide-to="1"></li>
			    <li data-target="#myCarousel" data-slide-to="2"></li>
			  </ul>
			  
			  <!-- The slideshow -->
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="images/event1.jpg" alt="Los Angeles" width="1100" height="500">
			    </div>
			    <div class="carousel-item">
			      <img src="images/event2.jpg" alt="Chicago" width="1100" height="500">
			    </div>
			    <div class="carousel-item">
			      <img src="images/event3.jpg" alt="New York" width="1100" height="500">
			    </div>
			  </div>
			  
			  <!-- Left and right controls -->
			  <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#myCarousel" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
			</div>
		</div>
    </div>
  </div>
    <div class="container">
      <div class="row">
        <div class="col-3">
          <p></p>
          <div class="card">
            <div class="card-header">
              RUSTIC TOWN
            </div>
            <img src="images/card1.jpg" alt="" />
            <div class="card-body">
              <h5 class="card-title">RUSTIC TOWN</h5>
              <p class="card-text">Zipper Pen Pouch for School, Work and Office</p>
              <a href="#" class="btn btn-primary">Order</a>
            </div>
          </div>
        </div>
        <div class="col-3">
          <p></p>
          <div class="card">
            <div class="card-header">
              eufy BoostIQ
            </div>
            <img src="images/card2.jpg" alt="" />
            <div class="card-body">
              <h5 class="card-title">eufy</h5>
              <p class="card-text">eufy BoostIQ RoboVac 15C MAX,Wi-Fi Connection...</p>
              <a href="#" class="btn btn-primary">Order</a>
            </div>
          </div>
        </div>
        <div class="col-3">
          <p></p>
          <div class="card">
            <div class="card-header">
              Women's Cotton Stretch
            </div>
            <img src="images/card3.jpg" alt="" />
            <div class="card-body">
              <h5 class="card-title">Cotton Stretch</h5>
              <p class="card-text">Women's Cotton Stretch</p>
              <a href="#" class="btn btn-primary">Order</a>
            </div>
          </div>
        </div>
        <div class="col-3">
          <p></p>
          <div class="card">
            <div class="card-header">
              Mask
            </div>
            <img src="images/card4.jpg" alt="" />
            <div class="card-body">
              <h5 class="card-title">Mask</h5>
              <p class="card-text">Individually wrapped,.....</p>
              <a href="#" class="btn btn-primary">Order</a>
            </div>
          </div>
        </div>                
      </div>

  </div>      

  <%@ include file="footer.jsp" %> 
  <%@ include file="modal.jsp" %>
 
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
