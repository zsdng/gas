package cn.fy.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author: Fy
 * 这个是拦截器，用来拦截你不登录就想偷偷访问主页的！
 * 这个不好用只能拦截方法，不能拦截路径，但是留下不删，springmvc.xml中配置已经注解了
 * 我选择放弃2020年4月24日 18:37:11
 * 换成filter试试
 * @create: 2020-04-24 18:25
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        //如果是登录页面则放行
        if (request.getRequestURI().contains("login")) {
            return true;
        }
        HttpSession session = request.getSession();
        //如果用户已登录也放行
        if (session.getAttribute("username") != null) {
            return true;
        }
        //用户没有登录跳转到登录页面
        request.setAttribute("login_msg","您尚未登陆，请登录后访问。");
        request.getRequestDispatcher("/login/login.jsp").forward(request, response);
        return false;
    }
}

