package com.hospital.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.hospital.connection.DBCon;
import com.hospital.dao.AppointmentDao;
import com.hospital.dao.OrderDao;
import com.hospital.model.Appointment;
import com.hospital.model.Cart;
import com.hospital.model.Order;
import com.hospital.model.User;


public class AddAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = formatter.parse(request.getParameter("date"));
			User auth = (User) request.getSession().getAttribute("auth");
			String address = request.getParameter("address");
			String patient = request.getParameter("patient");

			String time = request.getParameter("time");
			String payment = request.getParameter("payment");

			int doctorId = Integer.parseInt(request.getParameter("doctor"));
			if (auth != null) {

				Appointment appointment = new Appointment();
				appointment.setDoctorId(doctorId);
				appointment.setUserId(auth.getId());
				appointment.setTime(time);
				appointment.setAddress(address);
				appointment.setPatientName(patient);
				appointment.setDate(formatter.format(date));
				appointment.setPayment(payment);
				AppointmentDao appointmentdao = new AppointmentDao(DBCon.getConnection());
				boolean result = appointmentdao.insertAppointment(appointment);
				if (result) {

					response.sendRedirect("alldoc.jsp");
				} else {
					out.print("order failed");
				}
			} else {
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
