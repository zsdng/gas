package cn.fy.controller;

import cn.fy.domain.Cylinder;
import cn.fy.domain.CylinderChart;
import cn.fy.domain.User;
import cn.fy.exception.LoginException;
import cn.fy.service.CylinderService;
import cn.fy.service.LogService;
import cn.fy.utils.DownLoadUtils;
import cn.fy.utils.ExportExcel;
import cn.fy.utils.PageUtils;
import com.github.pagehelper.PageInfo;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.NotOfficeXmlFileException;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author: Fy
 * 气瓶的相关Controller
 * @create: 2020-04-20 16:43
 */
@Controller
@RequestMapping("/cylinder")
public class CylinderController {
    @Autowired
    private CylinderService cylinderService;
    @Autowired
    private LogService logService;

    public void setCylinderService(CylinderService cylinderService) {
        this.cylinderService = cylinderService;
    }

    /**
     * 分页查询所有存储的气瓶信息，请求转发到listall.jsp页面
     *
     * @param pageUtils 分页对象
     * @param model
     * @return 显示页面
     */
    @RequestMapping("/findAllCy")
    public String findAll(PageUtils pageUtils, Model model, HttpSession session) {
        if (pageUtils.getPageIndex() == 0) {
            pageUtils.setPageIndex(1);
        }
        if (pageUtils.getPageSize() == 0) {
            pageUtils.setPageSize(6);
        }
        //只要一查询所有就要remove那个kind的session
        session.removeAttribute("kind");
        PageInfo list = cylinderService.findAll(pageUtils);
        model.addAttribute("pageCy", list);
        return "listall.jsp";
    }

    /**
     * 送气
     *
     * @param id
     * @return
     */
    @RequestMapping("/sendCylinder")
    public String sendCylinder(Integer id, HttpServletRequest request, HttpSession session) {
        String kind = cylinderService.findById(id).getKind();
        cylinderService.sendCylinder(id);
        logService.addLog("气瓶存储表", "送气", kind, session, request);
        return "findAllCy";
    }


    @RequestMapping("/addCylinder")
    public String addCylinder(Cylinder cylinder, HttpServletRequest request, HttpSession session) {
        cylinderService.addCylinder(cylinder);
        logService.addLog("气瓶存储", "入库", cylinder.getKind(), session, request);
        return "findAllCy";
    }

    @RequestMapping("/updateCylinder")
    public String updateCylinder(Cylinder cylinder, HttpServletRequest request, HttpSession session) {
        String kind = cylinder.getKind();
        cylinderService.updateCylinder(cylinder);
        logService.addLog("气瓶存储", "修改为", kind, session, request);
        return "findAllCy";
    }

    /**
     * Ajax异步根据传入的state查询
     *
     * @param state 气瓶状态 true已充气，false未充气
     * @return
     */
    @RequestMapping("/findByStateI")
    @ResponseBody
    public Integer findByStateI(Boolean state) {
        return cylinderService.findByStateI(state);
    }

    /**
     * 根据传入的state查询所有已充气的气瓶的信息
     *
     * @param pageUtils 分页对象工具类，需要当前页和每页显示的数量
     * @param model
     * @param state     气瓶状态 true已充气
     * @return
     */
    @RequestMapping("/findByStateLtrue")
    public String findByStateLtrue(PageUtils pageUtils, Model model, Boolean state, HttpSession session) {
        if (pageUtils.getPageIndex() == 0) {
            pageUtils.setPageIndex(1);
        }
        if (pageUtils.getPageSize() == 0) {
            pageUtils.setPageSize(6);
        }
/*        if (state == null || !state) {
            state = true;
        }*/
        //只要一查询所有就要remove那个kind的session
        session.removeAttribute("kind");
        PageInfo list = cylinderService.findByStateL(true, pageUtils);
        model.addAttribute("pageCy", list);
        return "listtrue.jsp";
    }

