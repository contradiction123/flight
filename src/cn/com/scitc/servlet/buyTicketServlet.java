package cn.com.scitc.servlet;

import cn.com.scitc.dao.Dao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "buyTicketServlet",urlPatterns = "/buy_ticket")
public class buyTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Dao dao=new Dao();
        List<String> select_seat=dao.b7377select_seat();

        request.setAttribute("select_seat",select_seat);

        String string="/buy_ticket.jsp";

        request.getRequestDispatcher(string).forward(request,response);
    }
}
