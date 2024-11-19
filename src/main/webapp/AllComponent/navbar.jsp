<div class="container-fluid p-3">
<div class="row">
	<div class="col-md-3 text-success">
		<h3>E-BOOK</h3>
	</div>
	<div class="col-md-6">
		<form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    	</form>
	</div>
	<div class="col-md-3">
		<%
			if(session.getAttribute("ob")!=null){
		%>
				<a href="cart.jsp?id=${ob.email}"><i class="fa-solid fa-cart-shopping fa-2x"></i></a>
				<a href="login.jsp" class="btn btn-success">${ob.name}</a>
				<a href="logout.jsp" class="btn btn-success">Log out</a>
		<%	
			}
			else{
		%>
			<a href="login.jsp" class="btn btn-success">Log In</a>
			<a href="register.jsp" class="btn btn-primary">Register</a>
		<%
			}
		%>
		
		
	</div>
</div>
</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="all_recent_book.jsp"><i class="fa fa-book" aria-hidden="true"></i>Recent book</a>
      </li>
   
      <li class="nav-item">
        <a class="nav-link active" href="all_new_book.jsp"><i class="fa fa-book" aria-hidden="true"></i>New Book</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link active" href="#"><i class="fa fa-book" aria-hidden="true"></i>Old Book</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0 gap20">
            <button class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa fa-cog" aria-hidden="true"></i>Settings</button>
            <button class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-address-book"></i>Contact Us</button>
    </form>
  </div>
</nav>