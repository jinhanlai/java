package servlet;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import dao.Mysql_insert;
import entit.Student;

import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class insertServlet extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        SmartUpload smartUpload = new SmartUpload();
        ServletConfig config = this.getServletConfig();
        smartUpload.initialize(config, request, response);
        try {
            // 上传文件
            smartUpload.upload();
            // 得到上传的文件对象
            com.jspsmart.upload.File smartFile = smartUpload.getFiles().getFile(0);
            String imagename = smartFile.getFileName().trim();
            String studentId = smartUpload.getRequest().getParameter("id");
            String photo="";
            // 保存文件
            if(!imagename.equals(""))
            {
                imagename=imagename.substring((imagename.lastIndexOf(".")));
                smartFile.saveAs("/resources/images/photo/"+studentId+imagename, SmartUpload.SAVE_AUTO);
                 photo="/resources/images/photo/"+studentId+imagename;
            }
            // 传过来的注册数据
            // 只需要new SmartUpload().getRequest().getParameter(""))就能获取到相应的表单数据

            String name = smartUpload.getRequest().getParameter("name");
            name = URLDecoder.decode(name, "utf8");
            String gender = smartUpload.getRequest().getParameter("sex");
            gender = URLDecoder.decode(gender, "utf8");

            String birthday = smartUpload.getRequest().getParameter("birthday");
            String classname = smartUpload.getRequest().getParameter("college");
            classname = URLDecoder.decode(classname, "utf8");
            String major =  smartUpload.getRequest().getParameter("major");
            major = URLDecoder.decode(major, "utf8");
            String height = smartUpload.getRequest().getParameter("height");
            String weight = smartUpload.getRequest().getParameter("weight");

            Student s1 = new Student(studentId, name, gender, birthday, classname, major, height, weight, photo);
            request.setCharacterEncoding("UTF-8");
            String sql_accound = "select * from studentinfo where studentId='" + studentId + "'";
            Mysql_insert msi = new Mysql_insert();
            int x = msi.insertMysql(sql_accound, s1);
            out.print(x);

        } catch (SmartUploadException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }

}
