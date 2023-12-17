<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Happy+Monkey&display=swap" rel="stylesheet">
<div>

	<nav class="navbar navbar-expand-lg bg-body-tertiary shadow-sm sticky-top"
		style="font-family: 'Poppins', sans-serif;
">
		<div class="container-fluid d-flex justify-content-between">
		<div>
			<div class="d-flex justify-center item-center align-items-center mx-4 text-primary" style="	font-family: 'Happy Monkey', sans-serif;
			">
				<h3>Eye Care H</h3>
				<img alt="foodlogo" src="./assets/eyelogo.png" class=""
					style="height: 25px;padding-bottom:5px">
				<h3 class=" " href="#">spital</h3>
			</div>


			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
					</div>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item mx-2"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
						<li class="nav-item mx-2"><a class="nav-link active"
						aria-current="page" href="#section1">About</a></li>
						<li class="nav-item mx-2"><a class="nav-link active"
						aria-current="page" href="#section2">Contact</a></li>
					
</ul><ul class="navbar-nav mb-2 mb-lg-0">
					<%
					if (auth != null) {
					%>
					<li class="nav-item mx-2"><a class="nav-link" href="schedule.jsp"><img
							alt="search" src="./assets/schedule.png" style="height: 25px"><span class="badge text-bg-danger">${cart_list.size() }</span></a></li>
					<li class="nav-item mx-2"><a class="nav-link" href="alldoc.jsp"><img
							alt="search" src="./assets/doctor.png" style="height: 25px"></a></li>
					<li class="nav-item  bg-light border border-2"><a
						class="nav-link " href="logout">Log-out</a></li>
					<%
					} else {
					%>
					<li class="nav-item  bg-light border border-2"><a
						class="nav-link " href="registration.jsp">Registration</a></li>
					<%
					}
					%>





				</ul>
				
			</div>
		</div>
	</nav>
</div>
