<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/12/6
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="dao.Mysql_signup" %>
<%
    request.setCharacterEncoding("UTF-8");
    String account = request.getParameter("count");
    String password = request.getParameter("password");
    String sql_quary = "select * from login where account='"+account+"'";
    Mysql_signup mss=new Mysql_signup();
    int result=mss.signupMysql(sql_quary,account,password);
    out.print(result);
%>

