package cn.fy.dao;

import cn.fy.domain.Emp;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author: Fy
 * EMp的Dao相关接口
 * @create: 2020-04-17 12:52
 */
@Repository
public interface EmpDao {

    //查询所有员工信息,返回一个List集合
    @Select("select * from emp")
    public List<Emp> findAllEmp();

    /**
     *
     * @param eid 传入一个emp员工对象
     * @return
     */
    @Select("select * from emp where eid =#{eid} ")
    public Emp findEmpByEid(Integer eid);

    /**
     * 根据eid删除员工信息
     * @param eid
     */
    @Delete("delete from emp where eid =#{eid} ")
    public void delEmpByEid(Integer eid);

    /**
     * 添加
     * @param emp
     */
    @Insert(" insert into emp(name,age,sex,phone,address) values(#{name},#{age},#{sex},#{phone},#{address}) ")
    public void addEmp(Emp emp);

    /**
     * 更新
     * @param emp
     */
    @Update("update emp set name=#{name}  , age=#{age} , sex=#{sex} , phone =#{phone} , address= #{address}  where eid =#{eid}")
    public void updateEmp(Emp emp);

}
