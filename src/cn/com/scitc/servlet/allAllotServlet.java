package cn.com.scitc.servlet;

import cn.com.scitc.dao.Dao;
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

@WebServlet(name = "allAllotServlet",urlPatterns = "/allAllotservlet")
public class allAllotServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");


        //用map来接收request发送过来的多维数组
        Map map = request.getParameterMap();
        //使用iter来接收map里面的json数组
        Iterator<String> iter = map.keySet().iterator();

        //创建一个用户属性类的列表来存储用户属性，
        // 因为现在不知道客户端的ajax传了多少人的要求过来
        List<UserAttribute> userAttributeList=new ArrayList<>();

        //创建一个while1整型变量，表示while外层循环次数
        int while1=0;
        //创建一个字符串来存储航班号
        String flight_number="";

        //存放一个用户数量
        Integer single=0;
        //存放团队用户的数量
        Integer team=0;

        //开始循环传过来的json数组
        while (iter.hasNext()) {
            //而且只循环两次，不管有没有第三个，都结束
            //外层的while主要工作就是获取航班号，
            //就两次循环就可以了

            while1++;//循环一次就加一次好进行判断

            //当while1为3的时候就进行跳出,因为2以后的是用户的座位属性要求，这个是在内while里运行的
            if(while1==3)break;

            //首先获取到当前的的名字
            String key = iter.next();
            //再根据名字来获取值
            //在这里接收的时候，不会管有几个值，都是数组
            // 就算是只有一个值也是数组，是有使用数组接收
            String[] value =  (String[]) map.get(key);

            //在传过来的json中第一个是航班号，第二个是人数，所以在这里要进行判断
            if(while1==1){
                //循环出数组的每一个值，其实只有一个值，就是表示航班号
                for(String v:value){
                    flight_number=v;
                }
            }else {
                //因为在这里while1的值只有1和2，当为3的时候就会跳出，所以这里可以是使用else

                //循环出数组的每一个值，其实只有一个值，就是表示有多少人的
                for(String v:value){
                    //在这里获取到人数，根据人数来创建一个二维数组，
                    // 第一个事表示第几个人,第二个表示那三个属性
                    //用户id，第一想要属性type_one,第二想要属性type_second,第四个属性是 是否是团队
                    String[][] userNume=new String[Integer.parseInt(v)][4];

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
                        //航班号  一条
                        // 有多少人  一条
                        //每一个人都有四条信息  四条
                        //所以进行判定 当前的运行次数大于 人数*4+2 时进行退出循环
                        if(i>Integer.parseInt(v)*4+2)break;

                        //当时第一次和第二次循环时，就退出当前循环，
                        // 因为第一次和第二次循环是航班号和人数的值，这在外层的while就获取到了
                        if(i==1||i==2)continue;

                        //当循环次数不是前两次时，
                        //定义整型变量ii，值是表示当前循环次数是第几个人的信息
                        //定义整型变量iii，值是表示当前循环次数是这个人的第几个信息
                        //i-2的原因是第一次和第二次是航班号和人数
                        int ii=((i-2)%4==0?(i-2)/4:(i-2)/4+1);
                        int iii=((i-2)%4==0?4:(i-2)%4);

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


                    //以上的while循环完毕，之后将获取的个人需求座位信息
                    //以类的方式放入到userAttributeList列表中
                    for(int j=0;j<userNume.length;j++){
                        UserAttribute userAttribute=new UserAttribute();

                        userAttribute.setId(userNume[j][0]);
                        userAttribute.setType_one(userNume[j][1]);
                        userAttribute.setType_second(userNume[j][2]);
                        userAttribute.setHeader(userNume[j][3]);


                        //再这里获取单人用户多，还是团队用户多
                        if(userNume[j][3].length()>2){
                            team++;
                        }else {
                            single++;
                        }

                        userAttributeList.add(userAttribute);
                    }
                }//结束 获取人数的for循环 内层while循环
            }//if判断while1的值结束

        }//外层的while结束

//        for(int i=0;i<userAttributeList.size();i++){
//            System.out.println(userAttributeList.get(i).getId());
//            System.out.println(userAttributeList.get(i).getType_one());
//            System.out.println(userAttributeList.get(i).getType_second());
//            System.out.println(userAttributeList.get(i).getHeader());
//            System.out.println(flight_number);
//            System.out.println("********************");
//        }

        System.out.println(flight_number);

//        循环完毕后所有的用户都在 userAttributeList
//        单人和团队的数量也弄完了
        if(single>team){
            System.out.println("single");
            System.out.println(new Dao().allAllotuser_single(userAttributeList,flight_number));
        }else {
            System.out.println("team");
            //TODO 这里应该是allAllotuser_team但是还有没有写好
            System.out.println(new Dao().allAllotuser_single(userAttributeList,flight_number));
        }
        System.out.println("完毕");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
