package cn.fy.service;

import cn.fy.domain.Emp;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author: Fy
 * Emp员工相关Service操作
 * @create: 2020-04-17 12:54
 */

public interface EmpService {

    //查询所有员工信息
    public PageInfo findAllEmp(PageUtils pageUtils);

    //通过eid查询员工信息
    public Emp findEmpByEid(Integer eid);

    //根据传入的eid删除员工
    public void delEmpByEid(Integer eid);

    //添加员工
    public void addEmp(Emp emp);

    public void updateEmp(Emp emp);

}
