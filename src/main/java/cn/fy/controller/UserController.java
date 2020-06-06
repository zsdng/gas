package cn.fy.controller;

import cn.fy.domain.MyLog;
import cn.fy.domain.User;
import cn.fy.service.LogService;
import cn.fy.service.UserService;
import cn.fy.utils.GetIp;
import cn.fy.utils.LogUtils;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author: Fy
 * User的相关Controller包含
 * 1.个人资料的显示
 * @create: 2020-04-18 17:51
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private LogService logService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping("/showNowUser")
    public @ResponseBody
    User showNowUser(@RequestBody User user) {
        return userService.showNowUser(user.getUsername());
    }

    @RequestMapping("/findAll")
    public String findAll(Model model, PageUtils pageUtils) {
        if (pageUtils.getPageIndex() == 0 ) {
            pageUtils.setPageIndex(1);
        }
        if (pageUtils.getPageSize() == 0 ) {
            pageUtils.setPageSize(3);
        }
        PageInfo pageUser = userService.findAll(pageUtils);
        model.addAttribute("pageUser",pageUser);
        return "userlist.jsp";

    }

    /**
     * Ajax异步请求
     * @param id
     * @return
     */
    @RequestMapping("/findUserById")
    @ResponseBody
    public User findUserById( Integer id) {
        return userService.findUserById(id);
    }

    @RequestMapping("/updateSelf")
    public void updateSelf(User user, HttpServletRequest request){
        //添加日志信息
        userService.updateUser(user);
        logService.addLog("用户表","修改",user.getUsername(),user.getUsername(), request);
    }

    /**
     * 更新
     * @param user se
     * @return 返回查询所有页面
     */
    @RequestMapping("/updateUser")
    public String updateUser(User user,HttpServletRequest request,HttpSession session){
        userService.updateUser(user);
        //记录日志
        logService.addLog("用户表","修改",user.getUsername(),session,request);
        return "findAll";
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delUserById")
    public String delUserById(Integer id,HttpServletRequest request,HttpSession session){
        //先把这个用户查出来取出名字然后再删了
        User userById = userService.findUserById(id);
        userService.delUserById(id);
        logService.addLog("用户表","删除",userById.getUsername(),session,request);
        return "findAll";
    }

    /**
     * 添加
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
    public String addUser(User user,HttpServletRequest request,HttpSession session) {
        userService.addUser(user);
        logService.addLog("用户表","添加",user.getUsername(),session,request);
        return "findAll";
    }

    /**
     * 修改用户头像的方法
     * @param user
     * @param session
     */
    @ResponseBody
    @RequestMapping("/updateUserPicture")
    public Integer updateUserPicture( User user, HttpSession session){
        session.setAttribute("upicture",user.getUpicture());
        userService.updateUserPicture(user);
        return 1;
    }

}
