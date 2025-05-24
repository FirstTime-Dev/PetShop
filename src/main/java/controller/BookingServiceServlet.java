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

        // 6.1.0: Hệ thống đang ở màn hình chính, user đã login
        HttpSession session = request.getSession();
        User currentUser = new User(1, "demoUser");
        session.setAttribute("currentUser", currentUser);


        String serviceType = request.getParameter("serviceType");// 6.1.3 Chọn loại dịch vụ (tắm,khám,tiêm,cắt tỉa lông)
        String date = request.getParameter("date");// 6.1.4 Chọn ngày
        String time = request.getParameter("time");// 6.1.5 Chọn giờ
        String petName = request.getParameter("petName");// 6.1.6 Nhập tên thú cưng
        String petType = request.getParameter("petType");// 6.1.7 Chọn loại thú cưng

        // 6.1.8: Tạo đối tượng lịch hẹn và gửi yêu cầu lưu (submit)
        Appointment appointment = new Appointment(serviceType, date, time, petName, petType, currentUser.getId());
        boolean success = AppointmentDAO.saveAppointment(appointment);

        // 6.1.9: Xác nhận lưu thông tin
        if (success) {
            request.setAttribute("message", "Đặt lịch thành công!");
        } else {
            request.setAttribute("message", "Đặt lịch thất bại. Vui lòng thử lại.");
        }

        request.getRequestDispatcher("booking-result.jsp").forward(request, response);
    }
}
