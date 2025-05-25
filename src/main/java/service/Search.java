package service;

import model.Product;
import dao.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class Search extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String keyword = request.getParameter("txt");
        if (keyword == null) keyword = "";

        ProductDAO dao = new ProductDAO();
        List<Product> results = dao.searchProducts(keyword);

        request.setAttribute("searchResults", results);

        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            request.getRequestDispatcher("/search-result-fragment.jsp").forward(request, response);
        } else {
            // Truy cập thông thường (không phải AJAX): forward sang trang chính
            request.getRequestDispatcher("/search.jsp").forward(request, response);
        }
    }
}
