package cn.fy.controller;
/**
 * @author: Fy
 *
 * @create: 2020-04-18 09:56
 */
import cn.fy.domain.Emp;
import cn.fy.domain.MyCalendar;
import cn.fy.service.CalendarService;
import cn.fy.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

    @Autowired
    private CalendarService calendarService;
    @Autowired
    private LogService logService;


    public void setCalendarService(CalendarService calendarService) {
        this.calendarService = calendarService;
    }


    @RequestMapping("/findAll")
    public String  findAll(Model model)  {
        List<MyCalendar> calendars = calendarService.findAll();
        System.out.println(calendars);
        model.addAttribute("calendars", calendars);
        return "../main/calendar.jsp";
    }

    /**
     * 根据cid删除
     * @param cid
     * @return
     */
    @RequestMapping(value = "/delById")
    public String delById(Integer cid , HttpServletRequest request, HttpSession session){
        MyCalendar myCalendar = calendarService.findByCid(cid);
        calendarService.delCalendar(cid);
        logService.addLog("日历日程表","删除",myCalendar.getTitle(),session,request);
        return "findAll";
    }
    @RequestMapping(value = "/addCal")
    public String addCal(MyCalendar calendar ,HttpServletRequest request,HttpSession session){
        calendarService.addCalendar(calendar);
        logService.addLog("日历日程表","添加",calendar.getTitle(),session,request);
        return "findAll";
    }

    /**
     * 根据title删除
     * @param title
     * @return
     */
    @RequestMapping(value = "/delCal")
    public String delCal(String title ,HttpServletRequest request,HttpSession session){
        calendarService.delCalendar2(title);
        logService.addLog("日历日程表","删除",title,session,request);
        return "findAll";
    }


}
