      <!-- Sidebar Widgets Column -->
      <div class="col-md-3">
        <h1 class="my-4 mt-2">
          <small>Membership</small>
        </h1>
        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header">Login</h5>
        <%
			session = request.getSession();
		    String myid = (String)session.getAttribute("id"); 
		    String avata = (String)session.getAttribute("avata"); 
		    String name = (String)session.getAttribute("name"); 
		    String score = (String)session.getAttribute("score");
		    System.out.println(avata+name+score);
			if(myid==null){	
		%>
			<form method="post" action="login" onsubmit="return logincheck()">
			  <div class="form-group ml-2 mr-2">
			    <label for="exampleInputEmail1">Login id</label>
			    <input type="text" class="form-control " id="id" name="id" aria-describedby="emailHelp" >
			    <small id="emailHelp" class="form-text text-muted">Register and use as a member</small>
			  </div>
			  <div class="form-group  ml-2 mr-2">
			    <label for="exampleInputPassword1">Password</label>
			    <input type="password" class="form-control" id="password" name="password">
			  </div>
			  <button type="submit" class="btn btn-primary ml-2 mb-1">login</button>
			</form>
		<% } else { 
		%>
			<form method="get" action="logout" onsubmit="return logincheck()">
			  <div class="form-group ml-2 mr-2">
			    <img class="img-responsive w-100"" style="height:150px" src="images/<%=avata%>">
			    <label for="exampleInputEmail1">Login id: <%=name+", Game score: <b>"+score+"</b>" %></label>
			    <small id="emailHelp" class="form-text text-muted">Welcome to the SCS website.</small>
			  </div>
			  <button type="submit" class="btn btn-primary ml-2 mb-1">Logout</button>
			</form>		
		<% } %>
        </div>

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">Categories</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="member">Sing up</a>
                  </li>
                  <li>
                    <a href="noticelist">Notice</a>
                  </li>
                  <li>
                    <a href="https://www.facebook.com/SCSPSB">SCS Facebook</a>
                  </li>
                </ul>
              </div>
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                  <li>
                    <a href="https://www.psb.edu.sg/">PSB</a>
                  </li>
                  <li>
                    <a data-toggle="modal" data-target="#about">About</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        		<div class="sns">
					<h3>Facebook</h3>
					<div class="snsinner">
						<div id="fb-root"></div>
						<script>(function(d, s, id) {
						  var js, fjs = d.getElementsByTagName(s)[0];
						  if (d.getElementById(id)) return;
						  js = d.createElement(s); js.id = id;
						  js.src = "http://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.5";
						  fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));</script>
						<div class="fb-page" data-href="https://www.facebook.com/SCSPSB/" data-tabs="timeline" data-width="300" data-height="1600" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/ezielts9/"><a href="https://www.facebook.com/ezielts9/">Singapore_a</a></blockquote></div></div>

					</div>
				</div>        
      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
