package cn.com.scitc.servlet.user_order;

import cn.com.scitc.dao.OrderDao;
import cn.com.scitc.model.UserOrderModel;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "OrderServlet",urlPatterns = "/user_order/userorder")
public class OrderServlet extends HttpServlet {
    //post 存储历史订单
    //get 打开测试界面
    //接收传过来的历史订单信息并存储
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        //用map来接收request发送过来的多维数组
        Map map = request.getParameterMap();

        Gson gson=new Gson();

        String js=gson.toJson(map);
        String json="";
        Boolean start_on=false;
        Boolean end_on=false;
        for(int i=0;i<js.length();i++){
            if(js.charAt(i)=='['&&js.charAt(i+1)=='{' ){
                start_on=true;
            }
            if(start_on && !end_on){
                if(js.charAt(i)!='\\'){
                    json+=js.charAt(i)+"";
                }
            }
            if(js.charAt(i)==']'&&js.charAt(i-1)=='}'){
                end_on=true;
            }
        }

//        System.out.println(json);

        List<UserOrderModel> userOrderModelList=new Gson().fromJson(json,new TypeToken<List<UserOrderModel>>(){}.getType());

//        System.out.println(userOrderModelList.size());

//        for(int i=0;i<userOrderModelList.size();i++){
//            System.out.println( userOrderModelList.get(i).getUser_id());
//            System.out.println( userOrderModelList.get(i).getFlight_number());
//            System.out.println( userOrderModelList.get(i).getSeat_number());
//            System.out.println( userOrderModelList.get(i).getStart_site());
//            System.out.println( userOrderModelList.get(i).getEnd_site());
//            System.out.println( userOrderModelList.get(i).getStart_time());
//            System.out.println( userOrderModelList.get(i).getEnd_time());
//        }

        if(userOrderModelList.size()==1){
            response.getWriter().print(new OrderDao().insert_a(userOrderModelList.get(0)));
        }else {
            response.getWriter().print(new OrderDao().insert_a(userOrderModelList));
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("../user_order.jsp").forward(request,response);
    }
}
