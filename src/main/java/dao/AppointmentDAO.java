package dao;

import model.Appointment;

public class AppointmentDAO {
    public static boolean saveAppointment(Appointment appointment) {
        // Giả lập lưu lịch hẹn (in ra console)
        System.out.println(">>> Lưu lịch hẹn:");
        System.out.println("- Dịch vụ: " + appointment.getServiceType());
        System.out.println("- Thời gian: " + appointment.getDate() + " " + appointment.getTime());
        System.out.println("- Thú cưng: " + appointment.getPetName() + " (" + appointment.getPetType() + ")");
        System.out.println("- User ID: " + appointment.getUserId());
        return true;
    }
}
