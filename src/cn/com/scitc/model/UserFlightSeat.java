package cn.com.scitc.model;

public class UserFlightSeat {
    private String user_id,flight_number,want_seat_attribute_one,want_seat_attribute_second,seat_id,satisfaction,team;

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

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

    public String getWant_seat_attribute_one() {
        return want_seat_attribute_one;
    }

    public void setWant_seat_attribute_one(String want_seat_attribute_one) {
        this.want_seat_attribute_one = want_seat_attribute_one;
    }

    public String getWant_seat_attribute_second() {
        return want_seat_attribute_second;
    }

    public void setWant_seat_attribute_second(String want_seat_attribute_second) {
        this.want_seat_attribute_second = want_seat_attribute_second;
    }

    public String getSeat_id() {
        return seat_id;
    }

    public void setSeat_id(String seat_id) {
        this.seat_id = seat_id;
    }

    public String getSatisfaction() {
        return satisfaction;
    }

    public void setSatisfaction(String satisfaction) {
        this.satisfaction = satisfaction;
    }
}
