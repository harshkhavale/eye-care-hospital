<%@ page language="java" import="com.hospital.model.User"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

//ProductDao pd = new ProductDao(DBCon.getConnection());
//List<Product> products = pd.getAllProducts();
//ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
//List<Cart> cartProduct = null;
//if (cart_list != null) {

//	request.setAttribute("cart_list", cart_list);

//}
boolean qr = false;
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
		<div
			class="d-flex h-auto pb-4 pt-4  justify-content-center item-center ">
			<div
				class="d-flex align-items-center py-4 bg-body-tertiary p-4 border shadow p-3 bg-body-tertiary rounded">





				<main class="form-signin p-4 ">

					<form action="addappointment" method="post">

						<h2 class=" mb-3 fw-normal">#Make a Appointment</h2>
						<div class="form-floating my-2">
							<input type="hidden" name="doctor"
								value="<%=request.getParameter("id")%>" class="form-control"
								id="floatingInputUserPatient" placeholder="name@example">

							<input type="text" name="patient" class="form-control"
								id="floatingInputUserPatient" placeholder="name@example">
							<label for="floatingInputUserPatient">Patient Name</label>
						</div>
						<div class="form-floating my-2">
							<input type="text" name="address" class="form-control"
								id="floatingInput" placeholder="name@example.com"> <label
								for="floatingInput">Address</label>
						</div>
						<div class="form-floating my-2">
							<input type="date" name="date" class="form-control"
								id="floatingdate" placeholder="date"> <label
								for="floatingdate">Choose Date</label>
						</div>
						<div class="form-floating my-2">
							<input type="time" name="time" class="form-control"
								id="floatingdate" placeholder="time"> <label
								for="floatingdate">Choose time between 10 am - 4 pm</label>
						</div>
						<div class="form-floating my-2">
							<select class="form-control" name="payment">
								<option value="OFFLINE" onSelect=<%=qr = false%>>after
									consultation</option>
								<option value="ONLINE" onSelect=<%=qr = true%>>Now /
									Online</option>


							</select> <label for="floatingdate">Payment Option</label>
						</div>





						<button class="btn btn-primary w-100 py-2 my-4 rounded-4"
							type="submit">secure appointment</button>

					</form>
				</main>

				<div>
					<%
					if (qr) {
					%>
					<p>#Scan the QR CODE below to pay now</p>
					<img alt="foodlogo" src="./assets/qr.png"
						class="card shadow rounded-4" style="height: 400px;" id="qrCode">
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>