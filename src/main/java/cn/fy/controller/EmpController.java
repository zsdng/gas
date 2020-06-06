package cn.fy.controller;

import cn.fy.domain.Emp;
import cn.fy.service.EmpService;
import cn.fy.service.LogService;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
/**
 * @author: Fy
 *
 * @create: 2020-04-17 13:16
 */
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/empControl")
public class EmpController {
    @Autowired
    private EmpService empService;
    @Autowired
    private LogService logService;

    public void setLogService(LogService logService) {
        this.logService = logService;
    }

    public void setEmpService(EmpService empService) {
        this.empService = empService;
    }

    /**
     * 展示所有员工信息
     * @param model//视图对象
     * @return
     */
    @RequestMapping("/findAllEmp")
    public String findAllEmp(Model model ,PageUtils pageUtils){
        if (pageUtils.getPageIndex() == 0 ) {
            pageUtils.setPageIndex(1);
        }
        if (pageUtils.getPageSize() == 0 ) {
            pageUtils.setPageSize(5);
        }

        PageInfo PageEmp = empService.findAllEmp(pageUtils);
        model.addAttribute("PageEmp",PageEmp);

        return "../emp/list.jsp";
    }

    /**
     * @author: Fy
     *根据客户端传过来的eid值查询并返回emp对象
     * @create: 2020-04-17 13:33
     */
    @RequestMapping(value = "/findEmpByid")
    public String findEmpByid(Integer eid ,Model model){
        System.out.println(eid);
        Emp emp = empService.findEmpByEid(eid);
        model.addAttribute("emp",emp);
        return "../emp/update.jsp";
    }


    @RequestMapping(value = "/find")
    @ResponseBody
    public Emp findEmpB(Integer eid ){
        System.out.println(eid);
        Emp emp = empService.findEmpByEid(eid);
        return emp;
    }

    /**
     * 根据传递的eid值删除员工
     * @param eid
     * @return
     */
    @RequestMapping("/delEmpByEid")
    public String delEmpByEid(Integer eid, HttpServletRequest request, HttpSession session){
        //先获取再删除，主要是获取名字
        Emp empByEid = empService.findEmpByEid(eid);
        empService.delEmpByEid(eid);
        logService.addLog("员工表","删除",empByEid.getName(),session,request);
        return "findAllEmp";
    }

    /**
     * 添加员工
     * @param emp
     * @return
     */
    @RequestMapping("/addEmp")
    public String addEmp(Emp emp,HttpServletRequest request,HttpSession session){
        empService.addEmp(emp);
        logService.addLog("员工表","添加",emp.getName(),session,request);
        return "findAllEmp";
    }

    /**
     * 更新员工信息
     * @param emp
     * @return
     */
    @RequestMapping("/updateEmp")
    public String updateEmp(Emp emp,HttpServletRequest request,HttpSession session){
        String empName = emp.getName();
        empService.updateEmp(emp);
        logService.addLog("员工表","修改",empName,session,request);
        return "findAllEmp";
    }

}