    /**
     * 根据传入的state查询所有未充气的气瓶的信息
     *
     * @param pageUtils 分页对象工具类，需要当前页和每页显示的数量
     * @param model
     * @param state     气瓶状态 false未充气
     * @return
     */
    @RequestMapping("/findByStateLfalse")
    public String findByStateLfalse(PageUtils pageUtils, Model model, Boolean state, HttpSession session) {
        if (pageUtils.getPageIndex() == 0) {
            pageUtils.setPageIndex(1);
        }
        if (pageUtils.getPageSize() == 0) {
            pageUtils.setPageSize(6);
        }
        if (state == null || state) {
            state = false;
        }
        //只要一查询所有就要remove那个kind的session
        session.removeAttribute("kind");
        PageInfo list = cylinderService.findByStateL(false, pageUtils);
        model.addAttribute("pageCy", list);
        return "listfalse.jsp";
    }

    /**
     * 柱状图中的数据
     *
     * @param
     * @return 返回集合对象，json类型
     */
    @RequestMapping("/GroupByKindAndStateTrue")
    public String GroupByKindAndState(Model model) {
        List<CylinderChart> fyt = cylinderService.GroupByKindAndState(true);
        List<CylinderChart> fyf = cylinderService.GroupByKindAndState(false);
        model.addAttribute("fyt", fyt);//true的集合返回名称是fangyuantrue的简写下同
        model.addAttribute("fyf", fyf);
        return "../chart/chartstate.jsp";
    }

    /**
     * 在查询所有页面点击修改会跳转到该方法
     *
     * @param id    前端点击修改获取到的气瓶id
     * @param model
     * @return 转发到update更新页面
     */
    @RequestMapping("/findcylinderById")
    public String findcylinderById(Integer id, Model model) {
        Cylinder cylinder = cylinderService.findById(id);
        model.addAttribute("cylinder", cylinder);
        return "updatecylinder.jsp";
    }

    /**
     * 根据传入的分页对象和想要查看的气瓶的种类返回Pageinfo对象
     *
     * @param pageUtils
     * @param model
     * @param kind      所装气体的种类
     * @return
     */
    @RequestMapping("/findByKindList")
    public String findByKindList(PageUtils pageUtils, Model model, String kind, HttpSession session) {
        if (pageUtils.getPageIndex() == 0) {
            pageUtils.setPageIndex(1);
        }
        if (pageUtils.getPageSize() == 0) {
            pageUtils.setPageSize(3);
        }
        if (kind == null || "".equals(kind)) {
            return "findAllCy";
        }
        PageInfo list = cylinderService.findByKindL(kind, pageUtils);
        model.addAttribute("pageCy", list);
        session.setAttribute("kind", kind);
        return "listall.jsp";
    }

    /**
     * 分页分类按照state等于true的方式查询kind对应的数
     *
     * @param kind
     * @param state     固定true
     * @param pageUtils
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/findByKindAndStateTrue")
    public String findByKindAndStateTrue(String kind, Boolean state, PageUtils pageUtils, HttpSession session, Model model) {
        if (pageUtils.getPageIndex() == 0) {
            pageUtils.setPageIndex(1);
        }
        if (pageUtils.getPageSize() == 0) {
            pageUtils.setPageSize(3);
        }

        if (state == null || !state) {
            state = true;
        }
        if (kind == null || "".equals(kind)) {
            return "findByStateLtrue";
        }

        PageInfo pageCy = cylinderService.findByKindAndStateTrue(kind, true, pageUtils);

        model.addAttribute("pageCy", pageCy);
        session.setAttribute("kind", kind);
        return "listtrue.jsp";
    }

    /**
     * 分页分类按照state等于false的方式查询kind对应的气瓶数
     *
     * @param kind
     * @param state     固定false
     * @param pageUtils
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/findByKindAndStateFalse")
    public String findByKindAndStateFalse(String kind, Boolean state, PageUtils pageUtils, HttpSession session, Model model) {
        if (pageUtils.getPageIndex() == 0) {
            pageUtils.setPageIndex(1);
        }
        if (pageUtils.getPageSize() == 0) {
            pageUtils.setPageSize(3);
        }
        if (state == null || state) {
            state = false;
        }
        if (kind == null || "".equals(kind)) {
            return "findByStateLfalse";
        }
        //只要一查询所有就要remove那个kind的session
        session.removeAttribute("kind");
        PageInfo pageCy = cylinderService.findByKindAndStateFalse(kind, false, pageUtils);
        model.addAttribute("pageCy", pageCy);
        session.setAttribute("kind", kind);
        return "listfalse.jsp";
    }

    /**
     * 选中的气瓶批量送走
     *
     * @param checkid
     * @return
     */
    @RequestMapping("/sendSelectedCylinder")
    public String sendSelectedCylinder(Integer[] checkid, HttpServletRequest request, HttpSession session) {
        Cylinder check0 = cylinderService.findById(checkid[0]);
        int length = checkid.length;
        for (Integer id : checkid) {
            cylinderService.sendCylinder(id);
        }
        logService.addLog("气瓶存储", "批量送气", check0.getKind() + "等" + length + "个", session, request);
        return "findByKindAndStateTrue";
    }

