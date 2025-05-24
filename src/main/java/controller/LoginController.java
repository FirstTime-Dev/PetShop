package controller;

import dao.AccountDAO;

import model.Account;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private AccountDAO accountDAO;

    @Override
    public void init() {
        accountDAO = new AccountDAO(); // Khởi tạo DAO
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Account account = accountDAO.authenticateUser(username, password);

        if (account != null) {
            if (account.getStatus() == 1) { // Đã xác minh
                HttpSession session = request.getSession();
                session.setAttribute("account", account);
                response.sendRedirect("index.jsp"); // Trang chính sau khi login
            } else {
                request.setAttribute("error", "Tài khoản chưa được xác minh!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
