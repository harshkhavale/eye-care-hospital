<%@ page language="java" import="com.hospital.model.User"
	import="java.util.*" import="com.hospital.model.Doctor"
	import="com.hospital.dao.DoctorDao"
	import="com.hospital.connection.DBCon" import="com.hospital.model.User"
	import="com.hospital.model.Schedules" import="java.util.*"
	import="com.hospital.dao.AppointmentDao"
	import="com.hospital.connection.DBCon"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
AppointmentDao ad = null;
List<Schedules> allschedules = null;
if (auth != null) {
	request.setAttribute("auth", auth);
	ad = new AppointmentDao(DBCon.getConnection());
	allschedules = ad.getAllAppointments();
} else {
	response.sendRedirect("login.jsp");

}

//ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
//List<Cart> cartProduct = null;
//if (cart_list != null) {

//	request.setAttribute("cart_list", cart_list);

//}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eye Care Hospital - ADMIN</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Happy+Monkey&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Poppins', sans-serif;
}
</style>
</head>
<body>
	<div>

		<nav
			class="navbar navbar-expand-lg bg-body-tertiary shadow-sm sticky-top"
			style="font-family: 'Poppins', sans-serif;">
			<div class="container-fluid d-flex justify-content-between">
				<div>
					<div
						class="d-flex justify-center item-center align-items-center mx-4 text-primary"
						style="font-family: 'Happy Monkey', sans-serif;">
						<h3>Eye Care H</h3>
						<img alt="foodlogo" src="./assets/eyelogo.png" class=""
							style="height: 25px; padding-bottom: 5px">
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

					<ul class="navbar-nav mb-2 mb-lg-0">
						<%
						if (auth != null) {
						%>

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
	<div class="row">
		<div class="col-2 vh-100 shadow">
			<ul class="navbar-nav mb-2 mb-lg-0 py-4">
				<li class="nav-item mx-2 border border-2 btn  "><a
					class="nav-link mx-2 d-flex  gap-4" href="admin.jsp"><img
						alt="search" src="./assets/schedule.png" style="height: 25px">
						<p>All Schedules</p></a></li>
				<li class="nav-item mx-2 border border-2 btn"><a
					class="nav-link mx-2 d-flex  gap-4" href="adddoc.jsp"><img
						alt="search" src="./assets/doctor.png" style="height: 25px">
						<p>Add Doctors</p></a></li>

			</ul>
		</div>
		<div class="col-10 d-flex">

			<div class="order-page p-4 border rounded-4 w-100">
				<h4>#Your Appointment's</h4>
				<div class="cart-items p-4 ">
					<table class="table ">
						<thead>
							<tr>
								<th scope="col">Profile</th>

								<th scope="col">Dr.Name</th>
								<th scope="col">Patient Name</th>

								<th scope="col">Category</th>


								<th scope="col">Payment</th>
								<th scope="col">Date</th>
								<th scope="col">Time</th>

								<th scope="col">Delete</th>


							</tr>
						</thead>
						<tbody>
							<tr class="">
								<%
								for (Schedules schedule : allschedules) {
								%>
								<td style="width: 35px; height: 20px" class=""><img
									class="rounded-pill p-1 border border-4 w-100  d-inline-block"
									src="./assets/<%=schedule.getProfile()%>" /></td>

								<td><%=schedule.getDoctorName()%></td>
								<td><%=schedule.getPatientName()%></td>

								<td><%=schedule.getCategory()%></td>
								<td><%=schedule.getPayment()%></td>
								<td><%=schedule.getDate()%></td>
								<td><%=schedule.getTime()%></td>

								<td><a
									href="cancle-order?id=<%=schedule.getAppointmentId()%>"
									class="btn btn-sm btn-danger">delete</a></td>



							</tr>
							<%
							}
							%>

						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>
</body>
</html>