    /**
     * 单独送气，listtrue页面必备！
     *
     * @param id
     * @return
     */
    @RequestMapping("/sendCylinderTrue")
    public String sendCylinderTrue(Integer id, HttpServletRequest request, HttpSession session) {
        String kind = cylinderService.findById(id).getKind();
        cylinderService.sendCylinder(id);
        logService.addLog("气瓶存储", "送气", kind, session, request);
        return "findByStateLtrue";
    }

    /**
     * 给选中的气瓶批量送去加气
     *
     * @param checkid
     * @return
     */
    @RequestMapping("/addSelectedQi")
    public String addSelectedQi(Integer[] checkid, HttpServletRequest request, HttpSession session) {
        Cylinder check0 = cylinderService.findById(checkid[0]);
        int length = checkid.length;
        for (Integer id : checkid) {
            cylinderService.sendToAddQi(id);
        }
        logService.addLog("气瓶存储", "批量送去充气", check0.getKind() + "等" + length + "个", session, request);
        return "findByKindAndStateFalse";
    }


    /**
     * 给单个的气瓶单个送去加气
     *
     * @param id
     * @return
     */
    @RequestMapping("/addQi")
    public String addQi(Integer id, HttpServletRequest request, HttpSession session) {
        String kind = cylinderService.findById(id).getKind();
        cylinderService.sendToAddQi(id);
        logService.addLog("气瓶存储", "送去充气", kind, session, request);
        return "findByKindAndStateFalse";
    }

