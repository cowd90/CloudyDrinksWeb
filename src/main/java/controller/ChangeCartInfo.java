package controller;

import database.CartDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cart;

import java.io.IOException;

@WebServlet(name = "ChangeCartInfo", value = "/change-cart")
public class ChangeCartInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cartItemId = request.getParameter("cartItemId");
        String newQuantity = request.getParameter("newQuantity");
        String newDesc = request.getParameter("newDesc");

        Cart cart = new CartDAO().selectByCartId(cartItemId);
        cart.setTotalPrice((cart.getTotalPrice() / cart.getQuantity()) * Integer.parseInt(newQuantity));
        cart.setQuantity(Integer.parseInt(newQuantity));
        cart.setNote(newDesc);

        new CartDAO().update(cart);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/cart/index.jsp");
        rd.forward(request, response);
    }
}
