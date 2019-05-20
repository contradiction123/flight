package cn.com.scitc.thread;

import cn.com.scitc.dao.SqlHelper;
import cn.com.scitc.model.FlightAttribute;
import cn.com.scitc.model.UserAttribute;
import cn.com.scitc.model.UserFlightSeat;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AllUserFlightSeatUpdate extends Thread{
    //整机分配
    //使用子线程添加用户的座位信息


    //创建存储团体传过来的数据
    List<UserFlightSeat> userFlightSeatList=new ArrayList<>();

    //当key是true的时候才能执行
    Boolean key=true;

    //创建构造方法
    public AllUserFlightSeatUpdate(List<UserFlightSeat> userFlightSeatList) {
        this.userFlightSeatList=userFlightSeatList;
    }

    @Override
    public void run() {
        // TODO Auto-generated method stub
        while (key) {

            SqlHelper.executeUpdate(userFlightSeatList);

            key=false;
            try {
                sleep(2);
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }


}
