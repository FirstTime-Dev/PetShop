package controller;

import model.Revenue;
import service.RevenueService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminRevenue")
public class RevenueController extends HttpServlet {
    private RevenueService revenueService = new RevenueService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Revenue> revenues = revenueService.getAll();
        request.setAttribute("revenues", revenues);
        request.getRequestDispatcher("/adminRevenue.jsp").forward(request, response);

    }
}
