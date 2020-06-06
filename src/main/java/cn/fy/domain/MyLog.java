package cn.fy.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * @author: Fy
 *这是我打算写的最后一个实体类，用来存放操作记录的一个日志类
 * @create: 2020-04-23 20:50
 */
public class MyLog  implements Serializable {

    private Integer id;

    private String ltable;

    private String ltype;

    private String lname;
    private String loperator;

    private Date ltime;

    private String lclientIp;


    public MyLog() {
    }

    public MyLog(String ltable, String ltype, String lname, String loperator, String lclientIp) {
        this.ltable = ltable;
        this.ltype = ltype;
        this.lname = lname;
        this.loperator = loperator;
        this.lclientIp = lclientIp;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLtable() {
        return ltable;
    }

    public void setLtable(String ltable) {
        this.ltable = ltable;
    }

    public String getLtype() {
        return ltype;
    }

    public void setLtype(String ltype) {
        this.ltype = ltype;
    }

    public String getLoperator() {
        return loperator;
    }

    public void setLoperator(String loperator) {
        this.loperator = loperator;
    }

    public Date getLtime() {
        return ltime;
    }

    public void setLtime(Date ltime) {
        this.ltime = ltime;
    }

    public String getLclientIp() {
        return lclientIp;
    }

    public void setLclientIp(String lclientIp) {
        this.lclientIp = lclientIp;
    }

    @Override
    public String toString() {
        return "MyLog{" +
                "id=" + id +
                ", ltable='" + ltable + '\'' +
                ", ltype='" + ltype + '\'' +
                ", lname='" + lname + '\'' +
                ", loperator='" + loperator + '\'' +
                ", ltime=" + ltime +
                ", lclientIp='" + lclientIp + '\'' +
                '}';
    }
}
