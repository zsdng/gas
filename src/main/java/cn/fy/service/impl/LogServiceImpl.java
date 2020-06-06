package cn.fy.service.impl;

import cn.fy.dao.LogDao;
import cn.fy.domain.MyLog;
import cn.fy.service.LogService;
import cn.fy.utils.GetIp;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author: Fy
 * log的service的实现类
 * @create: 2020-04-23 21:21
 */
@Service
public class LogServiceImpl implements LogService {
    @Autowired
    private LogDao logDao;

    public void setLogDao(LogDao logDao) {
        this.logDao = logDao;
    }

    @Override
    public void addLog(MyLog log) {

        logDao.addLog(log);
    }

    /**
     * 这个是获取操作员名称的一个备用的方法
     *
     * @param session
     * @return
     */
    @Override
    public String getOperatorName(HttpSession session) {
        return (String) session.getAttribute("username");
    }

    /**
     *
     * @param ltable
     * @param ltype
     * @param lname
     * @param session
     * @param request
     */
    @Override
    public void addLog(String ltable, String ltype, String lname, HttpSession session, HttpServletRequest request) {
        logDao.addLog(new MyLog(ltable,ltype,lname,getOperatorName(session), GetIp.getClientIp(request)));
    }

    /**
     *
     * @param ltable
     * @param ltype
     * @param lname
     * @param operatorName
     * @param request
     */
    @Override
    public void addLog(String ltable, String ltype, String lname, String operatorName, HttpServletRequest request) {
        logDao.addLog(new MyLog(ltable,ltype,lname,operatorName,GetIp.getClientIp(request)));

    }

    @Override
    public void deleteLogBy(Integer id) {

        logDao.deleteLogBy(id);
    }

    /**
     * 分页查询findAll
     *
     * @param pageUtils
     * @return
     */
    @Override
    public PageInfo findAll(PageUtils pageUtils) {
        PageHelper.startPage(pageUtils.getPageIndex(), pageUtils.getPageSize());
        List<MyLog> list = logDao.findAllLog();
        return new PageInfo(list);
    }

    @Override
    public List<MyLog> findAll() {
        return logDao.findAllLog();
    }

    /**
     * 查询上次用户登录的时间和ip
     * @param lname
     * @return
     */
    @Override
    public MyLog findLastAndIp(String lname) {
        List<MyLog> list = logDao.findLastAndIp(lname);
        if (list!=null&&list.size()>1){
        int i = list.size() - 2;
        return list.get(i);}
        return null;
    }
}
