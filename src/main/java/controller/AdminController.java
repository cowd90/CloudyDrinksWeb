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

@WebServlet(name = "AdminController", value = "/admin-controller")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action");
        if (action.equals("add-category")) {
            addCategory(request, response);
        } else if (action.equals("remove-category")) {
            removeCategory(request, response);
        } else if (action.equals("remove-product")) {
            removeProduct(request, response);
        }

    }

    private void addCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String catName = request.getParameter("catName");

        CategoryDAO categoryDAO = new CategoryDAO();
        Category category = new Category();
        category.setCatName(catName);

        if (categoryDAO.insert(category) > 0) {
            String url = "/admin";
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    private void removeCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String catId = request.getParameter("delCatId");

        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> productsOfCat = productDAO.selectByCatId(catId);
        Category category = categoryDAO.selectById(catId);

        // delete all products of the category
        productDAO.deleteAll(productsOfCat);

        // delete the category
        if (categoryDAO.delete(category) > 0) {
            String url = "/admin";
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    private void removeProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("delProdId");

        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.selectById(pid);

        if (productDAO.delete(product) > 0) {
            String url = "/admin";
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }
}
