package cn.com.scitc.dao;

import cn.com.scitc.model.FlightAttribute;
import cn.com.scitc.model.User;
import cn.com.scitc.model.UserFlightSeat;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    //用户登录
    public User login(String email){
        User user = new User();
        String sql = "select * from user where user_email = ?";
        ResultSet resultSet = SqlHelper.executeQuery(sql,new String[]{email});


        try {
            while (resultSet.first()){
                user.setUser_id(resultSet.getInt("user_id"));
                user.setUser_email(resultSet.getString("user_email"));
                user.setUser_psw(resultSet.getString("user_psw"));
                user.setPermission(resultSet.getInt("permission"));
                user.setUser_name(resultSet.getString("user_name"));
                return user;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return user;
    }

    //用户注册
    public void register(String email,String password,String name){

        String sql = "insert into user(user_email,user_psw,user_name) values(?,?,?)";
        Object[] objects = new Object[]{email,password,name};
        SqlHelper.executeUpdate(sql,objects);
    }

    //查找所有用户信息
    public List<User> findAllUser(){
        List<User> users = new ArrayList<User>();
        String sql = "select * from user";
        ResultSet resultSet = SqlHelper.executeQuery(sql,null);
        try {
            while (resultSet.next()){
                User user = new User();
                user.setUser_name(resultSet.getString("user_name"));
                user.setUser_email(resultSet.getString("user_email"));
                user.setUser_psw(resultSet.getString("user_psw"));
                user.setUser_id(resultSet.getInt("user_id"));
                user.setUser_id_card(resultSet.getString("user_id_card"));
                user.setUser_sex(resultSet.getString("user_sex"));
                user.setUser_img_path(resultSet.getString("user_img_path"));
                user.setPermission(resultSet.getInt("permission"));
                users.add(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }

    //删除指定飞机的用户信息
    public boolean clearUser(String flight_number){
        String sql="DELETE from user_flight_seat WHERE flight_number=?";
        Object[] ps=new Object[1];
        ps[0]=flight_number;

        try {
            SqlHelper.executeUpdate(sql,ps);
            sql="UPDATE flight_attribute set user_id=null where flight_number='"+flight_number+"'";
            SqlHelper.executeUpdate(sql,null);
            return true;
        } catch (Exception e) {
//            e.printStackTrace();
        }
        return false;
    }


    //查询用户座位
    public UserFlightSeat findFlightByUser(String user_id,String flight_number){
        String sql = "select * from user_flight_seat where user_id = ? and flight_number = ?";
        UserFlightSeat userFlightSeat = new UserFlightSeat();
        ResultSet resultSet = SqlHelper.executeQuery(sql,new String[]{user_id,flight_number});
        try {
            while (resultSet.first()){
                userFlightSeat.setTeam(resultSet.getString("team"));
//                System.out.println(resultSet.getString("team"));
                userFlightSeat.setFlight_number(resultSet.getString("flight_number"));
                userFlightSeat.setSeat_id(resultSet.getString("seat_id"));
                return userFlightSeat;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userFlightSeat;
    }

    //查询团队座位
    public List<UserFlightSeat> findFlightByTeam(String user_id,String flight_number){
        List<UserFlightSeat> userFlightSeats = new ArrayList<>();
        String sql = "select * from user_flight_seat where team = ? and flight_number = ?";
        ResultSet resultSet = SqlHelper.executeQuery(sql,new String[]{user_id,flight_number});
        try {
            while (resultSet.next()){
                UserFlightSeat userFlightSeat = new UserFlightSeat();
                userFlightSeat.setSeat_id(resultSet.getString("seat_id"));
                userFlightSeats.add(userFlightSeat);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return  userFlightSeats;
    }

    //删除用户
    public void deleteUserById(String id){
        String sql = "DELETE FROM user WHERE user_id = ?";
        SqlHelper.executeUpdate(sql,new Object[]{id});
    }

    //修改信息
    public void editUserById(String name,String email,String password,String sex, String id){
//        String sql = "update user set user_name = ?, user_email = ?, user_psw = ?, user_sex = ? where user_id = ?";
//        SqlHelper.executeUpdate(sql,new Object[]{name,email,password,sex,id});

        String sql = "update user set user_name = ?, user_email = ?, user_sex = ? where user_id = ?";
        SqlHelper.executeUpdate(sql,new Object[]{name,email,sex,id});
    }
    //用户自己修改信息
    public void editUserById(String name,String email,String sex, String id){
//        String sql = "update user set user_name = ?, user_email = ?, user_psw = ?, user_sex = ? where user_id = ?";
//        SqlHelper.executeUpdate(sql,new Object[]{name,email,password,sex,id});

        String sql = "update user set user_name = ?, user_email = ?, user_sex = ? where user_id = ?";
        SqlHelper.executeUpdate(sql,new Object[]{name,email,sex,id});
    }
    //删除飞机
    public boolean deleteFlight(String flight_number){
        String sql="delete from flight_attribute where flight_number='"+flight_number+"'";
        try {
            SqlHelper.executeUpdate(sql,null);

            sql="delete from flight_model where name='"+flight_number+"'";

            SqlHelper.executeUpdate(sql,null);

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    //查询订单
    public List<UserFlightSeat> findOrder_number(){
        List<UserFlightSeat> list = new ArrayList<>();
        String sql = "select * from user_flight_seat order by order_number desc limit 8";
        ResultSet resultSet = SqlHelper.executeQuery(sql,null);
        try {
            while (resultSet.next()){
                UserFlightSeat userFlightSeat = new UserFlightSeat();
                userFlightSeat.setUser_id(resultSet.getString("user_id"));
                userFlightSeat.setSeat_id(resultSet.getString("seat_id"));
                userFlightSeat.setFlight_number(resultSet.getString("flight_number"));
                userFlightSeat.setOrder_number(resultSet.getInt("order_number"));
                list.add(userFlightSeat);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }
}
