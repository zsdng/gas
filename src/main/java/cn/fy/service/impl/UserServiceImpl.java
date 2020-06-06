package cn.fy.service.impl;

import cn.fy.dao.UserDao;
import cn.fy.domain.User;
import cn.fy.service.UserService;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: Fy
 * userService的实现类
 * @qq: 1057072154
 * @create: 2020-04-16 19:31
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    /**
     * 登录校验
     *
     * @param user 登录传递过来的User
     * @return 查询返回的结果存在则返回用户对象，不存在返回null
     */
    @Override
    public User loginCheck(User user) {
        if (userDao.findByNameAndPassword(user) == null) {
            return null;
        } else {
            return userDao.findByNameAndPassword(user);
        }
    }

    @Override
    public User showNowUser(String username) {

        return userDao.findByUserName(username);
    }


    /**
     * 使用pageinfo分页
     *     public PageInfo findAllEmp(PageUtils pageUtils) {
     *         PageHelper.startPage(pageUtils.getPageIndex(),pageUtils.getPageSize());
     *         List<Emp> list = empDao.findAllEmp();
     *         return  new PageInfo(list) ;
     *     }
     * @return
     */
    @Override
    public PageInfo findAll(PageUtils pageUtils) {
        PageHelper.startPage(pageUtils.getPageIndex(),pageUtils.getPageSize());
        List<User> list = userDao.findAll();
        return new PageInfo(list);
    }

    @Override
    public User findUserById(Integer id) {
        return userDao.findUserById(id);
    }

    @Override
    public void delUserById(Integer id) {
        userDao.delUserById(id);
    }

    @Override
    public void addUser(User user) {
        userDao.addUser(user);

    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public void updateUserPicture(User user) {
        userDao.updateUserPicture(user);
    }

    @Override
    public Boolean findUserName(String username) {
        User byUserName = userDao.findByUserName(username);
        return byUserName != null;

    }
}
