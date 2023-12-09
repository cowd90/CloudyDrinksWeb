package controller;

import database.CartDAO;
import database.ProductDAO;
import database.SizeDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cart;
import model.Product;
import model.Size;
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
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action");
        if (action.equals("change-cart")) {
            changeCartInfo(request, response);
        } else if (action.equals("remove-item")) {
            removeCartItem(request, response);
        } else if (action.equals("add-to-cart")) {
            addToCart(request, response);
        }
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url = "";

        Object obj = request.getSession().getAttribute("user");
        User user = (User) obj;

        if (user != null) {

            String productId = request.getParameter("pid");
            String sizeId = request.getParameter("size");
            String quantityPara = request.getParameter("quantity");
            String notes = request.getParameter("notes");

            int quantity = Integer.parseInt(quantityPara);

            CartDAO cartDAO = new CartDAO();
            Cart cartItem;

            // Get size price and product price
            Product p = new ProductDAO().selectById(productId);
            Size s = new SizeDAO().selectById(sizeId);
            int totalPrice = 0;

            if (cartDAO.checkIfExists(productId, sizeId)) {
                cartItem = cartDAO.selectById(productId, sizeId);

                int newQuantity = cartItem.getQuantity() + quantity;
                totalPrice = (cartItem.getTotalPrice() / cartItem.getQuantity()) * newQuantity;
                cartItem.setQuantity(newQuantity);
                cartItem.setTotalPrice(totalPrice);
                cartItem.setNote(notes);

                if (cartDAO.update(cartItem) > 0) {
                    url = "/products/index.jsp";
                }

            } else {

                cartItem = new Cart();
                String cartId = RandomKey.generateKey();
                cartItem.setCartId(cartId);
                cartItem.setUserId(user.getUserId());
                cartItem.setProductId(Integer.parseInt(productId));
                cartItem.setSizeId(Integer.parseInt(sizeId));
                cartItem.setQuantity(quantity);
                cartItem.setNote(notes);

                totalPrice = (p.getPrice() + s.getUpSizePrice()) * quantity;
                cartItem.setTotalPrice(totalPrice);

                // Get real time
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

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    private void removeCartItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Enter controller");
        String url = "";
        Object obj = request.getSession().getAttribute("user");
        User user = (User) obj;

        if (user != null) {

            String cartItemId = request.getParameter("cartItemId");

            CartDAO cartDAO = new CartDAO();
            Cart cartItem = cartDAO.selectByCartId(cartItemId);
            if (cartDAO.delete(cartItem) > 0) {
                url = "/cart/result.jsp";
            }


        } else {
            url = "/auth/index.jsp";
        }

        System.out.println("End controller");
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    private void changeCartInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cartItemId = request.getParameter("cartItemId");
        String newQuantity = request.getParameter("newQuantity");
        String newDesc = request.getParameter("newDesc");

        Cart cart = new CartDAO().selectByCartId(cartItemId);
        cart.setTotalPrice((cart.getTotalPrice() / cart.getQuantity()) * Integer.parseInt(newQuantity));
        cart.setQuantity(Integer.parseInt(newQuantity));
        cart.setNote(newDesc);

        new CartDAO().update(cart);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/cart/result.jsp");
        rd.forward(request, response);
    }
}
