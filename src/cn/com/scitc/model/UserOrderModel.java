package cn.com.scitc.model;

public class UserOrderModel {
    private String user_id,flight_number,seat_number,start_site,end_site,start_time,end_time;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getFlight_number() {
        return flight_number;
    }

    public void setFlight_number(String flight_number) {
        this.flight_number = flight_number;
    }

    public String getSeat_number() {
        return seat_number;
    }

    public void setSeat_number(String seat_number) {
        this.seat_number = seat_number;
    }

    public String getStart_site() {
        return start_site;
    }

    public void setStart_site(String start_site) {
        this.start_site = start_site;
    }

    public String getEnd_site() {
        return end_site;
    }

    public void setEnd_site(String end_site) {
        this.end_site = end_site;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }
}
