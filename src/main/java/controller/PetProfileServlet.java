package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Pet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/PetProfileServlet")
public class PetProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        int index;
        HttpSession session = request.getSession();
        List<Pet> petList = (List<Pet>) session.getAttribute("petList");

        if (petList == null) {
            petList = new ArrayList<>();
            session.setAttribute("petList", petList);
        }

        if (action != null) {
            switch (action) {
                case "view":
                    try {
                        index = Integer.parseInt(request.getParameter("index"));
                        if (index >= 0 && index < petList.size()) {
                            Pet pet = petList.get(index);
                            request.setAttribute("pet", pet);
                            request.getRequestDispatcher("PetDetail.jsp").forward(request, response);
                            return;
                        }
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "Chỉ số không hợp lệ");
                    }
                    break;

                case "edit":
                    try {
                        index = Integer.parseInt(request.getParameter("index"));
                        if (index >= 0 && index < petList.size()) {
                            Pet pet = petList.get(index);
                            request.setAttribute("editName", pet.getName());
                            request.setAttribute("editType", pet.getType());
                            request.setAttribute("editAge", pet.getAge());
                            request.setAttribute("editIndex", index);
                        }
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "Chỉ số không hợp lệ");
                    }
                    break;

                case "delete":
                    try {
                        index = Integer.parseInt(request.getParameter("index"));
                        if (index >= 0 && index < petList.size()) {
                            petList.remove(index);// 8.1.13.Hệ thống xóa thú cưng
                            session.setAttribute("petList", petList);
                            request.setAttribute("success", "Đã xóa thú cưng thành công");
                        }
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "Chỉ số không hợp lệ");
                    }
                    break;
            }
        }

        request.getRequestDispatcher("PetProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String petName = request.getParameter("petName");
        String petType = request.getParameter("petType");
        String ageStr = request.getParameter("petAge");
        HttpSession session = request.getSession();
        List<Pet> petList = (List<Pet>) session.getAttribute("petList");

        if (petList == null) {
            petList = new ArrayList<>();
            session.setAttribute("petList", petList);
        }

        if (petName != null && !petName.trim().isEmpty() && 
            petType != null && !petType.trim().isEmpty() && 
            ageStr != null && !ageStr.trim().isEmpty()) {
            
            try {
                int age = Integer.parseInt(ageStr.trim());
                
                switch (action) {
                    case "add": //8.1.4.Bấm gửi yêu cầu cho hệ thống
                        petList.add(new Pet(petName.trim(), petType.trim(), age));//8.1.5. Hệ thống cập nhật thú cưng mới
                        session.setAttribute("petList", petList);
                        request.setAttribute("success", "Đã thêm thú cưng thành công");
                        break;

                    case "update": //8.1.8.Bấm gửi yêu cầu cho hệ thống
                        try {
                            int index = Integer.parseInt(request.getParameter("editIndex"));//8.1.9. Hệ thống cập nhật thú cưng cho chỉnh sửa
                            if (index >= 0 && index < petList.size()) {
                                Pet pet = petList.get(index);
                                pet.setName(petName.trim());
                                pet.setType(petType.trim());
                                pet.setAge(age);
                                session.setAttribute("petList", petList);
                                request.setAttribute("success", "Đã cập nhật thông tin thú cưng thành công");
                            }
                        } catch (NumberFormatException e) {
                            request.setAttribute("error", "Chỉ số không hợp lệ");
                        }
                        break;
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Tuổi phải là số nguyên");
            }
        } else {
            request.setAttribute("error", "Vui lòng điền đầy đủ thông tin");
        }

        response.sendRedirect("PetProfile.jsp");
    }
}
