package cn.com.scitc.servlet;

import cn.com.scitc.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditUserServlet", urlPatterns = "/edit_user")
public class EditUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("user_name");
        String email = request.getParameter("user_email");
        String password = request.getParameter("user_password");
        String sex = request.getParameter("user_sex");
        String id = request.getParameter("user_id");

        UserDao userDao = new UserDao();
        userDao.editUserById(name,email,password,sex,id);
        response.sendRedirect("admin_user");
    }

}
