package cn.fy;

import cn.fy.dao.UserDao;
import cn.fy.domain.User;
import cn.fy.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class TestUser {
    @Autowired
    private UserService userService;
    @Autowired
    private UserDao userDao;


    @Test
    public void test123() {
        User acasaf = userDao.findByUserName("acasaf");
        System.out.println(acasaf);
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Test
    public void test1() {
//        System.out.println(userService.findAll());
    }
    @Test
    public void test2() {
        System.out.println(userService.findUserById(4));
    }
    @Test
    public void test3() {
        User user =new User();
        user.setUsername("qqq");
        user.setPassword("qqq");
        user.setPosition("操作员");
        userService.addUser(user);
    }

    @Test
    public void test4() {
        userService.delUserById(7);
    }
    @Test
    public void test5() {
        User user =new User();
        user.setId(5);
        user.setUsername("wpy");
        user.setPassword("wpyssb");
        user.setPosition("管理员");
        userService.updateUser(user);
    }
}
