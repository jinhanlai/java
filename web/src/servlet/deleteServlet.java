package servlet;

import dao.MysqlConnect;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class deleteServlet extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id").trim();//获取name的参数值
        MysqlConnect msc = new MysqlConnect();
        msc.Delete(id);
    }
}
