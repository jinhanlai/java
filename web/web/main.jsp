<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/12/4
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.Mysql_query,entit.Student,java.util.ArrayList,java.util.List" %>
<%@ page import="java.io.File" %>
<html>
<head>
    <title>学生详细信息</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="resources/css/main.css" type="text/css" rel="stylesheet"/>
    <script src="resources/js/ajax.js" charset="UTF-8"></script>
    <script src="resources/js/del_and_search.js" charset="UTF-8"></script>

</head>
<body>
<%
    if ((String) session.getAttribute("username") == null) {
        out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='index.jsp'</script>");
    }
    request.setCharacterEncoding("UTF-8");
    String pages = request.getParameter("pages");//获取当前页数
    if (pages == null)
        pages = "1";
    int pagesNo = Integer.parseInt(pages);//把当前页数从字符串转为整型
    int pageSize = 4;//指定数据库一次读取多少行
    int startLine = (pagesNo - 1) * pageSize;//指定数据库从哪一行开始读取
%>

<div class="contain">
    <div class="form-inline">
        <h2 style="margin-left: 200px;">学生信息</h2>
        <div class="form-group search">
            <input type="text" id="ch" name="check" style="width:300px;" class="form-control" placeholder="请输入姓名、学号或专业进行模糊查询"/>
            <input type="button" name="submit" class="btn" value="搜索" onclick="search()"/>
        </div>
    </div>

    <a href="frame.jsp?type=insert">
        <button class="btn btn-primary add">添加学生资料</button>
    </a>
    <div style="margin-top: 20px">
        <table class="table table-hover tb">
            <thead>
            <tr>
                <th style="width: 120px;">学号</th>
                <th style="width: 90px;">姓名</th>
                <th style="width: 60px;">性别</th>
                <th style="width: 130px;">出生日期</th>
                <th style="width: 180px;">学院</th>
                <th style="width: 160px;">专业</th>
                <th style="width: 80px;">身高</th>
                <th style="width: 60px;">体重</th>
                <th style="width: 180px;text-align: center">照片</th>
                <th style="width: 180px;text-align: center">操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                String sqlQuery = "select *  from studentinfo limit " + startLine + "," + pageSize;//对数据库进行伪分页读取，一次只能读10行
                int pagesCount = 0;//用于数据库最后读出所有行后总共有多少页
                String sqlAll  = "select * from studentinfo";
                Mysql_query mq=new Mysql_query();
                List<Student> studs = new ArrayList<Student>();
                int lastRow=mq.get_latRow(sqlAll);//记录数据库的最后一行
                studs=mq.query(sqlQuery);
                for (Student stud : studs) {
                    out.print("<tr>");
                    out.print("<td>" + stud.getStudenId() + "</td>");
                    out.print("<td>" + stud.getName() + "</td>");
                    out.print("<td>" + stud.getGender() + "</td>");
                    out.print("<td>" + stud.getBirthday() + "</td>");
                    out.print("<td>" + stud.getClassname() + "</td>");
                    out.print("<td>" + stud.getMajor() + "</td>");
                    out.print("<td>" + stud.getHeight() + "cm" + "</td>");
                    out.print("<td>" + stud.getWeight() + "kg" + "</td>");
                    out.print("<td style='text-align: center'><img src='"+(stud.getPhoto()).replaceAll("\\\\","/")+"' style='width: 60px;height: 60px;'></td>");
                    out.print("<td style='text-align: center'><a href='frame.jsp?type=update&paramets="+stud.getStudenId()+"'><button class='btn btn-primary'>修改</button></a><a href='#' onclick='del(" + stud.getStudenId() + ");'><button class='btn btn-danger'>删除</button></a></td>");
                    out.print("</tr>");
                }
            %>
            </tbody>
        </table>
        <div class="pageNav">
            <ul class="pagination">
                <%
                    int prePage;//上一页的页数
                    if (pagesNo == 1) {
                        prePage = 1;//若当前页是第一页，则第一页只能是当前页
                    } else {
                        prePage = pagesNo - 1;//除了上述情况外上一页等于当前页-1页
                    }
                %>
                <li class="page-item"><a class="page-link" href="frame.jsp?pages=<%=prePage%>">上一页</a></li>
                <%
                    pagesCount = (lastRow % pageSize == 0) ? (lastRow / pageSize) : (lastRow / pageSize + 1);//计算数据库能读出来的全部页数
                    int minpages = (pagesNo - 3 > 0) ? (pagesNo - 3) : 1;//设定最小页，防止页数小于第一页
                    int maxpages = (pagesNo + 3 >= pagesCount) ? (pagesCount) : (pagesNo + 3);//设定最大页
                    for (int i = minpages; i <= maxpages; i++) {
                        if (i == pagesNo) {//当前页和遍历出来的页数相等时，需要通过调用css里面的样式“active"进行高亮
                            out.print("<li class='page-item active'>");
                            out.print("<a class='page-link' href='frame.jsp?pages=" + i + "'>" + i + "</a>");
                            out.print("</li>");
                        } else {//输出每一个分页
                            out.print("<li class='page-item'>");
                            out.print("<a class='page-link' href='frame.jsp?pages=" + i + "'>" + i + "</a>");
                            out.print("</li>");
                        }
                    }
                %>
                <%
                    int nextPage;
                    if (pagesNo == pagesCount) {//下一页的原理和上一页同理
                        nextPage = pagesCount;
                    } else {
                        nextPage = pagesNo + 1;
                    }
                %>
                <li class="page-item"><a class="page-link" href="frame.jsp?pages=<%=nextPage%>">下一页</a></li>

            </ul>
        </div>
    </div>
</div>

</body>
</html>
