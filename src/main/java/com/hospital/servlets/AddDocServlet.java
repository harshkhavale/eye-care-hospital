package com.hospital.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.hospital.connection.DBCon;
import com.hospital.dao.DoctorDao;
import com.hospital.model.Doctor;

@MultipartConfig
public class AddDocServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			// Specify the directory where you want to save the uploaded file
			String uploadDirectory = "D:/Eclips/EyeCareHospitalApp/src/main/webapp/assets"; // Change this to the
																							// desired
			// directory

			// Create the upload directory if it doesn't exist
			File uploadDir = new File(uploadDirectory);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			// Get the file part from the request
			Part filePart = request.getPart("profile"); // "image" is the name of the file input field in your HTML form

			// Extract the filename from the content-disposition header of the part
			String fileName = getFileName(filePart);

			// Save the file to the specified directory
			String filePath = uploadDirectory + File.separator + fileName;
			filePart.write(filePath);

			// Now that you have saved the file, you can access other request parameters
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			String description = request.getParameter("description");
			String contact = request.getParameter("contact");
			String email = request.getParameter("email");

			Double charge = Double.parseDouble(request.getParameter("charge"));

			// Create Product object
			Doctor doc = new Doctor();
			doc.setName(name);
			doc.setCategory(category);
			doc.setDescription(description);
			doc.setContact(contact);
			doc.setEmail(email);

			doc.setCharge(charge);
			doc.setProfile(fileName); // Save only the filename, not the full path

			// Insert product into the database
			DoctorDao productdao = new DoctorDao(DBCon.getConnection());
			boolean result = productdao.insertDoctor(doc);

			// Handle the result
			if (result) {
				out.println("<script>");
				out.println("alert('Product Upload Successful!');");
				out.println("window.location.replace('adddoc.jsp');");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('Product Upload failed!');");
				out.println("window.location.replace('adddoc.jsp');");
				out.println("</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Extracts file name from content-disposition header of a Part
	private String getFileName(final Part part) {
		final String partHeader = part.getHeader("content-disposition");
		for (String content : partHeader.split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}
