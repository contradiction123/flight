package cn.com.scitc.servlet;

import cn.com.scitc.dao.Dao;
import cn.com.scitc.model.FlightAttribute;
import cn.com.scitc.model.FlightModel;
import cn.com.scitc.model.UserAttribute;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@WebServlet(name = "createFlightServlet",urlPatterns = "/createFlight",asyncSupported = true)
public class createFlightServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");


        //用map来接收request发送过来的多维数组
        Map map = request.getParameterMap();
        //使用iter来接收map里面的json数组
        Iterator<String> iter = map.keySet().iterator();

        //创建一个座位属性类的列表来存储座位信息，
        // 因为现在不知道客户端的ajax传了多少座位信息过来
        List<FlightAttribute> flightAttributes=new ArrayList<>();
        //存储航班属性的
        FlightModel flightModel=new FlightModel();


        //创建一个while1整型变量，表示while外层循环次数
        int while1=0;


        //开始循环传过来的json数组
        while (iter.hasNext()) {
            //而且只循环八次，不管有没有第九个，都结束
            //外层的while主要工作就是获取航班信息的
            //就八次循环就可以了

            while1++;//循环一次就加一次好进行判断

            //当while1为9的时候就进行跳出,因为8以后的是每一个的座位信息，这个是在内while里运行的
            if(while1==9)break;

            //首先获取到当前的的名字
            String key = iter.next();
            //再根据名字来获取值
            //在这里接收的时候，不会管有几个值，都是数组
            // 就算是只有一个值也是数组，是有使用数组接收
            String[] value =  (String[]) map.get(key);

            //在传过来的json中
            // 第一个是航班号，
            // 第二个是航班行数
            //第三个是航班列数
            //第四个是：第一排是从多少号开始的
            //第五个是 航班列标
            //第六个是 行(hang)过道
            //第七个是 删除的座位号
            //第八个是 有多少个座位

            switch (while1){
                case 1:
                    //循环出数组的每一个值，其实只有一个值，就是表示航班号
                    for(String v:value){
                        flightModel.setName(v);
                    }
                    break;
                case 2:
                    //循环出数组的每一个值，其实只有一个值，就是表示航班行数
                    for(String v:value){
                        flightModel.setRow(v);
                    }
                    break;
                case 3:
                    //循环出数组的每一个值，其实只有一个值，就是表示航班列数
                    for(String v:value){
                        flightModel.setCol(v);
                    }
                    break;
                case 4:
                    //循环出数组的每一个值，其实只有一个值，就是表示航班第一排是从多少号开始的
                    for(String v:value){
                        flightModel.setStart_number(v);
                    }
                    break;
                case 5:
                    //循环出数组的每一个值，其实只有一个值，就是表示航班列标
                    for(String v:value){
                        flightModel.setSeat(v);
                    }
                    break;
                case 6:
                    //循环出数组的每一个值，其实只有一个值，就是表示行(hang)过道
                    for(String v:value){
                        flightModel.setRow_aisle(v);
                    }
                    break;
                case 7:
                    //循环出数组的每一个值，其实只有一个值，就是表示行(hang)过道
                    for(String v:value){
                        flightModel.setDelete_seat(v);
                    }
                    break;
                case 8:

                    //循环出数组的每一个值，其实只有一个值，就是表示有多少座位的
                    for(String v:value){

                        //在这里获取到座位数量，根据数量来创建一个二维数组，
                        // 第一个事表示第几个座位,第二个表示那10个属性
                        //座位id，
                        //座位号
                        //用户号
                        //child
                        //vip
                        //windows
                        //door
                        //middle
                        //aisle
                        //flight_number
                        String[][] userNume=new String[Integer.parseInt(v)][10];

                        //这里在创建一个iterator让他的内容再等于iter
                        Iterator<String> iterator=iter;

                        //创建整型的变量i，用来计数iterator里面json有多少数据
                        int i=0;

                        //开始循环json数据
                        while (iterator.hasNext()){
                            //循环一次就加一
                            i++;

                            //不管while是否会结束循环，在这里都进行判定
                            //json的数量应该是
                            //航班信息有7条，座位数量有一条 8条
                            //每个座位都有十条信息  10条
                            //所以进行判定 当前的运行次数大于 座位数量*10+8 时进行退出循环
                            if(i>Integer.parseInt(v)*10+8)break;

                            //当时前八次循环时，就退出当前循环，
                            // 因为第一次和第二次循环是航班号和人数的值，这在外层的while就获取到了
                            if(i<9)continue;

                            //当循环次数不是前两次时，
                            //定义整型变量ii，值是表示当前循环次数是第几个座位的信息
                            //定义整型变量iii，值是表示当前循环次数是这个座位的第几个信息
                            //i-8的原因是第一次和第二次是航班号和人数
                            int ii=((i-8)%10==0?(i-8)/10:(i-8)/10+1);
                            int iii=((i-8)%10==0?10:(i-8)%10);

                            //获取到当前json的名字
                            String key1 = iter.next();
                            //使用名字获取到当前名字的值
                            String[] value1 =  (String[]) map.get(key1);

                            //之前说过获取的值是数组，所以将值循环出来
                            for(String s:value1){
                                //将值放到对应的人，对应的位置上
                                //因为上面获取对的人和对应的位置是从1开始
                                //数组是从0开始，所以在赋值的时候进行减一
                                userNume[ii-1][iii-1]=s;
                            }
                        }//循环个人需求位置信息就完毕了


                        //以上的while循环完毕，之后将获取的座位信息
                        //以类的方式放入到 flightAttributes列表中
                        for(int j=0;j<userNume.length;j++){

                            FlightAttribute flightAttribute=new FlightAttribute();

                            flightAttribute.setId(Integer.parseInt(userNume[j][0]));
                            flightAttribute.setSeat_id(userNume[j][1]);
                            flightAttribute.setUser_id(null);
                            flightAttribute.setChild(userNume[j][3]);
                            flightAttribute.setVip(userNume[j][4]);
                            flightAttribute.setWindows(userNume[j][5]);
                            flightAttribute.setDoor(userNume[j][6]);
                            flightAttribute.setMiddle(userNume[j][7]);
                            flightAttribute.setAisle(userNume[j][8]);
                            flightAttribute.setFlight_number(userNume[j][9]);

                            flightAttributes.add(flightAttribute);
                        }
                    }//结束 获取座位数量的for循环 内层while循环
                    break;
            }
        }//外层的while结束

//        System.out.println("********************");
//        System.out.println(flightModel.getName());
//        System.out.println(flightModel.getSeat());
//        System.out.println(flightModel.getRow());
//        System.out.println(flightModel.getCol());
//        System.out.println(flightModel.getRow_aisle());
//        System.out.println(flightModel.getStart_number());
//        System.out.println(flightModel.getDelete_seat());
//        System.out.println("+**********************");
//
//        for(int i=0;i<flightAttributes.size();i++){
//            System.out.println();
//            System.out.println("+-----------------");
//            System.out.println(flightAttributes.get(i).getId());
//            System.out.println(flightAttributes.get(i).getSeat_id());
//            System.out.println(flightAttributes.get(i).getUser_id());
//            System.out.println(flightAttributes.get(i).getChild());
//            System.out.println(flightAttributes.get(i).getVip());
//            System.out.println(flightAttributes.get(i).getWindows());
//            System.out.println(flightAttributes.get(i).getDoor());
//            System.out.println(flightAttributes.get(i).getMiddle());
//            System.out.println(flightAttributes.get(i).getAisle());
//            System.out.println(flightAttributes.get(i).getFlight_number());
//            System.out.println("--------------------");
//        }

        new Dao().createFlight(flightModel,flightAttributes);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
