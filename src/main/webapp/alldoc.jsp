<%@ page language="java" import="com.hospital.model.User" import="com.hospital.model.User" import="java.util.*" import="com.hospital.model.Doctor" import="com.hospital.dao.DoctorDao" import="com.hospital.connection.DBCon" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
DoctorDao dd = new DoctorDao(DBCon.getConnection());
List<Doctor> doctors = dd.getAllDoctors();
//ProductDao pd = new ProductDao(DBCon.getConnection());
//List<Product> products = pd.getAllProducts();
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
				<h4>#All Doctor's</h4>
				<div class="cart-items p-4 d-flex flex-wrap ">
					
								<%
								for (Doctor doc : doctors) {
									
									
								%>
								
<div class="card mb-3 m-2" style="max-width: 540px;">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="./assets/<%= doc.getProfile() %>" class="img-fluid rounded-start" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%= doc.getName() %></h5>
                <p class="card-text"><small class="text-body-secondary"><%= doc.getCategory() %></small></p>
        
        <p class="card-text"><%= doc.getDescription() %></p>
        <div class="d-flex">
        <p class="card-text"><small class="text-body-secondary"><%= doc.getContact() %> ,</small></p>
                <p class="card-text"><small class="text-body-secondary"><%= doc.getEmail() %></small></p>
        </div>
        <a class="bg-light border border-2 rounded-0 text-decoration-none p-1" href=appointment.jsp?id=<%=doc.getId() %>>make appointment</a>
      </div>
    </div>
  </div>
</div>


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