<%@ page language="java" import="com.hospital.model.User"
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
	allschedules = ad.getUserAppointments(auth.getId());
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
<title>Eye Care Hospital</title>
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
	<%@include file="includes/navbar.jsp"%>
	<div>
		<div class="order-page p-4 border rounded-4">
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
</body>
</html>