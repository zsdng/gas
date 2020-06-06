package cn.fy;

import cn.fy.dao.EmpDao;
import cn.fy.service.EmpService;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Calendar;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class TestPage {
    @Autowired
    private EmpService empService;

    @Test
    public void test1() {
        PageInfo allEmp = empService.findAllEmp(new PageUtils(2, 3));
        System.out.println(allEmp);
    }

    @Test
    public void name() {
        Integer i= 1;

         String string = i.toString();
        System.out.println(string);
    }

    @Test
    public void calendar() {
        Calendar cal=Calendar.getInstance();
        cal.setTime(new Date());
        System.out.println(cal.get(Calendar.MONTH));
    }
}
