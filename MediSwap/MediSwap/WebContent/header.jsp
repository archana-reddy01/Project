<header>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-gradient-secondary pt-3">

		<h1>
			<a class="navbar-brand text-white" href="index.html">&nbsp;&nbsp; Medi<span>Swap</span></a>
        </h1>
        
		<button class="navbar-toggler ml-md-auto" type="button"
			data-toggle="collapse" data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">

			<ul class="navbar-nav ml-lg-auto text-center">

				<%
					String username = (String) request.getSession().getAttribute("username");

					if (username == null) {
				%>
						<li class="nav-item  mr-3"><a href="index.html" class="nav-link text-white text-capitalize">Home</a></li>
						<li class="nav-item  mr-3"><a href="login.jsp" class="nav-link text-white text-capitalize">Login</a></li>
						<li class="nav-item  mr-3"><a class="nav-link text-white text-capitalize" href="searchmedicine.jsp">Search Medicine</a></li>
				<%
					} else {
				%>
						<li class="nav-item  mr-3"><a href="addmedicine.jsp" class="nav-link text-white text-capitalize">Add Medicine</a></li>
						<li class="nav-item  mr-3"><a href="viewmedicine.jsp" class="nav-link text-white text-capitalize">View Medicine's</a></li>
						<li class="nav-item  mr-3"><a href="logout.jsp" class="nav-link text-white text-capitalize">Logout</a></li>
				<%
					}
				%>

			</ul>
		</div>
	</nav>
</header>