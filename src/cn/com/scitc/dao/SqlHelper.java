package cn.com.scitc.dao;

import cn.com.scitc.model.UserFlightSeat;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.List;
import java.util.Properties;

// https://blog.csdn.net/educast/article/details/42501489
//useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT
public class SqlHelper {
    // 定义要使用的变量
    private static Connection conn = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    private static CallableStatement cs = null;

    private static String driver = "";
    private static String url = "";
    private static String user = "";
    private static String password = "";

    private static Properties pp = null;
    private static InputStream is = null;

    public static Connection getConn() {
        return conn;
    }

    public static PreparedStatement getPs() {
        return ps;
    }

    public static ResultSet getRs() {
        return rs;
    }

    public static CallableStatement getCs() {
        return cs;
    }

    // 加载驱动，只需要一次
    static {
        try {
            System.out.println("456");
            pp = new Properties();
            is = SqlHelper.class.getClassLoader().getResourceAsStream("config.properties");
            pp.load(is);
            url = pp.getProperty("url");
            driver = pp.getProperty("driver");
            user = pp.getProperty("user");
            password = pp.getProperty("password");

//            url="jdbc:mysql://localhost:3306/flight?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT";
//            driver="com.mysql.cj.jdbc.Driver";
//            user="flight_table";
//            password="123";
            System.out.println(driver);
            Class.forName(driver);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (is != null)
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            is = null;
        }
    }

    // 得到连接
    public static Connection getConnection() {
        try {
            conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    // 处理多个update/delete/insert
    public static void executeUpdateMultiParams(String[] sql,
                                                String[][] parameters) {
        try {
            // 获得连接
            conn = getConnection();
            // 可能传多条sql语句
            conn.setAutoCommit(false);
            for (int i = 0; i < sql.length; i++) {
                if (parameters[i] != null) {
                    ps = conn.prepareStatement(sql[i]);
                    for (int j = 0; j < parameters[i].length; j++)
                        ps.setString(j + 1, parameters[i][j]);
                }
                ps.executeUpdate();
            }
            conn.commit();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            throw new RuntimeException(e.getMessage());
        } finally {
            // 关闭资源
            close(rs, ps, conn);
        }
    }

    // update/delete/insert
    // sql格式:UPDATE tablename SET columnn = ? WHERE column = ?
    public static void executeUpdate(String sql, Object[] parameters) {
        try {
            // 1.创建一个ps
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            // 给？赋值
            if (parameters != null)
                for (int i = 0; i < parameters.length; i++) {
                    //ps.setString(i + 1, parameters[i]);
                    ps.setObject(i + 1, parameters[i]);
                }
            // 执行
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();// 开发阶段
            throw new RuntimeException(e.getMessage());
        } finally {
            // 关闭资源
            close(rs, ps, conn);
        }
    }


    //更新多人的语句
    // update/delete/insert
    // sql格式:UPDATE tablename SET columnn = ? WHERE column = ?
    public static void executeUpdate(String sql, Object[] parameters,Connection connection) {
        try {
            // 1.创建一个ps
            conn = connection;
            ps = conn.prepareStatement(sql);
            // 执行
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();// 开发阶段
            throw new RuntimeException(e.getMessage());
        } finally {
            // 关闭资源
            close(rs, ps, conn);
        }
    }

    //更新多人的语句
    // update/delete/insert
    // sql格式:UPDATE tablename SET columnn = ? WHERE column = ?
    public static void executeUpdate(List<UserFlightSeat> flightSeatList) {
        try {
            // 1.创建一个ps
            conn = getConnection();
            String sql="insert into user_flight_seat values";
            String value="";
            for(int i=0;i<flightSeatList.size();i++){
                value+=(i==0?"":",");
                value+="('"+flightSeatList.get(i).getUser_id()+"',";
                value+="'"+flightSeatList.get(i).getFlight_number()+"',";
                value+="'"+flightSeatList.get(i).getWant_seat_attribute_one()+"',";
                value+="'"+flightSeatList.get(i).getWant_seat_attribute_second()+"',";
                value+="'"+flightSeatList.get(i).getSeat_id()+"',";
                value+="'"+flightSeatList.get(i).getSatisfaction()+"',";
                value+="'"+flightSeatList.get(i).getTeam()+"',";
                value+="'"+flightSeatList.get(i).getAllot_course()+"')";
            }
            sql+=value;
//            System.out.println(sql);
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();// 开发阶段
            throw new RuntimeException(e.getMessage());
        } finally {
            // 关闭资源
            close(rs, ps, conn);
        }
    }

    // select
    public static ResultSet executeQuery(String sql, String[] parameters) {
        ResultSet rs = null;
        try {
            conn = getConnection();
            ps = conn.prepareStatement(sql);
            if (parameters != null) {
                for (int i = 0; i < parameters.length; i++) {
                    ps.setString(i + 1, parameters[i]);
                }
            }
            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        } finally {

        }
        return rs;
    }

    // 分配所有人的select
    public static ResultSet executeQuery(String sql, String[] parameters,Connection connection) {
        ResultSet rs = null;
        try {
            conn = connection;
            ps = conn.prepareStatement(sql);

            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
//            throw new RuntimeException(e.getMessage());
        } finally {

        }
        return rs;
    }


    // 调用无返回值存储过程
    // 格式： call procedureName(parameters list)
    public static void callProc(String sql, String[] parameters) {
        try {
            conn = getConnection();
            cs = conn.prepareCall(sql);
            // 给？赋值
            if (parameters != null) {
                for (int i = 0; i < parameters.length; i++)
                    cs.setObject(i + 1, parameters[i]);
            }
            cs.execute();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        } finally {
            // 关闭资源
            close(rs, cs, conn);
        }
    }

    // 调用带有输入参数且有返回值的存储过程
    public static CallableStatement callProcInput(String sql, String[] inparameters) {
        try {
            conn = getConnection();
            cs = conn.prepareCall(sql);
            if(inparameters!=null)
                for(int i=0;i<inparameters.length;i++)
                    cs.setObject(i+1, inparameters[i]);
            cs.execute();
        }
        catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }finally{

        }
        return cs;
    }

    // 调用有返回值的存储过程
    public static CallableStatement callProcOutput(String sql,Integer[] outparameters) {
        try {
            conn = getConnection();
            cs = conn.prepareCall(sql);
            //给out参数赋值
            if(outparameters!=null)
                for(int i=0;i<outparameters.length;i++)
                    cs.registerOutParameter(i+1, outparameters[i]);
            cs.execute();
        }
        catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }finally{

        }
        return cs;
    }

    public static void close(ResultSet rs, Statement ps, Connection conn) {
        if (rs != null)
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        rs = null;
        if (ps != null)
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        ps = null;
        if (conn != null)
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        conn = null;
    }
}
