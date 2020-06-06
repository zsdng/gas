package cn.fy;

import cn.fy.domain.User;
import cn.fy.service.UserService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class TestLogin {
    @Autowired
    private UserService us;

    @Test
    public void name() {
        User user =new User();
        user.setUsername("admin");
        user.setPassword("admin");
        User user1 = us.loginCheck(user);
        System.out.println(user1);
    }


}
