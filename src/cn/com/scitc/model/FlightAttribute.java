package cn.com.scitc.model;

//这是所有飞机的基础模型如果那些没加上的请自行添加
public class FlightAttribute {
    private String seat_id,user_id,child,vip,windows,door,middle,aisle,flight_number;
    private Integer id;

    public String getFlight_number() {
        return flight_number;
    }

    public void setFlight_number(String flight_number) {
        this.flight_number = flight_number;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSeat_id() {
        return seat_id;
    }

    public void setSeat_id(String seat_id) {
        this.seat_id = seat_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getChild() {
        return child;
    }

    public void setChild(String child) {
        this.child = child;
    }

    public String getVip() {
        return vip;
    }

    public void setVip(String vip) {
        this.vip = vip;
    }

    public String getWindows() {
        return windows;
    }

    public void setWindows(String windows) {
        this.windows = windows;
    }

    public String getDoor() {
        return door;
    }

    public void setDoor(String door) {
        this.door = door;
    }

    public String getMiddle() {
        return middle;
    }

    public void setMiddle(String middle) {
        this.middle = middle;
    }

    public String getAisle() {
        return aisle;
    }

    public void setAisle(String aisle) {
        this.aisle = aisle;
    }

    //返回未知的座位属性的值
    //child,vip,windows,door,middle,aisle;
    public int get(String name){
        switch (name){
            case "windows":
                return Integer.parseInt(windows);
            case "child":
                return Integer.parseInt(child);
            case "vip":
                return Integer.parseInt(vip);
            case "door":
                return Integer.parseInt(vip);
            case "middle":
                return Integer.parseInt(middle);
            case "aisle":
                return Integer.parseInt(aisle);
            default:
                return 0;
        }
    }

}
