package controller;

import database.CategoryDAO;
import database.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;
import model.Product;

import java.io.IOException;

@WebServlet(name = "AddProduct", value = "/add-product")
public class AddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String prodName = request.getParameter("prodName");
        String prodPrice = request.getParameter("prodPrice");
        String belongCat = request.getParameter("belongCat");
        String prodDesc = request.getParameter("prodDesc");
        String prodImgLink = request.getParameter("prodImgLink");
        String token = request.getParameter("token");
        String img = prodImgLink+"&token="+token;

        System.out.println(prodName);
        System.out.println(prodImgLink);
        System.out.println(prodPrice);
        System.out.println(belongCat);
        System.out.println(prodDesc);

        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        // check if product already exists or not then allow to add
        if (!productDAO.checkIfProductExist(prodName)) {
            Product product = new Product();
            product.setProductName(prodName);
            product.setPrice(Integer.parseInt(prodPrice));
            product.setProductImage(img);
            product.setCatId(Integer.parseInt(belongCat));
            product.setProductDesc(prodDesc);

            System.out.println(product);

            if (productDAO.insert(product) > 0) {
                System.out.println("enter");
                String url = "/admin/index.jsp";
                RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
                rd.forward(request, response);
            }

        }

    }
}
