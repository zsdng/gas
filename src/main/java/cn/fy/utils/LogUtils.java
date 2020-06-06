package cn.fy.utils;
/**
 * @author: Fy
 * 为了方便日志操作写的日志记录工具类
 * @create: 2020-04-24 10:24
 */

import cn.fy.dao.LogDao;
import cn.fy.domain.MyLog;
import cn.fy.service.LogService;
import cn.fy.service.impl.LogServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class LogUtils {

    private  LogDao logDao ;


    public  String getOperatorName(HttpSession session) {
        return (String) session.getAttribute("username");
    }

    /**
     * 添加日志的工具类
     * @param ltable 操作的表名
     * @param ltype 操作类型：添加删除修改
     * @param lname 操作人员名称
     * @param session session对象，用来获取当前操作员
     * @param request 给我request，还你ip地址
     */
    public  void addLog(String ltable, String ltype, String lname, HttpSession session, HttpServletRequest request) {
        logDao.addLog(new MyLog(ltable,ltype,lname,getOperatorName(session),GetIp.getClientIp(request)));
    }
    public  void addLog(String ltable, String ltype, String lname, String operatorName, HttpServletRequest request) {
        logDao.addLog(new MyLog(ltable,ltype,lname,operatorName,GetIp.getClientIp(request)));
    }

}
