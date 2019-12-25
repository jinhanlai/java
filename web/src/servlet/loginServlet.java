package servlet;

import dao.MysqlConnect;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class loginServlet extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();//创建session对象
        String name = request.getParameter("name");//获取name的参数值
        String password = request.getParameter("password");//获取password的参数值
        String sql="select * from login where account = '" + name + "' and password = '" + password + "'";
        MysqlConnect msc=new MysqlConnect();
        int result=msc.Query(sql);
        if (result==0){//数据库中有记录
            session.setAttribute("username",name);
            session.setAttribute("password",password);
            out.print("1");
        }
        else{
            out.print("0");
        }
    }
}

