package cn.com.scitc.dao;

import cn.com.scitc.model.User;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    //用户登录
    public User login(String email){
        User user = new User();
        String sql = "select * from user where user_email = ?";
        ResultSet resultSet = SqlHelper.executeQuery(sql,new String[]{email});

        try {
            while (resultSet.next()){
                user.setUser_email(resultSet.getString("user_email"));
                user.setUser_psw(resultSet.getString("user_psw"));
                user.setPermission(resultSet.getInt("permission"));
                user.setUser_name(resultSet.getString("user_name"));
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

}
