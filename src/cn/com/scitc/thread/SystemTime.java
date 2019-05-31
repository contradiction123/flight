package cn.com.scitc.thread;

import cn.com.scitc.dao.SqlHelper;
import cn.com.scitc.dao.SystemTiemDao;
import cn.com.scitc.model.FlightAttribute;
import cn.com.scitc.model.UserAttribute;
import cn.com.scitc.model.UserFlightSeat;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class SystemTime extends Thread{

    Integer time;

    //当key是true的时候才能执行
    Boolean key=true;

    //创建构造方法
    public SystemTime( int time) {
        this.time=time;
    }

    @Override
    public void run() {
        // TODO Auto-generated method stub
        while (key) {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date = df.format(System.currentTimeMillis());

            SystemTiemDao systemTiemDao = new SystemTiemDao();
            systemTiemDao.addSystemTime(date,time);

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
