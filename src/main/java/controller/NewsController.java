package controller;

import database.NewsDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.News;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "NewsController", value = "/news-controller")
public class NewsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int newsCount = Integer.parseInt(request.getParameter("newsCount"));

        ArrayList<News> newNews = new NewsDAO().selectNext3News(newsCount);

        request.setAttribute("newNews", newNews);
        RequestDispatcher rd = request.getRequestDispatcher("/news/more-news.jsp");
        rd.forward(request, response);
    }
}