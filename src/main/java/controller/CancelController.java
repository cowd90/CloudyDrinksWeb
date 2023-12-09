package controller;

import database.OrderDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Order;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;

@WebServlet(name = "CancelController", value = "/cancel-controller")
public class CancelController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("id");

        // update order status and time
        OrderDAO orderDAO = new OrderDAO();
        Order order = orderDAO.selectById(orderId);
        order.setOrderStatusId(0);

        Date todaysDate = new Date(new java.util.Date().getTime());
        Calendar c = Calendar.getInstance();
        c.setTime(todaysDate);
        c.add(Calendar.DATE, 1);
        Timestamp authCodeValidTime = new Timestamp(c.getTimeInMillis());
        order.setTime(authCodeValidTime);

        orderDAO.update(order);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/history/result.jsp");
        rd.forward(request, response);
    }
}
