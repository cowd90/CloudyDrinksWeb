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
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;

@WebServlet(name = "CartController", value = "/cart-controller")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String url = "";

        Object obj = request.getSession().getAttribute("user");
        User user = (User) obj;

        if (user != null) {

            String productId = request.getParameter("pid");
            String sizeId = request.getParameter("size");
            String quantityPara = request.getParameter("quantity");
            String notes = request.getParameter("notes");

            System.out.println(productId);
            System.out.println(sizeId);
            System.out.println(quantityPara);
            System.out.println(notes);

            int quantity = Integer.parseInt(quantityPara);

            CartDAO cartDAO = new CartDAO();

            if (cartDAO.checkIfExists(productId, sizeId)) {
                Cart cartItem = cartDAO.selectById(productId, sizeId);

                int newQuantity = cartItem.getQuantity() + quantity;
                cartItem.setQuantity(newQuantity);

                if (cartDAO.update(cartItem) > 0) {
                    url = "/products/index.jsp";
                }

            } else {
                Cart cartItem = new Cart();
                String cartId = RandomKey.generateKey();
                cartItem.setCartId(cartId);
                cartItem.setUserId(user.getUserId());
                cartItem.setProductId(Integer.parseInt(productId));
                cartItem.setSizeId(Integer.parseInt(sizeId));
                cartItem.setQuantity(quantity);
                cartItem.setNote(notes);

                Date todaysDate = new Date(new java.util.Date().getTime());
                Calendar c = Calendar.getInstance();
                c.setTime(todaysDate);
                c.add(Calendar.DATE, 1);
                Timestamp authCodeValidTime = new Timestamp(c.getTimeInMillis());

                cartItem.setTime(authCodeValidTime);

                if (cartDAO.insert(cartItem) > 0) {
                    url = "/products/index.jsp";
                }
            }

            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.selectById(productId);

            request.setAttribute("product", product);
        } else {
            url = "/auth/index.jsp";
        }

        PrintWriter out = response.getWriter();
        out.println("Add to cart successfully!");
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);


    }
}
