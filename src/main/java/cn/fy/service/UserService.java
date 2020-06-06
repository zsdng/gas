package cn.fy.service;

import cn.fy.domain.User;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author: Fy
 * User相关Service
 * @create: 2020-04-16 19:28
 */
public interface UserService {

    /**
     * 登录校验，判断用户名密码是否正确
     *
     * @param user 登录传递过来的User
     * @return 查询返回的结果存在则返回用户对象，不存在返回null
     */
    public User loginCheck(User user);

    /**
     * 用户头像点击之后的查看个人资料页面显示用户名和密码
     *
     * @param username
     * @return
     */
    public User showNowUser(String username);

    public PageInfo findAll(PageUtils pageUtils);

    public User findUserById(Integer id);

    public void delUserById(Integer id);

    public void addUser(User user);

    public void updateUser(User user);

    /**
     * 修改用户头像
     * @param user
     */
    public void updateUserPicture(User user);

    /**
     * 从数据库中根据用户名查询，如果有查询结果则用户存在
     *
     * @param username
     * @return
     */
    public Boolean findUserName(String username);
}
