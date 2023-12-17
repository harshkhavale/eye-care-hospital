<%@ page language="java" import="com.hospital.model.User" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<div class="h-25" style="object-fit: 'contain'; height: '5px'">
		<div id="carouselExample" class="carousel slide">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="./assets/bg3.jpg" class="d-block w-100"
						style="height: 30rem; object-fit: cover;" alt="...">
				</div>

				<div class="carousel-item ">
					<img src="./assets/bg2.jpg" class="d-block w-100"
						style="height: 30rem; object-fit: cover;" alt="...">
				</div>
				<div class="carousel-item ">
					<img src="./assets/bg1.jpg" class="d-block w-100"
						style="height: 30rem; object-fit: cover;" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExample" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExample" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div id="section1" class="card p-4">

		<h1># Welcome to Hospital Eye Care</h1>

		At [Hospital Name] Eye Care, we are committed to providing exceptional
		eye care services with a focus on precision, compassion, and the
		latest advancements in ophthalmology. Your vision is our priority, and
		our dedicated team of eye care professionals is here to ensure the
		health and well-being of your eyes. ## Our Services ### Comprehensive
		Eye Examinations Regular eye check-ups are essential for maintaining
		good vision and preventing eye diseases. Our experienced optometrists
		conduct thorough examinations to assess your visual acuity and overall
		eye health. We use state-of-the-art diagnostic equipment to provide
		accurate and reliable results. ### Cataract Surgery If you are
		experiencing clouded vision due to cataracts, our skilled
		ophthalmologists specialize in advanced cataract surgery. We use
		cutting-edge techniques and premium intraocular lenses to restore
		clarity to your vision, allowing you to see the world more clearly.

		### LASIK and Refractive Surgery Explore the freedom from glasses and
		contact lenses with our LASIK and refractive surgery options. Our
		expert surgeons use precision laser technology to reshape the cornea,
		correcting nearsightedness, farsightedness, and astigmatism.
		Experience the joy of clear vision without the need for visual aids.

		### Glaucoma Management Early detection and management of glaucoma are
		crucial for preserving your vision. Our comprehensive glaucoma care
		includes regular screenings, advanced diagnostic testing, and
		personalized treatment plans to manage and control intraocular
		pressure. ### Pediatric Eye Care Children's eye health is a top
		priority at [Hospital Name] Eye Care. Our pediatric ophthalmologists
		are experienced in diagnosing and treating a wide range of pediatric
		eye conditions. From routine eye exams to specialized care, we are
		dedicated to ensuring your child's visual development.

		<div class="card p-4 shadow">
			## Why Choose [Hospital Name] Eye Care?
			<ul>
				<li>- **Experienced and Compassionate Team:** Our team of eye
					care professionals is committed to providing personalized and
					compassionate care to every patient.</li>
				<li>- **Cutting-Edge Technology:** We invest in the latest
					advancements in eye care technology to ensure accurate diagnoses
					and effective treatments.</li>
				<li>- **Patient-Centric Approach:** Your comfort and well-being
					are our top priorities. We strive to create a welcoming and
					patient-centric environment to enhance your overall experience.</li>
				<li>- **Educational Resources:** We believe in empowering our
					patients with knowledge. Our website and staff provide valuable
					information about eye health, conditions, and preventive measures.
				</li>
			</ul>





			Schedule your appointment today and entrust your vision to the
			dedicated professionals at [Hospital Name] Eye Care. We look forward
			to helping you achieve and maintain optimal eye health. Your vision
			is our mission!

		</div>
	</div>
	<div id="section2" class="d-flex bg-primary"> <section class="contact-section card shadow p-4 w-100 text-light" style="background-color:#1ab6ac">
		<h1># Contact Us</h1>
    <div class="contact-details p-4 rounded-4 d-flex justify-content-evenly">
      <div class=" p-4 rounded-4  ">
        <h3>Visit Us</h3>
        <p> Eye Care</p>
        <p>123 Vision Street</p>
        <p>City, State, ZIP</p>
      </div>
      <div class=" p-4 rounded-4 ">
        <h3>Call Us</h3>
        <p>Phone: (123) 456-7890</p>
        <p>Fax: (123) 456-7891</p>
      </div>
      <div class="p-4 rounded-4 ">
        <h3>Email Us</h3>
        <p>Email: info@exampleeyecare.com</p>
      </div>
    </div>
  </section>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>