package cn.fy.service;

import cn.fy.domain.Cylinder;
import cn.fy.domain.CylinderChart;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface CylinderService {

    /*相关方法注解可以在dao中查看*/

    public PageInfo findAll(PageUtils pageUtils);

    public List<Cylinder> findAll();

    /**
     * 送气，实质是删除
     *
     * @param id 气瓶id
     */
    public void sendCylinder(Integer id);

    /**
     * 添加
     *
     * @param cylinder 气瓶对象
     */
    public void addCylinder(Cylinder cylinder);

    /**
     * 修改气瓶信息
     *
     * @param cylinder 气瓶对象
     */
    public void updateCylinder(Cylinder cylinder);

    /**
     * 查询需要充气的或已充气的气瓶总数
     *
     * @param state 气瓶状态
     * @return 该状态气瓶数量
     */
    public Integer findByStateI(Boolean state);

    /**
     * 查询需要充气的或已充气的气瓶全部信息
     *
     * @param state     气瓶状态
     * @param pageUtils 分页对象
     * @return PageInfo
     */
    public PageInfo findByStateL(Boolean state, PageUtils pageUtils);

    /**
     * 根据气瓶分类查询气瓶信息，并分页
     *
     * @param kind      气瓶种类
     * @param pageUtils 分页对象
     * @return PageInfo
     */
    public PageInfo findByKindL(String kind, PageUtils pageUtils);

    /**
     * 根据气瓶分类查询相应分类的气瓶数量
     *
     * @param kind 气瓶种类
     * @return 该类气瓶的数量
     */
    public Integer findByKindI(String kind);

    /**
     * 根据操作员查询相应的气瓶信息,并分页
     *
     * @param operator  操作员名称
     * @param pageUtils 分页工具对象
     * @return PageInfo
     */
    public PageInfo findByOper(String operator, PageUtils pageUtils);

    /**
     * 送去加气
     *
     * @param id
     */
    void sendToAddQi(Integer id);


    /**
     * 用于柱状图中的数据动态生成
     * @return 气瓶表对象集合
     */
    List<CylinderChart> GroupByKindAndState(Boolean state);

    /**
     * 根据id查找气瓶对象，修改气瓶信息的时候用
     * @param id
     * @return
     */
    public Cylinder findById(Integer id);

    /**
     * 这个直接是查询所有待送气的气瓶的列表
     * @param kind
     * @param state 固定true
     * @return
     */
    public PageInfo findByKindAndStateTrue(String kind, Boolean state,PageUtils pageUtils);
    /**
     * 这个直接是查询所有待充气的气瓶的列表
     * @param kind
     * @param state 固定false
     * @return
     */
    public PageInfo findByKindAndStateFalse(String kind, Boolean state,PageUtils pageUtils);

    /**
     * 添加
     *
     * @param list 气瓶对象集合
     */
    public void addCylinder(List<Cylinder> list);
}
