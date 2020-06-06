package cn.fy.service;
/**
 * @author: Fy
 *
 * @create: 2020-04-18 09:48
 */
import cn.fy.domain.MyCalendar;

import java.util.List;

public interface CalendarService {


    public List<MyCalendar> findAll();

    public void addCalendar(MyCalendar calendar);

    public void updateCalendar(MyCalendar calendar);

    public void delCalendar(Integer cid);

    /**
     * 根据title删除
     * @param title
     */
    public void delCalendar2(String title);

    public MyCalendar findByCid(Integer cid);
}
