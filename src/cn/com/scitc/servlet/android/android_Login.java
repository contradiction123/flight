package cn.com.scitc.servlet.android;

import cn.com.scitc.dao.UserDao;
import cn.com.scitc.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "android_Login",urlPatterns = "/android/android_login",asyncSupported = true)
public class android_Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        String psw=request.getParameter("psw");
//        System.out.println(name+","+psw);
        UserDao dao = new UserDao();
        User user = dao.login(name);

        if (name.equals(user.getUser_email()) && psw.equals(user.getUser_psw())){
            response.getWriter().print("1");
        }else {
            response.getWriter().print("0");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("../android_h5/android_login.html").forward(request,response);
    }
}
