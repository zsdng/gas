package cn.fy;

import cn.fy.dao.EmpDao;
import cn.fy.domain.Emp;
import cn.fy.service.EmpService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class TestFindAllEmp {
    @Autowired
    private EmpDao empDao;
    @Autowired
    private EmpService empService;

    @Test
    public void test1() {
        List<Emp> list = empDao.findAllEmp();
        list.forEach(System.out::println);
    }

    @Test
    public void test2() {
        System.out.println(empDao.findEmpByEid(2));
    }

    @Test
    public void test3() {
    empService.delEmpByEid(3);

    }

    @Test
    public void test4() {
        Emp emp =new Emp();
        emp.setName("王培毅是傻逼");
        emp.setAge(30);
        emp.setPhone("1564645615");
        empService.addEmp(emp);
    }

    @Test
    public void test5() {
        Emp emp =new Emp();
        emp.setEid(12);
        emp.setName("王培毅是傻逼");
        emp.setAge(30);
        emp.setPhone("1564645615");
        emp.setAddress("qwtwqetw");
//        empService.update(emp);
    }
}
