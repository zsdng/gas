package cn.fy.dao;
/**
 * @author: Fy
 *日志的Dao接口
 * @create: 2020-04-23 20:56
 */
import cn.fy.domain.MyLog;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LogDao {

    /**
     * 这还用说？当然是记录日志的了啊！
     * @param log
     */
    @Insert("insert into log(ltable,ltype,lname,loperator,lclientIp) values(#{ltable},#{ltype},#{lname},#{loperator},#{lclientIp})")
    public void addLog(MyLog log);

    /**
     * 删除
     * @param id
     */
    @Delete("delete from log where id= #{id}")
    public void deleteLogBy(Integer id);


    @Select("select * from log ")
    public List<MyLog> findAllLog();

    @Select("select * from log where ltype='用户登录' and lname=#{lname} ")
    public List<MyLog> findLastAndIp(String lname);

}
