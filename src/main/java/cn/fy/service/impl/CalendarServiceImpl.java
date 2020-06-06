package cn.fy.service.impl;
/**
 * @author: Fy
 *日历对象的增删查改
 * @create: 2020-04-18 09:50
 */
import cn.fy.dao.CalendarDao;
import cn.fy.domain.MyCalendar;
import cn.fy.service.CalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CalendarServiceImpl implements CalendarService {
    @Autowired
    private CalendarDao calendarDao;


    public void setCalendarDao(CalendarDao calendarDao) {
        this.calendarDao = calendarDao;
    }

    @Override
    public List<MyCalendar> findAll() {
        return calendarDao.findAll();
    }

    @Override
    public void addCalendar(MyCalendar calendar) {
        calendarDao.addCalendar(calendar);

    }

    @Override
    public void updateCalendar(MyCalendar calendar) {
        calendarDao.updateCalendar(calendar);
    }

    @Override
    public void delCalendar(Integer cid) {
        calendarDao.delCalendar(cid);
    }

    /**
     * 根据title删除
     * @param title
     */
    @Override
    public void delCalendar2(String title) {
        calendarDao.delCalendar2(title);
    }

    /**
     * 根据cid查找这个对象
     * @param cid
     * @return
     */
    @Override
    public MyCalendar findByCid(Integer cid) {
        return calendarDao.findByCid(cid);
    }
}
