package controller;

import database.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SearchController", value = "/search-controller")
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> products = productDAO.searchByName(keyword);

        request.setAttribute("productListSearch", products);
        RequestDispatcher rd = request.getRequestDispatcher("/components/search-result.jsp");
        rd.forward(request, response);
    }
}
