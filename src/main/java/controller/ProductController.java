package controller;

import database.CategoryDAO;
import database.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;
import model.Product;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ProductController", value = "/product-controller")
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("pid");
        Product product = new ProductDAO().selectById(productId);

        request.setAttribute("product", product);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/products/index.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
