package cn.com.scitc.servlet;

import cn.com.scitc.dao.Dao;
import cn.com.scitc.model.B737_700;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "b737_700_SelectServlet",urlPatterns = "/b7377select",asyncSupported = true)
//这个servlet是查看b737-700的数据表的
public class b737_700_SelectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<B737_700> b737_700s = new Dao().b7377select();

        request.setAttribute("users",b737_700s);

        request.getRequestDispatcher("/select.jsp").forward(request,response);
    }
}
