package controller;

import database.CategoryDAO;
import database.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
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

        String prodName = request.getParameter("prodName");
        String prodImgLink = request.getParameter("prodImgLink");
        String prodPrice = request.getParameter("prodPrice");
        String belongCat = request.getParameter("belongCat");
        String prodDesc = request.getParameter("prodDesc");

        System.out.println(prodName);
        System.out.println(prodImgLink);
        System.out.println(prodPrice);
        System.out.println(belongCat);
        System.out.println(prodDesc);

        ProductDAO productDAO = new ProductDAO();
        // check if product already exists or not then allow to add
        if (!productDAO.checkIfProductExist(prodName)) {
            Product product = new Product();
            product.setProductName(prodName);
            product.setPrice(Integer.parseInt(prodPrice));
            product.setProductImage(prodImgLink);
            product.setCatId(new CategoryDAO().selectByName(belongCat).getCatId());
            product.setProductDesc(prodDesc);

            if (productDAO.insert(product) > 0) {
                String url = "/admin";
                RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
                rd.forward(request, response);
            }

        }

    }
}
