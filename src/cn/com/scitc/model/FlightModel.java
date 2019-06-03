package cn.com.scitc.model;

public class FlightModel {
    private int id;
    private String name;
    private int z;
    private int r;
    private float t;
    private float f;

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
