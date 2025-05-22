package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import model.User;
import model.Appointment;
import dao.AppointmentDAO;

@WebServlet("/bookService")
public class BookingServiceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Giả lập người dùng đã đăng nhập
        HttpSession session = request.getSession();
        User currentUser = new User(1, "demoUser");
        session.setAttribute("currentUser", currentUser);

        // Lấy dữ liệu từ form
        String serviceType = request.getParameter("serviceType");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String petName = request.getParameter("petName");
        String petType = request.getParameter("petType");

        Appointment appointment = new Appointment(serviceType, date, time, petName, petType, currentUser.getId());
        boolean success = AppointmentDAO.saveAppointment(appointment);

        if (success) {
            request.setAttribute("message", "Đặt lịch thành công!");
        } else {
            request.setAttribute("message", "Đặt lịch thất bại. Vui lòng thử lại.");
        }

        request.getRequestDispatcher("booking-result.jsp").forward(request, response);
    }
}
