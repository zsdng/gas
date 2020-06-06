package cn.fy.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class MyCalendar implements Serializable {

    private Integer cid;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date start;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date end;

    private String title;
    /**
     * 类名取值 grey,success,danger,purple,yellow,pink,info
     */
    private String classname;

    public String getClassname() {
        return classname;
    }

    public void setClassname(String className) {
        this.classname = className;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
