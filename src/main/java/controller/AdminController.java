package controller;

import database.CategoryDAO;
import database.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;
import model.Product;

import java.io.IOException;

@WebServlet(name = "AdminController", value = "/admin-controller")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String catName = request.getParameter("catName");

        CategoryDAO categoryDAO = new CategoryDAO();
        Category category = new Category();
        category.setCatName(catName);
        categoryDAO.insert(category);

    }

    private void removeCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String catId = request.getParameter("catId");
        CategoryDAO categoryDAO = new CategoryDAO();
        Category category = categoryDAO.selectById(catId);

        if (categoryDAO.delete(category) > 0) {
            String url = "/admin";
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }
}