    /**
     * 通过excel表格批量添加数据
     *
     * @param request
     * @param session
     * @return
     * @throws LoginException
     */
    @RequestMapping("/uploadExcel")
    @ResponseBody
    public Integer uploadExcel(MultipartHttpServletRequest request, HttpSession session,HttpServletRequest request123 )  {
        try {
            String operator = (String) session.getAttribute("username");
            //得到上传的文件此处的attach与上面提到的保持一致！
            MultipartFile fileFile = request.getFile("file");
            //转换成输入流
            InputStream in = fileFile.getInputStream();
            XSSFWorkbook readWb = new XSSFWorkbook(in);
            List<Cylinder> list = new ArrayList<>();
            /*HSSFWorkbook readWb = new HSSFWorkbook(in);*/
            //遍历该表格中所有的工作表，i表示工作表的数量 getNumberOfSheets表示工作表的总数
            for (int i = 0; i < readWb.getNumberOfSheets(); i++) {
                XSSFSheet sheet = readWb.getSheetAt(i);
                // 循环行Row
                for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
                    XSSFRow hssfRow = sheet.getRow(rowNum);
                    if (hssfRow != null) {
                        //因为我没有找到更好的方法，所以只能一个个去set
                        Cylinder cylinder = new Cylinder();
                        for (int colNum = 0; colNum < 5 ; colNum++) {
                            if (colNum == 0) {
                                cylinder.setKind(hssfRow.getCell(0).toString());
                            }
                            if (colNum == 1) {
                                String stringCellValue = hssfRow.getCell(1).toString();
                                if ("已充气".equals(stringCellValue)) {
                                    cylinder.setState(true);
                                } else if ("未充气".equals(stringCellValue)) {
                                    cylinder.setState(false);
                                }
                            }
                            if (colNum == 2) {
                                cylinder.setManufacturer(hssfRow.getCell(2).toString());
                            }
                            if (colNum == 3) {
                                cylinder.setArea(hssfRow.getCell(3).toString());
                            }
                            if (colNum == 4) {
                                //此处通过一个cell对象的一个方法来获取excel中的date日期类型
                                XSSFCell cell = hssfRow.getCell(4);
                                Date date = cell.getDateCellValue();
                                cylinder.setCreatetime(date);
                                cylinder.setOperator(operator);
                            }
                            //观察一下获取到的数据
                            System.out.println(hssfRow.getCell(colNum));
                        }
                        //将Cylinder对象存入List集合
                        list.add(cylinder);
                        //赋值实例对象 做插入数据库操作
                    }
                }
            }
            cylinderService.addCylinder(list);
            logService.addLog("气瓶存储", "excel批量入库", "excel表格入库" + list.size() + "个", operator, request123);
        } catch (NullPointerException e) {
            e.printStackTrace();
            return 1000;
        } catch (NotOfficeXmlFileException e){
            e.printStackTrace();
            return 9999;
        }catch (Exception e){
            e.printStackTrace();
            return 6666;
        }
        return 1;
    }

    @RequestMapping("/downloadExcel")
    public void downloadExcel(HttpServletRequest request, HttpServletResponse response) throws LoginException, IOException {
        FileInputStream fis = null;
        try {
            //1.获取请求参数，文件名称
            //2.使用字节输入流加载文件进内存
            //2.1找到文件服务器路径
            String filename = "excel.xlsx";
            ServletContext servletContext = request.getSession().getServletContext();
            String realPath = servletContext.getRealPath("/excel/excel.xlsx");
            //2.2用字节流关联
            fis = new FileInputStream(realPath);
            //3.设置response的响应头
            //3.1设置响应头类型：content-type
            String mimeType = servletContext.getMimeType(filename);//获取文件的mime类型
            response.setHeader("content-type", mimeType);
            //3.2设置响应头打开方式:content-disposition
            //解决中文文件名问题
            //1.获取user-agent请求头、
            String agent = request.getHeader("user-agent");
            //2.使用工具类方法编码文件名即可
            filename = DownLoadUtils.getFileName(agent, filename);
            response.setHeader("content-disposition", "attachment;filename=" + filename);
            //4.将输入流的数据写出到输出流中
            ServletOutputStream sos = response.getOutputStream();
            byte[] buff = new byte[1024 * 8];
            int len = 0;
            while ((len = fis.read(buff)) != -1) {
                sos.write(buff, 0, len);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new LoginException("下载失败，请联系管理员fy！");
        } finally {
            if (fis != null) {
                fis.close();
            }
        }

    }

    @RequestMapping("/excelExport")
    public void excelExport(HttpServletResponse response, HttpServletRequest request) {
        List<Cylinder> dataset = cylinderService.findAll();
        //填充dataset
        //临时文件
        File tempFile = null;
        try {
            //Excel导出工具类
            ExportExcel<Cylinder> ex = new ExportExcel<Cylinder>();
            //导出的标题列
            String[] headers = { "气瓶id", "所装气体", "气瓶状态", "制造商", "制造地", "制造时间","入库时间","操作员" };
            //时间格式化
            SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
            //要保存的文件名
            String filename = "cylinder_" + format.format(new Date()) + ".xlsx";//其实这里写.xls也可以的我都试过
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
            String[] sheetNames = { "气瓶存储" };
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



