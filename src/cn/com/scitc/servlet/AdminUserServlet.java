package cn.com.scitc.servlet;

import cn.com.scitc.dao.UserDao;
import cn.com.scitc.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminUserServlet",urlPatterns = "/admin_user")
public class AdminUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //判断是否非法访问
        if(request.getSession().getAttribute("msg") == null){
            request.getSession().setAttribute("error","请先登录!");
            response.sendRedirect("login");
            return;
        }
        UserDao dao = new UserDao();
        List<User> users = dao.findAllUser();
        request.setAttribute("users",users);
        request.getRequestDispatcher("/admin_user.jsp").forward(request,response);
    }
}
