package cn.com.scitc.model;

public class FlightModel {

    private String row,col,start_number,seat,row_aisle,delete_seat;

    private int id;
    private String name;
    private int z;
    private int r;
    private float t;
    private float f;

    private int null_seat;

    public int getNull_seat() {
        return null_seat;
    }

    public void setNull_seat(int null_seat) {
        this.null_seat = null_seat;
    }

    public String getRow() {
        return row;
    }

    public void setRow(String row) {
        this.row = row;
    }

    public String getCol() {
        return col;
    }

    public void setCol(String col) {
        this.col = col;
    }

    public String getStart_number() {
        return start_number;
    }

    public void setStart_number(String start_number) {
        this.start_number = start_number;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat;
    }

    public String getRow_aisle() {
        return row_aisle;
    }

    public void setRow_aisle(String row_aisle) {
        this.row_aisle = row_aisle;
    }

    public String getDelete_seat() {
        return delete_seat;
    }

    public void setDelete_seat(String delete_seat) {
        this.delete_seat = delete_seat;
    }

    public float getT() {
        return t;
    }

    public void setT(float t) {
        this.t = t;
    }

    public float getF() {
        return f;
    }

    public void setF(float f) {
        this.f = f;
    }

    public int getZ() {
        return z;
    }

    public void setZ(int z) {
        this.z = z;
    }

    public int getR() {
        return r;
    }

    public void setR(int r) {
        this.r = r;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
