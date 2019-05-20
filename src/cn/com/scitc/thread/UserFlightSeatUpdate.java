package cn.com.scitc.thread;

import cn.com.scitc.dao.SqlHelper;
import cn.com.scitc.model.FlightAttribute;
import cn.com.scitc.model.UserAttribute;
import cn.com.scitc.model.UserFlightSeat;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserFlightSeatUpdate extends Thread{
    //使用子线程添加用户的座位信息

    //userAttributeList这里面存放的是用户的id，想要的第一位置，第二位置，买票人
    //flight_number这是航班号
    //flightAttributes这是存放分配好的座位号，和用户账户
    List<UserAttribute> userAttributeList=new ArrayList<>();
    String flight_number="";
    List<FlightAttribute> flightAttributes=new ArrayList<>();

    //判断是单人还是团体
    Integer mannumber=0;

    //创建存储团体传过来的数据
    List<UserFlightSeat> userFlightSeatList=new ArrayList<>();

    //当key是true的时候才能执行
    Boolean key=true;

    //创建一人的构造方法
    //userAttributeList这里面存放的是用户的id，想要的第一位置，第二位置，买票人
    //flight_number这是航班号
    //flightAttributes这是存放分配好的座位号，和用户账户
    public UserFlightSeatUpdate(List<UserAttribute> userAttributeList, String flight_number, List<FlightAttribute> flightAttributes,Integer mannumber) {
        this.userAttributeList=userAttributeList;
        this.flight_number=flight_number;
        this.flightAttributes=flightAttributes;
        this.mannumber=mannumber;
    }

    //创建多人的构造方法
    //userFlightSeatList里面是直接写好的用户座位属性表
    //mannumber是几个人，这里只要不是一个人就行
    public UserFlightSeatUpdate(List<UserFlightSeat> userFlightSeatList,Integer mannumber){
        this.userFlightSeatList=userFlightSeatList;
        this.mannumber=mannumber;
    }


    @Override
    public void run() {
        // TODO Auto-generated method stub
        while (key) {

            if(mannumber==1){
                satisfaction(userAttributeList,flight_number,flightAttributes);
            }else {
                if(flight_seat_insert(userFlightSeatList)){
                    userflightseat_insert(userFlightSeatList);
                }
            }

            key=false;
            try {
                sleep(2);
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    //单人
    //进行判定这些座位是否满足乘客的需求,
    // 如果满足就其中一个要求在执行更新用户座位表格的满意度，不满足也要更新
    private void satisfaction(List<UserAttribute> userAttributeList,String flight_number,List<FlightAttribute> flightAttributes){
        for(int i=0;i<userAttributeList.size();i++){

            String sql="select * from "+flight_number+" where seat_id='"+flightAttributes.get(i).getSeat_id()+"'";
//            System.out.println(sql);

            List<UserFlightSeat> list=new ArrayList<>();

            SqlHelper.getConnection();
            ResultSet resultSet=SqlHelper.executeQuery(sql,null);
            try {
                while (resultSet.next()){

                    UserFlightSeat userFlightSeat=new UserFlightSeat();

                    userFlightSeat.setUser_id(userAttributeList.get(i).getId());
                    userFlightSeat.setFlight_number(flight_number);
                    userFlightSeat.setWant_seat_attribute_one(userAttributeList.get(i).getType_one());
                    userFlightSeat.setWant_seat_attribute_second(userAttributeList.get(i).getType_second());
                    userFlightSeat.setSeat_id(flightAttributes.get(i).getSeat_id());
                    //当存放一个人的时候team团队存放NO，表示不是团队
                    //当存放多个人的时候team团队，存放第一个人的id账号，表示这组人是一个团队的
                    if(userAttributeList.size()>1){
                        userFlightSeat.setTeam(userAttributeList.get(0).getId());
                    }else {
                        userFlightSeat.setTeam("NO");
                    }


                    //判断分配的座位是否满足第一个要求
                    if(Integer.parseInt(resultSet.getString(userAttributeList.get(i).getType_one()))==1){

                        //satisfaction是用户满意度的，T代表满意，F表示不满意
                        userFlightSeat.setSatisfaction("T");

                        //一个人的信息全部填写完毕
                        //在这里将一个人的信息存到list中
                        list.add(userFlightSeat);
                        //这样就可以执行更新语句
                        userflightseat_insert(list);

                        //插入语句执行完毕后就可以结束本次循环
                        continue;
                    }

                    //如果不是满足第一个要求就会执行这下面的语句，判断是否满足第二个要求
                    if(Integer.parseInt(resultSet.getString(userAttributeList.get(i).getType_second()))==1){
                        //satisfaction是用户满意度的，T代表满意，F表示不满意
                        userFlightSeat.setSatisfaction("T");

                        //一个人的信息全部填写完毕
                        //在这里将一个人的信息存到list中
                        list.add(userFlightSeat);
                        //这样就可以执行更新语句
                        userflightseat_insert(list);
                    }else {
                        //satisfaction是用户满意度的，T代表满意，F表示不满意
                        userFlightSeat.setSatisfaction("F");

                        //一个人的信息全部填写完毕
                        //在这里将一个人的信息存到list中
                        list.add(userFlightSeat);
                        //这样就可以执行更新语句
                        userflightseat_insert(list);
                    }
                }
            } catch (SQLException e) {
//                e.printStackTrace();
            }

            //查询出来的结果集只有一条数据
            break;
        }
    }

    //更新用户座位信息使用的语句
    private void userflightseat_insert(List<UserFlightSeat> flightSeatList){

        for(int i=0;i<flightSeatList.size();i++){

            String sql="insert into user_flight_seat values(?,?,?,?,?,?,?)";
            Object[] ps=new Object[7];
            ps[0]=flightSeatList.get(i).getUser_id();
            ps[1]=flightSeatList.get(i).getFlight_number();
            ps[2]=flightSeatList.get(i).getWant_seat_attribute_one();
            ps[3]=flightSeatList.get(i).getWant_seat_attribute_second();
            ps[4]=flightSeatList.get(i).getSeat_id();
            ps[5]=flightSeatList.get(i).getSatisfaction();
            ps[6]=flightSeatList.get(i).getTeam();

            SqlHelper.getConnection();

            try {
                SqlHelper.executeUpdate(sql,ps);
            } catch (Exception e) {
//                e.printStackTrace();
            }
        }

    }

    //当传过来的用户是多人的时候，在这里执行更新指定飞机座位表
    private Boolean flight_seat_insert(List<UserFlightSeat> flightSeatList){
        for(int i=0;i<flightSeatList.size();i++){
            try {
                String sql="update "+flightSeatList.get(i).getFlight_number()+" set user_id=? where seat_id=?";
                Object[] ps=new Object[2];
                ps[0]=flightSeatList.get(i).getUser_id();
                ps[1]=flightSeatList.get(i).getSeat_id();

                SqlHelper.executeUpdate(sql,ps);

            } catch (Exception e) {
//                e.printStackTrace();
                return false;
            }
        }
        return true;
    }

}
