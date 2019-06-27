package cn.com.scitc.dao;

import cn.com.scitc.model.UserOrderModel;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    //存储一个人的历史订单
    public Boolean insert_a(UserOrderModel userOrderModel){
        String sql="insert into user_order values(?,?,?,?,?,?,?)";

        Object[] ps=new Object[7];

        ps[0]=userOrderModel.getUser_id();
        ps[1]=userOrderModel.getFlight_number();
        ps[2]=userOrderModel.getSeat_number();
        ps[3]=userOrderModel.getStart_site();
        ps[4]=userOrderModel.getEnd_site();
        ps[5]=userOrderModel.getStart_time();
        ps[6]=userOrderModel.getEnd_time();

        try {
            SqlHelper.executeUpdate(sql,ps);
            return true;
        } catch (Exception e) {
//            e.printStackTrace();
            return false;
        }
    }

    //存储多个人的历史订单
    public Boolean insert_a(List<UserOrderModel> userOrderModelList){
        String sql="insert into user_order values";
        String value="";
        for(int i=0;i<userOrderModelList.size();i++){
            value+=(i==0?"":",");
            value+="('"+userOrderModelList.get(i).getUser_id()+"',";
            value+="'"+userOrderModelList.get(i).getFlight_number()+"',";
            value+="'"+userOrderModelList.get(i).getSeat_number()+"',";
            value+="'"+userOrderModelList.get(i).getStart_site()+"',";
            value+="'"+userOrderModelList.get(i).getEnd_site()+"',";
            value+="'"+userOrderModelList.get(i).getStart_time()+"',";
            value+="'"+userOrderModelList.get(i).getEnd_time()+"')";
        }

        sql+=value;

//        System.out.println(sql);

        try {
            SqlHelper.executeUpdate(sql,null);
            return true;
        } catch (Exception e) {
//            e.printStackTrace();
            return false;
        }
    }

    //根据用户id，账号查询历史订单
    public List<UserOrderModel> findorder_userId(String user_id){
        List<UserOrderModel> userOrderModels=new ArrayList<>();
        String sql="select * from user_order user_id=?";

        String[] ps=new String[1];

        ps[0]=user_id;

        ResultSet resultSet=SqlHelper.executeQuery(sql,ps);

        try {
            while (resultSet.next()){
                UserOrderModel userOrderModel=new UserOrderModel();

                userOrderModel.setUser_id(resultSet.getString("user_id"));
                userOrderModel.setFlight_number(resultSet.getString("flight_number"));
                userOrderModel.setSeat_number(resultSet.getString("seat_number"));
                userOrderModel.setStart_site(resultSet.getString("start_site"));
                userOrderModel.setEnd_site(resultSet.getString("end_site"));
                userOrderModel.setStart_time(resultSet.getString("start_time"));
                userOrderModel.setEnd_time(resultSet.getString("end_time"));

                userOrderModels.add(userOrderModel);
            }

            return userOrderModels;
        } catch (SQLException e) {
//            e.printStackTrace();

            return userOrderModels;
        }

    }


}
