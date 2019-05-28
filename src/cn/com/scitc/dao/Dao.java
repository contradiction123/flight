package cn.com.scitc.dao;

import cn.com.scitc.model.*;
import cn.com.scitc.thread.AllUserFlightSeatUpdate;
import cn.com.scitc.thread.UserFlightSeatUpdate;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.sql.*;

public class Dao {

    //这是查询b737-700的表格的
    public List<B737_700> b7377select(){
        String sql="select * from b737_700 order by id";
        List<B737_700> b737_700s=new ArrayList<>();

        SqlHelper.getConnection();
        ResultSet resultSet=SqlHelper.executeQuery(sql,null);

        try {
            while (resultSet.next()){
                B737_700 b737_700=new B737_700();

                b737_700.setId(resultSet.getInt("id"));
                b737_700.setSeat_id(resultSet.getString("seat_id"));
                b737_700.setUser_id(resultSet.getString("user_id"));
                b737_700.setChild(resultSet.getString("child"));
                b737_700.setVip(resultSet.getString("vip"));
                b737_700.setWindows(resultSet.getString("windows"));
                b737_700.setDoor(resultSet.getString("door"));
                b737_700.setMiddle(resultSet.getString("middle"));
                b737_700.setAisle(resultSet.getString("aisle"));

                b737_700s.add(b737_700);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return b737_700s;
    }

    //这是给航班分配一个人时的语句
    public String allot(List<UserAttribute> userAttributeList,String flight_number){
        String sql;
        if(userAttributeList.get(0).getType_one()=="null"||userAttributeList.get(0).getType_second()=="null"){
            if(userAttributeList.get(0).getType_one()=="null"){
                sql="select * from "+flight_number+" where (" +
                        "("+userAttributeList.get(0).getType_second()+"='1' and user_id is null ) or " +
                        "user_id is null order by "+userAttributeList.get(0).getType_one()+" desc,"+userAttributeList.get(0).getType_second()+" desc, middle desc";

            }else {
                sql="select * from "+flight_number+" where ("+userAttributeList.get(0).getType_one()+"='1' and user_id is null ) or " +
                        "user_id is null order by "+userAttributeList.get(0).getType_one()+" desc,"+userAttributeList.get(0).getType_second()+" desc, middle desc";

            }
        }else {
            sql="select * from "+flight_number+" where ("+userAttributeList.get(0).getType_one()+"='1' and user_id is null ) or " +
                    "("+userAttributeList.get(0).getType_second()+"='1' and user_id is null ) or " +
                    "user_id is null order by "+userAttributeList.get(0).getType_one()+" desc,"+userAttributeList.get(0).getType_second()+" desc, middle desc";
        }

        SqlHelper.getConnection();
        ResultSet resultSet=SqlHelper.executeQuery(sql,null);

        try {
            while (resultSet.next()){

                FlightAttribute flightAttribute=new FlightAttribute();
                flightAttribute.setSeat_id(resultSet.getString("seat_id"));
                flightAttribute.setUser_id(userAttributeList.get(0).getId());

                //先把同用的座位属性存放在list集合
                List<FlightAttribute> flightAttributes=new ArrayList<>();
                flightAttributes.add(flightAttribute);

                //然后实例一个子线程用来存放用户是否满意
                //userAttributeList这里面存放的是用户的id，想要的第一位置，第二位置，买票人
                //flight_number这是航班号
                //flightAttributes这是存放分配好的座位号，和用户账户
                //最后的1，代表的意思是一人
                UserFlightSeatUpdate userFlightSeatUpdate=new UserFlightSeatUpdate(userAttributeList,flight_number,flightAttributes,1);
                //运行子线程
                userFlightSeatUpdate.start();

                //不管子线程如何，执行更新语句将用户的座位更新到指定的航班座位中
                if(update(flightAttribute,flight_number)){
                    //更新成功返回分配的座位
                    return  flightAttribute.getSeat_id();
                }
            }
            //没有更新成功返回null
            return null;
        } catch (SQLException e) {
            //没有更新成功返回null
//            e.printStackTrace();
            return null;
        }
    }

    //这是给航班分配八个人的语句
    public List<String> allotEight(List<UserAttribute> userAttributeList,String flight_number){
        //查询指定航班的列数
        Integer flightColumn=selectFlightColumn(flight_number);
        //所有的座位都在flightAttributes中
        List<FlightAttribute> flightAttributes=nullseat(flight_number);
        //存放已经分配的人数
        Integer allotusernumber=0;
        //存放已经分派好的座位
        List<String> allotseatlist=new ArrayList<>();
        //存放是否满意，我的定义是超过一个人分配在一起就满意
        List<String> satisfactionlist=new ArrayList<>();

        //这里开始分配座位，分配完毕就结束
        //TODO 这个分配不是好的分配希望能改善
        while (allotusernumber!=userAttributeList.size()){
            Integer numbertemp=0;
            //如果要分配的人数大于已知的列数，则分配的人数numbertemp=列数,否则等于总人数
            if((userAttributeList.size()-allotusernumber)>flightColumn){
                numbertemp=flightColumn;
            }else {
                numbertemp=userAttributeList.size()-allotusernumber;
            }
            while (true){

                List<String> stringlist=allotnumberseat(numbertemp,flightColumn,flightAttributes);
                if(stringlist.get(0).equals("T")){
                    for(int ii=0;ii<numbertemp;ii++){
                        allotseatlist.add(stringlist.get(ii+2));

                        Iterator<FlightAttribute> it = flightAttributes.iterator();
                        while(it.hasNext()){
                            FlightAttribute x = it.next();
                            if(x.getSeat_id().equals(stringlist.get(ii+2))){
                                it.remove();
                            }
                        }

                        if(numbertemp>1){
                            satisfactionlist.add("T");
                        }else {
                            satisfactionlist.add("F");
                        }
                    }
                    allotusernumber+=numbertemp;
                    break;
                }else {
                    numbertemp--;
                }
                stringlist.clear();
            }
        }

        //分配结束后，开始吧每一个人座位信息存到userFlightSeatList集合里面
        //分配好的的座位在allotseatlist
        //满意度是在satisfactionlist
        //航班号就在flight_number
        //当时团队分配时，就没有属性要求，直接分配在一起就行

        List<UserFlightSeat> userFlightSeatList=new ArrayList<>();
        for(int i=0;i<userAttributeList.size();i++){
            UserFlightSeat userFlightSeat=new UserFlightSeat();

            userFlightSeat.setUser_id(userAttributeList.get(i).getId());
            userFlightSeat.setWant_seat_attribute_one(userAttributeList.get(i).getType_one());
            userFlightSeat.setWant_seat_attribute_second(userAttributeList.get(i).getType_second());
            userFlightSeat.setSeat_id(allotseatlist.get(i));
            userFlightSeat.setSatisfaction(satisfactionlist.get(i));
            userFlightSeat.setFlight_number(flight_number);
            userFlightSeat.setTeam(userAttributeList.get(0).getId());

            userFlightSeatList.add(userFlightSeat);
        }

        //将所有的用户信息安排好之后就是将座位反馈到前端和存到数据库
        //启动子线程来更新数据库
        UserFlightSeatUpdate userFlightSeatUpdate=new UserFlightSeatUpdate(userFlightSeatList,userAttributeList.size());
        userFlightSeatUpdate.start();
        //将分配的座位字符串返回
        return allotseatlist;
    }

    //给指定人数的用户分配座位，人数不超过航班的列数,参数是用户的数量和座位列数,航班号
    //简单一点说这个方法是给用户分配连坐的
    private List<String> allotnumberseat(Integer usernumber,Integer seatcolumn,String flight_number){
        //定义一个返回的字符串列表
        //这个字符串列表第一个是T或者F，表示分配座位成功，失败
        //成功的的话列表就会加入座位号
        //失败就只有一个F
        //首先存进一个F
        List<String> allotseat=new ArrayList<>();
        allotseat.add("F");

        String sql="select * from "+flight_number+" where user_id is null order by id";
        SqlHelper.getConnection();
        ResultSet resultSet=SqlHelper.executeQuery(sql,null);

        List<FlightAttribute> flightAttributes=new ArrayList<>();
        //起始的座位，位数，查询出来的位置的第几个，第一条数据就是第一个
        int seatstart=0;
        try {
            while (resultSet.next()){
                FlightAttribute flightAttribute=new FlightAttribute();
                flightAttribute.setSeat_id(resultSet.getString("seat_id"));
                flightAttribute.setWindows(resultSet.getString("windows"));
                flightAttribute.setId(resultSet.getInt("id"));

                flightAttributes.add(flightAttribute);
                //如果座位的起始位数到存进来的位数，之前的差是等于要分配的个数的话就执行if
                if((flightAttributes.size()-seatstart)==usernumber){
                    //首先判断id是不是连续的不是连续的直接pass
                    Boolean judge=true;
                    for(int i=flightAttributes.size()-1;i>seatstart;i--){
                        if(flightAttributes.get(i).getId()-1!=flightAttributes.get(i-1).getId()){
                            //如果不是连续的就将当前的id存进安排座位的起始值
                            seatstart=i;
                            //并且告诉判断条件judge这组数据不成立
                            judge=false;
                            //退出这个小循环
                            break;
                        }
                    }

                    //只有在数据是连续的时候，judge的值才是true，这里才能执行下去
                    if(judge){
                        //当数据的座位是连续的时候，就该判断他们的座位是不是在一排中
                        for(int i=flightAttributes.size()-1;i>seatstart;i--){
                            if(Integer.parseInt(flightAttributes.get(i).getWindows())==1){
                                //判断上面一个座位的是否是靠窗的，如果是靠窗的话，开始分配的座位就是i
                                //如果不是靠窗的，开始分配的座位就是i+1
                                if(Integer.parseInt(flightAttributes.get(i-1).getWindows())==1){
                                    seatstart=i;
                                }else{
                                    seatstart=i+1;
                                }
                                //并且告诉判断条件judge这组数据不成立
                                judge=false;
                                //退出这个小循环
                                break;
                            }
                        }
                    }
                    //只有在数据是同一排的时候，judge的值才是true，这里才能执行下去
                    if(judge){
                        //首先将字符串列表allotseat清空
                        allotseat.clear();
                        //再存进T和座位号
                        allotseat.add("T");

                        for(int i=seatstart;i<flightAttributes.size();i++){
                            allotseat.add(flightAttributes.get(i).getSeat_id());
                        }
                        break;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allotseat;
    }

    //查看指定航班有多少列的方法,参数是发送过来的航班号
    private Integer selectFlightColumn(String flight_number){
        //把这个航班内的所有的数据全部查出来
        String sql="select * from "+flight_number+" order by id";

        SqlHelper.getConnection();
        ResultSet resultSet=SqlHelper.executeQuery(sql,null);

        //用来计数,记录列有多少条？
        Integer count=0;
        //用来记录挨着窗子的第二个座位是那个
        int windowscount=0;
        try {
            while (resultSet.next()){
                count++;
                //将第一个和第二个靠在窗子边上的座位记录下来
                int windowsisof=Integer.parseInt(resultSet.getString("windows"));
                if(windowsisof==1)windowscount++;

                //当得到第二个靠窗的时候，就得到了一列有多少个座位，所以就可以结束循环了
                if(windowscount==2)break;
            }
        } catch (SQLException e) {
//            e.printStackTrace();
        }

        return count;
    }

    //这是给航班更新用id时的
    public boolean update(FlightAttribute flightAttribute,String flight_number){
        try {
            System.out.println("update");
            String sql="update "+flight_number+" set user_id=? where seat_id=?";
            Object[] ps=new Object[2];
            ps[0]=flightAttribute.getUser_id();
            ps[1]=flightAttribute.getSeat_id();

            SqlHelper.executeUpdate(sql,ps);
            //更新成功返回true，表示成功
            return true;
        } catch (Exception e) {
//            e.printStackTrace();
            //更新失败返回false，表示失败
            return false;
        }
    }

    //这是查询指定航班的那些有人的语句
    public List<String> flightselect_seat(String flight_number){
        String sql="select * from "+flight_number+" where user_id is not null";
        List<String> select_seat=new ArrayList<>();

        SqlHelper.getConnection();
        ResultSet resultSet=SqlHelper.executeQuery(sql,null);

        try {
            while (resultSet.next()){
                select_seat.add(resultSet.getString("seat_id"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return select_seat;
    }

    //查看指定航班的用户对座位是否满意的
    //返回的是一个字符串——31K zZz T ZzZ 32A zZz F
    //ZzZ是座位之间的间隔
    //zZz是座位号和满意之间的间隔
    public String satisfaction(String flight_number){
        String seat_satisfaction="";

        String sql="select * from user_flight_seat where flight_number='"+flight_number+"'";

        SqlHelper.getConnection();
        ResultSet resultSet=SqlHelper.executeQuery(sql,null);

        try {
            while (resultSet.next()){
                seat_satisfaction+=resultSet.getString("seat_id")+"zZz";
                seat_satisfaction+=resultSet.getString("satisfaction")+"ZzZ";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        System.out.println(sql);
        return seat_satisfaction;
    }



    //这是分配先单人的
    //接收整机分配的，参数有整机所有人
    public boolean allAllotuser_single(List<UserAttribute> userAttributeList,String flight_number){
        Connection connection=SqlHelper.getConnection();
        //存放所有查询出来的座位
        List<FlightAttribute> flightAttributes=nullseat(flight_number);
        //存放查询出来用户的座位和满意度的
        List<UserFlightSeat> userFlightSeatList=new ArrayList<>();



//        for(int i=0;i<flightAttributes.size();i++){
//            System.out.println(flightAttributes.get(i).getId());
//            System.out.println(flightAttributes.get(i).getSeat_id());
//            System.out.println(flightAttributes.get(i).getWindows());
//            System.out.println("****************");
//        }


        for(int i=0;i<userAttributeList.size();i++){
            Boolean judge=true;

            for(int j=0;j<flightAttributes.size();j++){
                if(flightAttributes.get(j).get(userAttributeList.get(i).getType_one())==1||
                        flightAttributes.get(j).get(userAttributeList.get(i).getType_second())==1){

                    UserFlightSeat userFlightSeat=new UserFlightSeat();

                    userFlightSeat.setUser_id(userAttributeList.get(i).getId());
                    userFlightSeat.setTeam(userAttributeList.get(i).getHeader());
                    userFlightSeat.setFlight_number(flight_number);
                    userFlightSeat.setWant_seat_attribute_second(userAttributeList.get(i).getType_second());
                    userFlightSeat.setWant_seat_attribute_one(userAttributeList.get(i).getType_one());

                    userFlightSeat.setSeat_id(flightAttributes.get(j).getSeat_id());
                    userFlightSeat.setSatisfaction("T");

                    userFlightSeat.setAllot_course((i+1));

                    //先把使用的座位属性存放在list集合
                    userFlightSeatList.add(userFlightSeat);

                    judge=false;
                    flightAttributes.remove(j);
                    break;
                }
            }

            if(judge){
                UserFlightSeat userFlightSeat=new UserFlightSeat();

                userFlightSeat.setUser_id(userAttributeList.get(i).getId());
                userFlightSeat.setTeam(userAttributeList.get(i).getHeader());
                userFlightSeat.setFlight_number(flight_number);
                userFlightSeat.setWant_seat_attribute_second(userAttributeList.get(i).getType_second());
                userFlightSeat.setWant_seat_attribute_one(userAttributeList.get(i).getType_one());

                userFlightSeat.setSeat_id(flightAttributes.get(0).getSeat_id());
                userFlightSeat.setSatisfaction("F");
                userFlightSeat.setAllot_course((i+1));
                userFlightSeatList.add(userFlightSeat);
                flightAttributes.remove(0);
            }

        }



//        for(int i=0;i<userFlightSeatList.size();i++){
//            System.out.println(userFlightSeatList.get(i).getUser_id());
//            System.out.println(userFlightSeatList.get(i).getSeat_id());
//            System.out.println(userFlightSeatList.get(i).getFlight_number());
//            System.out.println(userFlightSeatList.get(i).getWant_seat_attribute_one());
//            System.out.println(userFlightSeatList.get(i).getWant_seat_attribute_second());
//            System.out.println(userFlightSeatList.get(i).getTeam());
//            System.out.println(userFlightSeatList.get(i).getSatisfaction());
//            System.out.println("*************");
//        }



        try {
            //执行更新多人的update
            updateAllot(userFlightSeatList,connection);
            connection.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }



    //这是分配先团队的
    //接收整机分配的，参数有整机所有人

    public Boolean allAllotuser_team(List<UserAttribute> userAttributeList,String flight_number){

//        System.out.println("进入正题分配");

        //所有的座位都在flightAttributes中
        List<FlightAttribute> flightAttributes=nullseat(flight_number);

        List<UserFlightSeat> userFlightSeats=new ArrayList<>();

        //查询指定航班的列数
        Integer flightColumn=selectFlightColumn(flight_number);

        //团队的名字
        //团队名字出现的次数
        List<String> teamname=new ArrayList<>();
        List<Integer> teamtime=new ArrayList<>();

        //定义一个整型变量计数,记录分配过程从1开始
        Integer allotCourse=0;

        //设置挑选出现团队的名字和次数
        for(int i=0;i<userAttributeList.size();i++){
            //当团队名字大于了1，证明有团队，不是单人，才执行下面
            if(userAttributeList.get(i).getHeader().length()>2){
                //judge表示团队的名字我记录没有，默认没有记录
                //true代表没有记录，可以记录的意思
                //flase代表记录了，不可以记录
                Boolean judge=true;

                //在这里进行循环判断可不可以记录新的团队名
                for(int j=0;j<teamname.size();j++){
                    judge=true;
                    //如果出现了相同的名字，那么久不能增加，而是在旧的次数上加一
                    if(userAttributeList.get(i).getHeader().equals(teamname.get(j))){
                        //先设置不能增加了
                        judge=false;

                        //再 在旧的次数上加一
                        teamtime.add(j,(teamtime.get(j)+1));

                        break;
                    }
                }

                if(judge){
                    //true_可以记录,并且在出现次数的list中记录出现次数为一
                    teamname.add(userAttributeList.get(i).getHeader());
                    teamtime.add(teamname.size()-1,1);

                }

            }
        }

        //依次找出出现最多和出现最少的团队，相当于从大到小排序，但是不排序,并且分配
        while(teamname.size()>0){
            int max=0;
            //这个循环会找出最大数，是teamtime的第几个
            for(int j=0;j<teamname.size();j++){
                if(teamtime.get(max)<teamtime.get(j)){
                    max=j;
                }
            }
//                    System.out.println("最大团队数"+teamname.get(max)+"+"+teamtime.get(max));

            //开始分配这个团队，将是这个团队的人集中在一起
            //显示正在分配的团队名字或者是队长名字
//                System.out.println(teamname.get(max));
//                System.out.println("所有用户的人数："+userAttributeList.size());
            List<UserAttribute> templist=new ArrayList<>();
            for(int j=0;j<userAttributeList.size();j++){
                if(userAttributeList.get(j).getHeader().equals(teamname.get(max))){
                    templist.add(userAttributeList.get(j));
                    //这里一边集中团队的人一边清理团队的人
                    userAttributeList.remove(j);
                    j--;
                }
            }
//                System.out.println("现在用户的人数："+userAttributeList.size());
            //显示挑选出来的人的属性
//                for(int i=0;i<templist.size();i++){
//                    System.out.println(templist.get(i).getId()+","+templist.get(i).getHeader());
//                }

//                System.out.println(templist.get(0).getHeader());

            //开始分配
            //存放已经分配的人数
            Integer allotusernumber=0;
            //存放已经分派好的座位
            List<String> allotseatlist=new ArrayList<>();
            //存放是否满意，我的定义是超过一个人分配在一起就满意
            List<String> satisfactionlist=new ArrayList<>();

            //这里开始分配座位，分配完毕就结束


            while (allotusernumber!=templist.size()){
                Integer numbertemp=0;
                //如果要分配的人数大于已知的列数，则分配的人数numbertemp=列数,否则等于总人数
                if((templist.size()-allotusernumber)>flightColumn){
                    numbertemp=flightColumn;
                }else {
                    numbertemp=templist.size()-allotusernumber;
                }
//                System.out.println(templist.size()+","+numbertemp);
                while (true){

                    List<String> stringlist=allotnumberseat(numbertemp,flightColumn,flightAttributes);
//                        System.out.println(templist.get(0).getHeader()+","+numbertemp);
//                    System.out.println("断点");
                    if(stringlist.get(0).equals("T")){
                        for(int ii=0;ii<numbertemp;ii++){
                            allotseatlist.add(stringlist.get(ii+2));

                            Iterator<FlightAttribute> it = flightAttributes.iterator();
                            while(it.hasNext()){
                                FlightAttribute x = it.next();
                                if(x.getSeat_id().equals(stringlist.get(ii+2))){
                                    it.remove();
                                }
                            }

                            if(numbertemp>1){
                                satisfactionlist.add("T");
                            }else {
                                satisfactionlist.add("F");
                            }
                        }
                        allotusernumber+=numbertemp;
                        break;
                    }else {
                        numbertemp--;
                    }
                    stringlist.clear();
                }
            }

//                System.out.println(templist.get(0).getId()+"分配其中一个团队结束"+flightAttributes.size());

//                分配结束后，开始吧每一个人座位信息存到userFlightSeatList集合里面
//                分配好的的座位在allotseatlist
//                满意度是在satisfactionlist
//                航班号就在flight_number
//                当时团队分配时，就没有属性要求，直接分配在一起就行
            //allotCoures表示这个团队分配的顺序是第几个
            allotCourse++;
            for(int ii=0;ii<templist.size();ii++){
                UserFlightSeat userFlightSeat=new UserFlightSeat();

                userFlightSeat.setUser_id(templist.get(ii).getId());
                userFlightSeat.setWant_seat_attribute_one(templist.get(ii).getType_one());
                userFlightSeat.setWant_seat_attribute_second(templist.get(ii).getType_second());
                userFlightSeat.setSeat_id(allotseatlist.get(ii));
                userFlightSeat.setSatisfaction(satisfactionlist.get(ii));
                userFlightSeat.setFlight_number(flight_number);
                userFlightSeat.setTeam(templist.get(0).getId());
                userFlightSeat.setAllot_course((allotCourse));

                userFlightSeats.add(userFlightSeat);
            }

            //分配完毕,清除这个列表
            templist.clear();



            teamname.remove(max);
            teamtime.remove(max);

        }



        //上面分配完团队后会剩下单人，开始分配单人
        //因为在上面一边分配，一边清理，所以这时候应该只剩下单人了
        for(int i=0;i<userAttributeList.size();i++){
            Boolean judge=true;

            for(int j=0;j<flightAttributes.size();j++){
                if(flightAttributes.get(j).get(userAttributeList.get(i).getType_one())==1||
                        flightAttributes.get(j).get(userAttributeList.get(i).getType_second())==1){

                    UserFlightSeat userFlightSeat=new UserFlightSeat();

                    userFlightSeat.setUser_id(userAttributeList.get(i).getId());
                    userFlightSeat.setTeam(userAttributeList.get(i).getHeader());
                    userFlightSeat.setFlight_number(flight_number);
                    userFlightSeat.setWant_seat_attribute_second(userAttributeList.get(i).getType_second());
                    userFlightSeat.setWant_seat_attribute_one(userAttributeList.get(i).getType_one());

                    userFlightSeat.setSeat_id(flightAttributes.get(j).getSeat_id());
                    userFlightSeat.setSatisfaction("T");
                    userFlightSeat.setAllot_course((++allotCourse));

                    //先把使用的座位属性存放在list集合
                    userFlightSeats.add(userFlightSeat);

                    judge=false;
                    flightAttributes.remove(j);
                    break;
                }
            }

            if(judge){
                UserFlightSeat userFlightSeat=new UserFlightSeat();

                userFlightSeat.setUser_id(userAttributeList.get(i).getId());
                userFlightSeat.setTeam(userAttributeList.get(i).getHeader());
                userFlightSeat.setFlight_number(flight_number);
                userFlightSeat.setWant_seat_attribute_second(userAttributeList.get(i).getType_second());
                userFlightSeat.setWant_seat_attribute_one(userAttributeList.get(i).getType_one());

                userFlightSeat.setSeat_id(flightAttributes.get(0).getSeat_id());
                userFlightSeat.setSatisfaction("F");
                userFlightSeat.setAllot_course((++allotCourse));

                userFlightSeats.add(userFlightSeat);
                flightAttributes.remove(0);
            }
        }

        try {
            Connection connection=SqlHelper.getConnection();
            //执行更新多人的update
            updateAllot(userFlightSeats,connection);
            connection.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    //首先把所有的空座位查出来放在座位list中,并返回
    private List<FlightAttribute> nullseat(String flight_number){

        //存放所有查询出来的座位
        List<FlightAttribute> flightAttributes=new ArrayList<>();

        String sql="";

        //首先把所有的空座位查出来放在座位list中
        sql="select * from "+flight_number+" where user_id is null order by id";
        SqlHelper.getConnection();
        ResultSet resultSet=SqlHelper.executeQuery(sql,null);
//        System.out.println(sql);
        try {
            while (resultSet.next()){
                FlightAttribute flightAttribute=new FlightAttribute();

                flightAttribute.setId(resultSet.getInt("id"));
                flightAttribute.setSeat_id(resultSet.getString("seat_id"));
                flightAttribute.setChild(resultSet.getString("child"));
                flightAttribute.setVip(resultSet.getString("vip"));
                flightAttribute.setWindows(resultSet.getString("windows"));
                flightAttribute.setDoor(resultSet.getString("door"));
                flightAttribute.setMiddle(resultSet.getString("middle"));
                flightAttribute.setAisle(resultSet.getString("aisle"));

                flightAttributes.add(flightAttribute);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flightAttributes;
    }


    //更新多人的的update
    private boolean updateAllot(List<UserFlightSeat> userFlightSeatList,Connection connection){

        String sql="UPDATE "+userFlightSeatList.get(0).getFlight_number()+" SET user_id = CASE seat_id ";
        String wherein="";
        for(int i=0;i<userFlightSeatList.size();i++){

            sql+=" WHEN \""+userFlightSeatList.get(i).getSeat_id()+"\" THEN '"+userFlightSeatList.get(i).getUser_id()+"' ";
            wherein+=" \""+userFlightSeatList.get(i).getSeat_id()+"\"";
            if(i!=userFlightSeatList.size()-1){
                wherein+=",";
            }
        }

        sql+="END WHERE id IN (select a.id from (select id from "+userFlightSeatList.get(0).getFlight_number()+" where seat_id in("+wherein+"))a )";



//        System.out.println(sql);

        try {
            SqlHelper.executeUpdate(sql,null,connection);

            //然后实例一个子线程用来存放用户是否满意
            //userAttributeList这里面存放的是用户的id，想要的第一位置，第二位置，买票人
            //flight_number这是航班号
            //flightAttributes这是存放分配好的座位号，和用户账户
            AllUserFlightSeatUpdate allalluserFlightSeatUpdate=new AllUserFlightSeatUpdate(userFlightSeatList);
            //运行子线程
            allalluserFlightSeatUpdate.start();
            return true;
        }catch (Exception e){

        }

        return false;
    }

    //给指定人数的用户分配座位，人数不超过航班的列数,参数是用户的数量和座位列数,航班号
    //简单一点说这个方法是给用户分配连坐的
    private List<String> allotnumberseat(Integer usernumber,Integer seatcolumn,List<FlightAttribute> flightAttributes){
        //定义一个返回的字符串列表
        //这个字符串列表第一个是T或者F，表示分配座位成功，失败
        //成功的的话列表就会加入座位号
        //失败就只有一个F
        //首先存进一个F
        List<String> allotseat=new ArrayList<>();
        allotseat.add(0,"F");

        //起始的座位，位数，查询出来的位置的第几个，第一条数据就是第一个
        int seatstart=0;
        int count=0;
        List<String> seattemp=new ArrayList<>();
        for(int i=0;i<flightAttributes.size();i++){
            if(i==0){
                seatstart=i;
                count=1;
                seattemp.add(flightAttributes.get(i).getSeat_id());
            }else {
                if(flightAttributes.get(i).getId()-1==flightAttributes.get(i-1).getId()){
                    count++;
                    seattemp.add(flightAttributes.get(i).getSeat_id());
                }else {
                    seatstart=i;
                    count=1;
                    seattemp.clear();
                    seattemp.add(flightAttributes.get(i).getSeat_id());
                }
            }

            if(count==usernumber){
                Boolean judeg=false;
                //当数据的座位是连续的时候，就该判断他们的座位是不是在一排中
                //当数据的座位是连续的时候，就该判断他们的座位是不是在一排中
                //numnumber这个变量是一直与其他座位进行比较的
                int numnumber=0;
                for(int j=seatstart+usernumber-1;j>seatstart;j--){
                    //获取每一个座位的排数
                    int number=0;
                    //获取数字，31A 中获取31
                    for(int ii=0;ii<flightAttributes.get(j).getSeat_id().length();ii++) {
                        if((int)(flightAttributes.get(j).getSeat_id().charAt(ii))<58) {
                            number++;
                        }else {
                            break;
                        }
                    }
//                    System.out.println(number);
                    //判断是否是第一次获取座位数,是的话讲第一个存进numnumber
                    //不是第一个的话，将第一个numnumber与每一个number进行比较
                    //相同则这证明是同一排
                    //不相同则证明不是同一排
                    if(j==(seatstart+usernumber-1)){
                        numnumber=number;
                        continue;
                    }else {
                        if(numnumber==number){
                            continue;
                        }else {
                            seatstart=j+1;
                            judeg=true;
                            break;
                        }
                    }

                }

                if(judeg){
                    i=seatstart;
                    count=1;
                    seattemp.clear();
                    seattemp.add(flightAttributes.get(i).getSeat_id());
                }else {
                    allotseat.add(0,"T");
                    break;
                }
            }
        }

        for(int i=0;i<seattemp.size();i++){
            allotseat.add(seattemp.get(i));
        }

        return allotseat;
    }


    //查看飞机机型
    public List<FlightModel> findAllFlightmodel(){
        List<FlightModel> flightModelList = new ArrayList<FlightModel>();
        String sql = "select * from flight_model";
        SqlHelper.getConnection();
        ResultSet resultSet = SqlHelper.executeQuery(sql,null);
        try {
            while (resultSet.next()){
                FlightModel model = new FlightModel();
                model.setId(resultSet.getInt("id"));
                model.setName(resultSet.getString("name"));
                flightModelList.add(model);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return flightModelList;
    }

    //获取分配过程
    public String allotCourse(String flight_number){
        String allotCourseString="";

        String sql="select * from user_flight_seat where flight_number='"+flight_number+"' order by allot_course;";

        SqlHelper.getConnection();
        ResultSet resultSet=SqlHelper.executeQuery(sql,null);

        //记录有多少条数据
        int count=0;
        int last_allot_course=0;
        try {
            while (resultSet.next()){
                count++;
                if(count==1){
                    allotCourseString+=resultSet.getString(1)+"zZz";//第一个人的账号
                    allotCourseString+=resultSet.getInt(8)+"zZz";//allot_course
                    allotCourseString+=resultSet.getString(1)+"zZz";//user_id
                    allotCourseString+=resultSet.getString(5)+"zZz";//seat_id
                    allotCourseString+=resultSet.getString(6)+"zZz";//satasfiaction

                    last_allot_course=resultSet.getInt(8);
                }else {
                    if(resultSet.getInt(8)==last_allot_course){
                        allotCourseString+=resultSet.getString(1)+"zZz";//user_id
                        allotCourseString+=resultSet.getString(5)+"zZz";//seat_id
                        allotCourseString+=resultSet.getString(6)+"zZz";//satasfiaction
                    }else {
                        allotCourseString+="YyY";//结束上一队

                        allotCourseString+=resultSet.getString(1)+"zZz";//第一个人的账号
                        allotCourseString+=resultSet.getInt(8)+"zZz";//allot_course
                        allotCourseString+=resultSet.getString(1)+"zZz";//user_id
                        allotCourseString+=resultSet.getString(5)+"zZz";//seat_id
                        allotCourseString+=resultSet.getString(6)+"zZz";//satasfiaction

                        last_allot_course=resultSet.getInt(8);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        allotCourseString+="YyY";//结束上一队

//        System.out.println(count);
//        System.out.println(allotCourseString);

        return allotCourseString;
    }
}
