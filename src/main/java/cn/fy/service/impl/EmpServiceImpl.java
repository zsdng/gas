package cn.fy.service.impl;
/**
 * @author: Fy
 * Emp员工Service的实现类
 * @create: 2020-04-17 12:57
 */

import cn.fy.dao.EmpDao;
import cn.fy.domain.Emp;
import cn.fy.service.EmpService;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    private EmpDao empDao;

    public void setEmpDao(EmpDao empDao) {
        this.empDao = empDao;
    }

    /**
     *
     * @return 返回查询的所有员工集合
     */
    @Override
    public PageInfo findAllEmp(PageUtils pageUtils) {
        PageHelper.startPage(pageUtils.getPageIndex(),pageUtils.getPageSize());
        List<Emp> list = empDao.findAllEmp();
        return  new PageInfo(list) ;
    }

    /**
     * 通过eid获取员工对象
     * @param eid
     * @return
     */
    @Override
    public Emp findEmpByEid(Integer eid) {
        return empDao.findEmpByEid(eid);
    }

    /**
     *
     * @param eid
     * @return
     */
    @Override
    public void delEmpByEid(Integer eid) {
        empDao.delEmpByEid(eid);

    }

    /**
     *
     * @param emp
     */
    @Override
    public void addEmp(Emp emp) {
        empDao.addEmp(emp);
    }

    /**
     *
     * @param emp
     */
    @Override
    public void updateEmp(Emp emp) {
        empDao.updateEmp(emp);
    }
}
