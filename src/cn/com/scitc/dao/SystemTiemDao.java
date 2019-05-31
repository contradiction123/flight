package cn.com.scitc.dao;

import cn.com.scitc.model.SystemTimeModel;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SystemTiemDao {

    public List<SystemTimeModel> findAllSystemTime(){
        List<SystemTimeModel> list = new ArrayList<>();
        String sql = "select * from systemtime";
        ResultSet resultSet = SqlHelper.executeQuery(sql,null);
        try {
            while (resultSet.next()){
                SystemTimeModel systemTimeModel = new SystemTimeModel();
                systemTimeModel.setSystemdate(resultSet.getString("systemdate"));
                systemTimeModel.setTime(resultSet.getInt("time"));
                list.add(systemTimeModel);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public void addSystemTime(String date, int time){
        String sql = "INSERT INTO systemtime (systemdate, time) VALUES (?,?)";
        SqlHelper.executeUpdate(sql,new Object[]{date,time});
    }
}
