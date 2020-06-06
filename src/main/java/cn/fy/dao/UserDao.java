package cn.fy.dao;
/**
 * @author: Fy
 *User相关Dao操作
 * @create: 2020-04-16 19:23
 */

import cn.fy.domain.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    /**
     * 根据用户名或密码查询数据库，登录时用
     * @param user
     * @return
     */
    @Select("select * from user where username = #{username} and password = #{password}")
    public User findByNameAndPassword(User user);

    /**
     * 根据用户名查询数据库，查看个人详细资料用
     * @param username
     * @return
     */
    @Select("select username, password , position from user where username=#{username} ")
    public User findByUserName(String username);

    /**
     * 查询所有用户
     * @return
     */
    @Select("select * from user ")
    public List<User> findAll();

    /**
     *根据id查询用户
     * @param id
     * @return
     */
    @Select("select * from user where id =#{id} ")
    public User findUserById(Integer id);

    /**
     * 根据id删除用户
     * @param id
     */
    @Delete("delete from user where id =#{id} ")
    public void delUserById(Integer id);

    /**
     * 添加
     * @param user
     */
    @Insert(" insert into user(username,password,position) values(#{username},#{password},#{position}) ")
    public void addUser(User user);

    /**
     * 更新
     * @param user
     */
    @Update("update user set username=#{username}  , password=#{password} , position=#{position}   where id =#{id}")
    public void updateUser(User user);

    /**
     *根据username查询用户
     * @param username
     * @return
     */
    @Select("select * from user where username =#{username} ")
    public User findUserByName(String username);

    /**
     * 修改用户头像
     * @param user
     */
    @Update("update user set upicture=#{upicture}  where id =#{id} ")
    public void updateUserPicture(User user);
}
