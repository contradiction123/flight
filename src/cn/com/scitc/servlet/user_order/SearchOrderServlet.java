package cn.com.scitc.servlet.user_order;

import cn.com.scitc.dao.OrderDao;
import cn.com.scitc.model.UserOrderModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchOrderServlet",urlPatterns = "/user_order/searchOrder")
public class SearchOrderServlet extends HttpServlet {

    //post 根据用户id  user_id 查询历史订单

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id=request.getParameter("user_id");

        List<UserOrderModel> userOrderModels=new OrderDao().findorder_userId(user_id);

        request.setAttribute("userOrderList",userOrderModels);

//        request.getRequestDispatcher("../user_order.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
