package cn.fy.controller;

import cn.fy.domain.MyLog;
import cn.fy.service.LogService;
import cn.fy.utils.ExportExcel;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageInfo;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author: Fy
 * @create: 2020-04-23 21:26
 */
@Controller
@RequestMapping("/log")

public class MyLogController {
    @Autowired
    private LogService logService;

    @RequestMapping("/findAllLog")
    public String findAllEmp(Model model, PageUtils pageUtils) {
        if (pageUtils.getPageIndex() == 0) {
            pageUtils.setPageIndex(1);
        }
        if (pageUtils.getPageSize() == 0) {
            pageUtils.setPageSize(8);
        }
        PageInfo pageLog = logService.findAll(pageUtils);
        model.addAttribute("pageLog", pageLog);
        return "../log/loglist.jsp";
    }

    @RequestMapping("/deleteLog")
    public String deleteLog(Integer id) {
        logService.deleteLogBy(id);
        return "findAllLog";
    }

    @RequestMapping("/findLast")
    @ResponseBody
    public String findLast(String lname) {
        MyLog myLog = logService.findLastAndIp(lname);
        if (myLog == null) {
            return "欢迎您首次访问";
        }else {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
           return  "您上次访问时间为："+sdf.format(myLog.getLtime());
        }
    }

    @RequestMapping("/excelExport")
    public void excelExport(HttpServletResponse response, HttpServletRequest request) {
        List<MyLog> dataset = logService.findAll();
        //填充dataset
        //临时文件
        File tempFile = null;
        try {
            //Excel导出工具类
            ExportExcel<MyLog> ex = new ExportExcel<MyLog>();
            //导出的标题列
            String[] headers = { "日志id", "涉及表", "操作类型", "涉及对象", "操作员", "操作时间","ip地址"};
            //时间格式化
            SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
            //要保存的文件名
            String filename = "log_" + format.format(new Date()) + ".xlsx";//其实这里写.xls也可以的我都试过
            //要保存的根目录
            String rootDir = request.getSession().getServletContext().getRealPath("/");
            //要保存的目录路径
            String path = rootDir + File.separator + "tempfile";
            System.out.println(path);
            File saveDir = new File(path);
            if (!saveDir.exists()) {
                saveDir.mkdirs();// 如果文件不存在则创建文件夹
            }
            //文件路径
            path = path + File.separator + filename;
            tempFile = new File(path);   //初始化临时文件
            //输出流
            OutputStream out = new FileOutputStream(tempFile);
            //实例化Excel表格
            HSSFWorkbook workbook = new HSSFWorkbook();
            //创建工作表单
            String[] sheetNames = { "操作记录" };
            for (int i = 0; i < sheetNames.length; i++) {
                workbook.createSheet(sheetNames[i]);
            }
            //导出到Excel
            ex.exportExcel(sheetNames[0], headers, dataset, out,
                    "yyyy-MM-dd HH:mm", workbook);
            try {
                //保存文件
                workbook.write(out);
            } catch (IOException e) {
                e.printStackTrace();
            }
            out.close();
            // 以流的形式下载文件。
            BufferedInputStream fis = new BufferedInputStream(
                    new FileInputStream(path));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
            // 清空response
            response.reset();
            // 设置response的Header
            response.addHeader("Content-Disposition", "attachment;filename="
                    + new String(filename.getBytes()));
            response.addHeader("Content-Length", "" + tempFile.length());
            OutputStream toClient = new BufferedOutputStream(
                    response.getOutputStream());
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (tempFile != null && tempFile.exists()) {
                tempFile.delete();// 删除临时文件
            }
        }
    }

}
