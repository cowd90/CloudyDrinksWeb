package controller;

import database.CartDAO;
import database.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cart;
import model.Product;
import model.User;
import util.RandomKey;

import java.io.IOException;

@WebServlet(name = "CartController", value = "/cart-controller")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url = "";

        Object obj = request.getSession().getAttribute("user");
        User user = (User) obj;

        if (user != null) {
            String quantityPara = request.getParameter("quantity");
            String sizeId = request.getParameter("size");
            String productId = request.getParameter("pid");

            int quantity = Integer.parseInt(quantityPara);

            CartDAO cartDAO = new CartDAO();

            if (cartDAO.checkIfExists(productId, sizeId)) {
                Cart cartItem = cartDAO.selectById(productId, sizeId);

                int newQuantity = cartItem.getQuantity() + quantity;
                cartItem.setQuantity(newQuantity);

                if (cartDAO.update(cartItem) > 0) {
                    url = "/categories/index.jsp";
                }

            } else {
                Cart cartItem = new Cart();
                String cartId = RandomKey.generateKey();
                cartItem.setCartId(cartId);
                cartItem.setUserId(user.getUserId());
                cartItem.setProductId(Integer.parseInt(productId));
                cartItem.setSizeId(Integer.parseInt(sizeId));
                cartItem.setQuantity(quantity);

                if (cartDAO.insert(cartItem) > 0) {
                    request.setAttribute("msg", "Add to cart successfully!");
                    url = "/categories/index.jsp";
                }
            }
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.selectById(productId);

            request.setAttribute("product", product);
        } else {
            url = "/auth/index.jsp";
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
