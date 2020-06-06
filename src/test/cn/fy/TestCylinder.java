package cn.fy;

import cn.fy.domain.Cylinder;
import cn.fy.service.CylinderService;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class TestCylinder {
    @Autowired
    private CylinderService cylinderService;

    PageUtils pageUtils=new PageUtils(1,5);


    @Test
    public void test1() {
        PageInfo all = cylinderService.findAll(pageUtils);
        all.getList().forEach(System.out::println);

    }

    @Test
    public void test2() {
        cylinderService.sendCylinder(15);
    }

    @Test
    public void test3() {
        Cylinder cylinder =new Cylinder();
//        cylinder.setId(11);
        cylinder.setKind("氧气");
        cylinder.setState(true);
        cylinder.setManufacturer("制造商B");

        cylinder.setCreatetime(new Date());
        cylinder.setOperator("fangyuan");

        cylinderService.addCylinder(cylinder);
    }
    @Test
    public void test4() {
        Cylinder cylinder =new Cylinder();
        cylinder.setId(21);
        cylinder.setKind("毒气");
        cylinder.setState(true);
        cylinder.setManufacturer("制造商B");

        cylinder.setCreatetime(new Date());
        cylinder.setOperator("fangyuan");

        cylinderService.updateCylinder(cylinder);
    }
    @Test
    public void test5() {

        System.out.println(cylinderService.findByStateI(true));
    }
    @Test
    public void test6() {
        cylinderService.findByStateL(true,pageUtils).getList().forEach(System.out::println);
    }

    @Test
    public void test7() {
        cylinderService.findByKindL("液氦",pageUtils).getList().forEach(System.out::println);
    }

    @Test
    public void test8() {
        System.out.println(cylinderService.findByKindI("甲烷"));
    }
    @Test
    public void test9() {
        cylinderService.findByOper("fangyuan",pageUtils).getList().forEach(System.out::println);
    }
    @Test
    public void test10() {
        PageInfo info = cylinderService.findByKindAndStateTrue("氧气", true, pageUtils);
        info.getList().forEach(System.out::println);

    }

}
