<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/12/7
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="#" />
    <link href="resources/css/frame.css" type="text/css" rel="stylesheet"/>
    <title>学生管理</title>

</head>
<body>
<%
    if ((String) session.getAttribute("username") == null) {
        out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='index.jsp'</script>");
    }
    request.setCharacterEncoding("UTF-8");
    String type = request.getParameter("type");//获取当前页数
    String pages="";
    if (type == null)
        type = "main";
    if (type.equals("main")||type.equals("search")){
        pages = request.getParameter("pages");//获取当前页数
        if (pages == null)
            pages = "1";
        int pagesNo = Integer.parseInt(pages);//把当前页数从字符串转为整型
    }
    else {
        pages="";
    }
    String search = request.getParameter("paramets");
    type=type+".jsp";

%>
<div class="main">
    <div style="height: 80px; text-align: center; position: relative">
        <div style="height: 50px; margin-top: 25px">
            <%@ include file="top.jsp" %>
        </div>

    </div>
    <div>
        <jsp:include page="<%=type%>">
            <jsp:param name="pages" value="<%=pages%>"/>
            <jsp:param name="search" value="<%=search%>"/>
        </jsp:include>
    </div>
</div>

</body>
</html>
