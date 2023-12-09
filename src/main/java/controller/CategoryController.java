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

@WebServlet(name = "CategoryController", value = "/category-controller")
public class CategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String catId = request.getParameter("catId");

        ArrayList<Product> products = new ProductDAO().selectByCatId(catId);
        Category category = new CategoryDAO().selectById(catId);
        String catName = category.getCatName();

        request.setAttribute("catName", catName);
        request.setAttribute("productList", products);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/category/index.jsp");
        rd.forward(request, response);
    }
}
