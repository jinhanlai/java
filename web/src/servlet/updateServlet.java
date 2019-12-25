package servlet;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import dao.Mysql_update;
import entit.Student;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.net.*;

public class updateServlet extends HttpServlet {

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
            String photo = "";
            // 保存文件
            if (!imagename.equals("")) {
                imagename=imagename.substring((imagename.lastIndexOf(".")));
                smartFile.saveAs("/resources/images/photo/" + studentId+imagename, SmartUpload.SAVE_AUTO);
                photo = "/resources/images/photo/" + studentId+imagename;
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
            String major = smartUpload.getRequest().getParameter("major");
            major = URLDecoder.decode(major, "utf8");
            String height = smartUpload.getRequest().getParameter("height");
            String weight = smartUpload.getRequest().getParameter("weight");


            String hidden = smartUpload.getRequest().getParameter("hidden").trim();
            if (!hidden.isEmpty()&&photo.isEmpty()){
                photo=URLDecoder.decode(hidden, "utf8");
            }


            Student s1 = new Student(studentId, name, gender, birthday, classname, major, height, weight, photo);
            String sql_update = "UPDATE studentinfo SET `name` = ?, `gender` = ?, `birthday` = ?, `classname` = ?, `major` = ?, `height` = ?, `weight` = ?, `photo` = ?  WHERE (`studentId` = "+studentId+")";

            Mysql_update msu = new Mysql_update();
            int result = msu.updateMysql(sql_update, s1);
            out.print(result);

        }catch (SmartUploadException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
