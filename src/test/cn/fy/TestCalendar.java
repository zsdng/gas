package cn.fy;

import cn.fy.domain.MyCalendar;
import cn.fy.service.CalendarService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class TestCalendar {
    @Autowired
    private CalendarService calendarService;

    @Test
    public void test1() {
        System.out.println(calendarService.findAll());

    }

    @Test
    public void test12() {
        MyCalendar calendar =new MyCalendar();
        calendar.setStart(new Date());
        calendar.setEnd(new Date());
        calendar.setTitle("wwwwwwqqqq");
        calendarService.addCalendar(calendar);
    }
    @Test
    public void test13() {
        MyCalendar calendar =new MyCalendar();
        calendar.setCid(3);
        calendar.setStart(new Date());
        calendar.setEnd(new Date());
        calendar.setTitle("++++++++");
        calendarService.updateCalendar(calendar);
    }

    @Test
    public void t4() {
        calendarService.delCalendar(3);
    }
}

