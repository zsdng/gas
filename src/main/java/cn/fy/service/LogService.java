package cn.fy.service;

import cn.fy.domain.MyLog;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


public interface LogService {

    public void addLog(MyLog log);

    public String getOperatorName(HttpSession session);

    /**
     * 添加日志的方法多种重载
     * @param ltable
     * @param ltype
     * @param lname
     * @param session
     * @param request
     */
    public void addLog(String ltable, String ltype, String lname, HttpSession session, HttpServletRequest request);

    /**
     * 另一种重载
     * @param ltable
     * @param ltype
     * @param lname
     * @param operatorName
     * @param request
     */
    public void addLog(String ltable, String ltype, String lname, String operatorName, HttpServletRequest request);

    /**
     * 删除
     *
     * @param id
     */
    public void deleteLogBy(Integer id);


    public PageInfo findAll(PageUtils pageUtils);

    public List<MyLog> findAll();

    /**
     * 查询上次该用户登录的时间和ip
     * @param lname
     * @return
     */
    public MyLog findLastAndIp(String lname);
}
