package cn.fy.interceptor;

import javax.servlet.*;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class LoginFilter implements Filter {

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request =(HttpServletRequest) req;
        HttpServletResponse response=(HttpServletResponse)resp;
        String uri = request.getRequestURI();
//        System.out.println(uri);
        //2.判断是否包含登录相关资源，要注意排除掉css/js/图片/验证码等资源
        if ("/gas/".equals(uri)||uri.contains("login")||uri.contains("error")||uri.contains("findUserName")||uri.contains("/static/")||uri.contains("/js/")||uri.contains("/fonts/")||uri.contains("checkCode")){
            chain.doFilter(req, resp);
        }else {
            //不包含的话需要验证是否登录
            //3.从seesion中获取user
            Object user = request.getSession().getAttribute("username");
            if (user!=null&&user!=""){
                chain.doFilter(req, resp);
            }else{
                request.setAttribute("login_msg","您尚未登录，请登录后访问！");
//                response.sendRedirect("http://localhost:8080/gas/login/login.jsp");
                request.getRequestDispatcher("/login/login.jsp").forward(request,resp);
            }

        }

//        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

    public void destroy() {

    }
}
