package cn.fy;

import cn.fy.domain.MyLog;
import cn.fy.service.LogService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class TestLog {
    @Autowired
   private LogService logService;


    @Test
    public void t1() {
        logService.addLog(new MyLog("表","类型","设计名称","操作员","ip地址"));
    }
}
