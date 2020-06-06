package cn.fy.controller;

import cn.fy.domain.User;
import cn.fy.exception.LoginException;
import cn.fy.service.LogService;
import cn.fy.service.UserService;
import cn.fy.utils.GetIp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * @author: Fy
 * 登录相关Controller包含验证码
 * @create: 2020-04-16 19:00
 */
@Controller
//@RequestMapping("/login")
public class LoginController {
    @Autowired
    private UserService userService;

    @Autowired
    private LogService logService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * 用户登录
     *
     * @return
     */
    @RequestMapping("/loginControl")
    public String login(User user, Model model, HttpServletRequest request, HttpServletResponse response)  {
        try {
            //验证码相关代码
            request.setCharacterEncoding("utf-8");
            String verifycode = request.getParameter("verifycode");
            HttpSession session = request.getSession();
            String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
            session.removeAttribute("CHECKCODE_SERVER");//确保验证码一次性
            if (!checkcode_server.equalsIgnoreCase(verifycode)) {
                model.addAttribute("login_msg", "验证码错误！！");
                return "login/login.jsp";
//            request.getRequestDispatcher("/login.jsp").forward(request, response);
//            return null;
            }

            User user1 = userService.loginCheck(user);

            if (user1 == null) {
                model.addAttribute("login_msg", "用户名或密码错误！");

//            request.getRequestDispatcher("login/login.jsp").forward(request,response);
                return "login/login.jsp";
            } else {
                String userName = user1.getUsername();
                model.addAttribute("user", user1);
                session.setAttribute("username", userName);
                session.setAttribute("position", user1.getPosition());
                session.setAttribute("userId", user1.getId());
                session.setAttribute("upicture", user1.getUpicture());
//                session.setAttribute("clientIp", GetIp.getClientIp(request));
                logService.addLog("登录", "用户登录",userName,userName,request);
                return "redirect:main/main.jsp";
            }
        } catch (Exception e){
            e.printStackTrace();
            model.addAttribute("login_msg", "验证码已失效请重新登录！");
            return "login/login.jsp";
        }

    }

    /**
     * 异步在输入用户名的时候判断用户名是否存在
     *
     * @param username
     * @return
     */
    @RequestMapping("/findUserName")
    @ResponseBody
    public Boolean findUserName(String username) {
        return userService.findUserName(username);
    }


    @RequestMapping("/checkCodeController")
    public void checkCodeController(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //服务器通知浏览器不要缓存
        response.setHeader("pragma", "no-cache");
        response.setHeader("cache-control", "no-cache");
        response.setHeader("expires", "0");

        //在内存中创建一个长80，宽30的图片，默认黑色背景
        //参数一：长
        //参数二：宽
        //参数三：颜色
        int width = 80;
        int height = 36;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        //获取画笔
        Graphics g = image.getGraphics();
        //设置画笔颜色为灰色
        g.setColor(Color.GRAY);
        //填充图片
        g.fillRect(0, 0, width, height);

        //产生4个随机验证码，12Ey
        String checkCode = getCheckCode();
        //将验证码放入HttpSession中
        request.getSession().setAttribute("CHECKCODE_SERVER", checkCode);

        //设置画笔颜色为黄色
        g.setColor(Color.YELLOW);
        //设置字体的小大
        g.setFont(new Font("黑体", Font.BOLD, 24));
        //向图片上写入验证码
        g.drawString(checkCode, 15, 25);

        //将内存中的图片输出到浏览器
        //参数一：图片对象
        //参数二：图片的格式，如PNG,JPG,GIF
        //参数三：图片输出到哪里去
        ImageIO.write(image, "PNG", response.getOutputStream());

    }

    /**
     * 产生4位随机字符串
     */
    private String getCheckCode() {
        String base = "0123456789ABCDEFGabcdefg";
        int size = base.length();
        Random r = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= 4; i++) {
            //产生0到size-1的随机值
            int index = r.nextInt(size);
            //在base字符串中获取下标为index的字符
            char c = base.charAt(index);
            //将c放入到StringBuffer中去
            sb.append(c);
        }
        return sb.toString();

    }

    @RequestMapping("/")
    public String toLogin(){
        return "/login/login.jsp";
    }


}
