package cn.com.scitc.dao;

import cn.com.scitc.model.User;

import java.sql.ResultSet;

public class UserDao {

    public User login(String email){
        User user = new User();
        String sql = "select * from user where user_email = ?";
        SqlHelper.getConnection();
        ResultSet resultSet = SqlHelper.executeQuery(sql,new String[]{email});
        try {
            while (resultSet.next()){
                user.setUser_email(resultSet.getString("user_email"));
                user.setUser_psw(resultSet.getString("user_psw"));
                user.setPermission(resultSet.getInt("permission"));
                user.setUser_name(resultSet.getString("user_name"));
                System.out.println("查询完毕");
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return user;
    }
    public void register(String email,String password,String name){

        String sql = "insert into user(user_email,user_psw,user_name) values(?,?,?)";
        SqlHelper.getConnection();
        Object[] objects = new Object[]{email,password,name};
        SqlHelper.executeUpdate(sql,objects);
    }

}
