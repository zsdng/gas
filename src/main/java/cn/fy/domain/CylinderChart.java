package cn.fy.domain;

import java.io.Serializable;
/**
 * @author: Fy
 *专门为柱状图写的类
 * @create: 2020-04-21 11:05
 */
public class CylinderChart implements Serializable {
    private String kind;
    private Boolean state;
    private int c;

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

    public int getC() {
        return c;
    }

    public void setC(int c) {
        this.c = c;
    }
}
