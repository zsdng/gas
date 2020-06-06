package cn.fy.dao;

import cn.fy.domain.MyCalendar;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author: Fy
 * 日历相关操作
 * @create: 2020-04-18 09:39
 */
@Repository
public interface CalendarDao {

    @Select("SELECT * FROM calendar ")
    public List<MyCalendar> findAll();

    @Insert("insert into calendar(start , end , title ,classname ) values( #{start},#{end},#{title},#{classname}) ")
    public void addCalendar(MyCalendar calendar);

    @Update("update calendar set start=#{start}  , end=#{end} , title=#{title} , classname=#{classname} where cid =#{cid}")
    public void updateCalendar(MyCalendar calendar);

    @Delete("delete from calendar where cid =#{cid} ")
    public void delCalendar(Integer cid);

    /**
     * 根据title删除
     *
     * @param title
     */
    @Delete("delete from calendar where title =#{title} ")
    public void delCalendar2(String title);

    /**
     * 根据cid查询日历对象
     *
     * @param cid
     * @return
     */
    @Select("SELECT * FROM calendar where cid=#{cid} ")
    public MyCalendar findByCid(Integer cid);
}
