package cn.fy.service.impl;

import cn.fy.dao.CylinderDao;
import cn.fy.domain.Cylinder;
import cn.fy.domain.CylinderChart;
import cn.fy.service.CylinderService;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: Fy
 *Cylinder接口的实现类
 * @create: 2020-04-19 21:35
 */

@Service
public class CylinderServiceImpl implements CylinderService {

    @Autowired
    private CylinderDao cylinderDao;

    public void setCylinderDao(CylinderDao cylinderDao) {
        this.cylinderDao = cylinderDao;
    }

    @Override
    public PageInfo findAll(PageUtils pageUtils) {
        PageHelper.startPage(pageUtils.getPageIndex(),pageUtils.getPageSize());
        List<Cylinder> list = cylinderDao.findAll();
        return new PageInfo(list);
    }

    @Override
    public List<Cylinder> findAll() {
        return cylinderDao.findAll();
    }

    /**
     * 送气实质是删除
     * @param id 气瓶id
     */
    @Override
    public void sendCylinder(Integer id) {

        cylinderDao.delById(id);
    }

    /**
     * 添加新的气瓶
     * @param cylinder 气瓶对象
     */
    @Override
    public void addCylinder(Cylinder cylinder) {

        cylinderDao.addCyl(cylinder);
    }

    /**
     * 更新气瓶对象
     * @param cylinder 气瓶对象
     */
    @Override
    public void updateCylinder(Cylinder cylinder) {

        cylinderDao.updateCyl(cylinder);
    }

    /**
     * 根据气瓶状态查询相应状态的气瓶的数量
     * @param state 气瓶状态
     * @return 数量
     */
    @Override
    public Integer findByStateI(Boolean state) {
        return cylinderDao.findByStateI(state);
    }

    /**
     * 根据气瓶相应的状态采用分页来查询并返回相应的气瓶信息
     * @param state 气瓶状态
     * @param pageUtils 分页对象
     * @return PageInfo
     */
    @Override
    public PageInfo findByStateL(Boolean state, PageUtils pageUtils) {
        PageHelper.startPage(pageUtils.getPageIndex(),pageUtils.getPageSize());
        List<Cylinder> list = cylinderDao.findByStateL(state);
        return new PageInfo(list);
    }

    /**
     * 根据气瓶的种类采用分页方式查询并返回气瓶
     * @param kind 气瓶种类
     * @param pageUtils 分页对象
     * @return PageInfo
     */
    @Override
    public PageInfo findByKindL(String kind, PageUtils pageUtils) {
        PageHelper.startPage(pageUtils.getPageIndex(),pageUtils.getPageSize());
        List<Cylinder> list = cylinderDao.findByKindL(kind);
        return new PageInfo(list);
    }

    /**
     * 根据气瓶分类查询相应分类的气瓶数量
     * @param kind 气瓶种类
     * @return 该类气瓶的数量
     */
    @Override
    public Integer findByKindI(String kind) {
        return cylinderDao.findByKindI(kind);
    }

    @Override
    public PageInfo findByOper(String operator, PageUtils pageUtils) {
        PageHelper.startPage(pageUtils.getPageIndex(),pageUtils.getPageSize());
        List<Cylinder> list = cylinderDao.findByOper(operator);
        return new PageInfo(list);
    }

    @Override
    public void sendToAddQi(Integer id) {
        cylinderDao.sendToAddQi(id);
    }


    /**
     *柱状图数据的实现类
     * @return
     */
    @Override
    public List<CylinderChart> GroupByKindAndState(Boolean state) {
        return cylinderDao.GroupByKindAndState(state);
    }

    /**
     * 通过id找气瓶对象
     * @param id 气瓶的id
     * @return 气瓶对象
     */
    @Override
    public Cylinder findById(Integer id) {
        return cylinderDao.findById(id);
    }

    @Override
    public PageInfo findByKindAndStateTrue(String kind, Boolean state, PageUtils pageUtils) {
        PageHelper.startPage(pageUtils.getPageIndex(),pageUtils.getPageSize());
        List<Cylinder> list = cylinderDao.findByKindAndStateTrue(kind);
        return new PageInfo(list);
    }

    @Override
    public PageInfo findByKindAndStateFalse(String kind, Boolean state, PageUtils pageUtils) {
        PageHelper.startPage(pageUtils.getPageIndex(),pageUtils.getPageSize());
        List<Cylinder> list = cylinderDao.findByKindAndStateFalse(kind);
        return new PageInfo(list);
    }

    /**
     * 批量添加List集合中的数组
     * @param list 气瓶对象集合
     */
    @Override
    public void addCylinder(List<Cylinder> list) {
        list.forEach(i-> cylinderDao.addCyl(i));
    }
}
