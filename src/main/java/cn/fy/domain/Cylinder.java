package cn.fy.domain;

import java.util.Date;

/**
 * @author: Fy
 *Cylinder为气瓶的实体类
 * @create: 2020-04-19 20:38
 */
public class Cylinder {
    private  Integer id;
    private String kind;
    private Boolean state;
    private String manufacturer;
    private String area;
    private Date createtime;
    private Date jointime;
    private String operator;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public Boolean getState() {
        return state;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getJointime() {
        return jointime;
    }

    public void setJointime(Date jointime) {
        this.jointime = jointime;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    @Override
    public String toString() {
        return "Cylinder{" +
                "id=" + id +
                ", kind='" + kind + '\'' +
                ", state=" + state +
                ", manufacturer='" + manufacturer + '\'' +
                ", area='" + area + '\'' +
                ", createtime=" + createtime +
                ", jointime=" + jointime +
                ", operator='" + operator + '\'' +
                '}';
    }
}
