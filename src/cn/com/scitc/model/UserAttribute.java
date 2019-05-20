package cn.com.scitc.model;

public class UserAttribute {
    private String id,type_one,type_second,header,flight_number;

    public String getFlight_number() {
        return flight_number;
    }

    public void setFlight_number(String flight_number) {
        this.flight_number = flight_number;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType_one() {
        return type_one;
    }

    public void setType_one(String type_one) {
        this.type_one = type_one;
    }

    public String getType_second() {
        return type_second;
    }

    public void setType_second(String type_second) {
        this.type_second = type_second;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }
}
