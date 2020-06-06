package cn.fy.dao;

import cn.fy.domain.Cylinder;
import cn.fy.domain.CylinderChart;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author: Fy
 *Cylinder译为气瓶，该接口为气瓶相关Dao操作的接口
 *
 * @create: 2020-04-19 20:37
 */
@Repository
public interface CylinderDao {

    /**
     *查询所有
     * @return 返回Cylinder的list集合
     */
    @Select("select * from cylinder")
    public List<Cylinder> findAll();

    /**
     * 删除
     * @param id
     */
    @Delete("delete from cylinder where id =#{id}")
    public void delById(Integer id);

    /**
     * 添加
     * @param cylinder
     */
    @Insert("INSERT INTO cylinder( kind , state , manufacturer , area , createtime ,operator )  " +
            "VALUES(#{kind} , #{state} , #{manufacturer} , #{area} , #{createtime}, #{operator})")
    public void addCyl(Cylinder cylinder);

    /**
     * 修改气瓶信息
     * @param cylinder
     */
    @Update("update cylinder set kind=#{kind}  , state=#{state} , manufacturer=#{manufacturer}  " +
            ", area=#{area} , createtime=#{createtime} , operator=#{operator} where id=#{id}")
    public void updateCyl(Cylinder cylinder);

    /**
     * 查询需要充气的或已充气的气瓶总数
     * @param state
     * @return
     */
    @Select("select count(*) from cylinder where state =#{state}")
    public Integer findByStateI(Boolean state);

    /**
     * 查询需要充气的或已充气的气瓶全部信息
     * @param state
     * @return
     */
    @Select("select * from cylinder where state =#{state}")
    public List<Cylinder> findByStateL(Boolean state);

    /**
     *根据气瓶分类查询气瓶信息
     * @param kind
     * @return
     */
    @Select("select * from cylinder where kind =#{kind}")
    public List<Cylinder> findByKindL(String kind);

    /**
     *根据气瓶分类查询相应分类的气瓶数量
     * @param kind
     * @return
     */
    @Select("select count(*) from cylinder where kind =#{kind}")
    public Integer findByKindI(String kind);

    /**
     * 根据操作员查询相应的气瓶信息
     * @param operator
     * @return
     */
    @Select("select * from cylinder where operator =#{operator}")
    public List<Cylinder> findByOper(String operator);

    /**
     * 送去加气，实质是将cylinder的state置1
     * @param id 气瓶id
     */
    @Update("update cylinder set  state = true   where id=#{id}")
    public void sendToAddQi(Integer id);

    /**
     * 根据气瓶的种类了气瓶的状态来分别统计气瓶的数量
     * 用在柱状图中
     * @param state 我选择在Controller层中指定
     * @return 返回一个气瓶对象
     */
    @Select("SELECT  kind, state, COUNT(kind) c FROM cylinder WHERE state =#{state}  GROUP BY kind")
    public List<CylinderChart> GroupByKindAndState(Boolean state);

    /**
     * 根据传入的id在数据库中查询该气瓶对象
     * @param id 气瓶id
     * @return 气瓶对象
     */
    @Select("select * from cylinder  where id =#{id}")
    public Cylinder findById(Integer id);

    /**
     * 用在待送气
     * @param kind
     * @return
     */
    @Select("select * from cylinder where kind =#{kind} and state =true")
    public List<Cylinder> findByKindAndStateTrue(String kind);

    /**
     * 用在待充气的页面
     * @param kind
     * @return
     */
    @Select("select * from cylinder where kind =#{kind} and state =false")
    public List<Cylinder> findByKindAndStateFalse(String kind);

}
