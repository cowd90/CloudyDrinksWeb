package controller;

import database.CartDAO;
import database.OrderDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cart;
import model.Order;
import model.OrderStatus;
import model.User;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;
import util.RandomKey;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

@WebServlet(name = "OrderController", value = "/order-controller")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        Object obj = request.getSession().getAttribute("user");
        User user = null;
        if (obj != null) {
            user = (User) obj;
        }

        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String address = request.getParameter("address");

        // Get all products from cart then add to order
        ArrayList<Cart> cartItems = new CartDAO().selectAllItem(user.getUserId());
        ArrayList<Order> orders = new ArrayList<>();
        for (Cart cart : cartItems) {
            Order order = new Order();
            order.setOrderId(RandomKey.generateKey());
            order.setReceiverName(name);
            order.setPhoneNumber(phoneNumber);
            order.setAddress(address + ", " + ward + ", " + district + ", TP Hồ Chí Minh");
            order.setOrderStatusId(1);

            order.setUserId(user.getUserId());
            order.setProductId(cart.getProductId());
            order.setSizeId(cart.getSizeId());
            order.setQuantity(cart.getQuantity());
            order.setTotalPrice(cart.getTotalPrice());
            order.setNote(cart.getNote());

            Date todaysDate = new Date(new java.util.Date().getTime());
            Calendar c = Calendar.getInstance();
            c.setTime(todaysDate);
            c.add(Calendar.DATE, 1);
            Timestamp authCodeValidTime = new Timestamp(c.getTimeInMillis());
            order.setTime(authCodeValidTime);

            orders.add(order);
        }

        // delete all the products from cart
        new CartDAO().deleteAll(cartItems);

        // Add to order
        new OrderDAO().insertAll(orders);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }
}
