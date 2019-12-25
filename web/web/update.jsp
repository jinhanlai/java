<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/12/8
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="entit.Student" %>
<%@ page import="dao.Mysql_query" %>

<html>
<head>
    <link rel="shortcut icon" href="#" />
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="resources/css/update.css" type="text/css" rel="stylesheet"/>
    <script src="resources/js/update.js" charset="UTF-8"></script>
    <script src="resources/js/ajax.js" charset="UTF-8"></script>

</head>
<body>
<%
    if((String)session.getAttribute("username")==null){
        out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='index.jsp'</script>");
    }
%>
<%
    if ((String) session.getAttribute("username") == null) {
        out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='index.jsp'</script>");
    }
    request.setCharacterEncoding("UTF-8");
    String studentId = request.getParameter("search");
    String sqlid = "SELECT * FROM studentinfo where studentId='" + studentId + "'";

    Mysql_query msq=new Mysql_query();

    Student studs=  msq.query(sqlid).get(0);

%>
<div class="contain">
    <form enctype="multipart/form-data" method="post" id="Fileinfo">

        <div class="form-group form-inline">
            <label for="id">学号:</label>
            <input type="text" readonly="true" class="form-control" id="id" name="id" value='<%=studentId %>'
                   required="required">
        </div>
        <div class="form-group form-inline">
            <label for="name">姓名:</label>
            <input type="text" class="form-control" id="name" name="name" maxlength="4" value='<%=studs.getName() %>'
                   required="required">
        </div>
        <div class="form-group form-inline">
            <label for="sex">性别:</label>
            <select name="sex" id="sex">
                <%
                    if (studs.getGender().equals("男")) {
                        out.print("<option value='男'selected='selected'>男</option>");
                        out.print("<option value='女'>女</option>");
                    } else {
                        out.print("<option value='女'selected='selected'>女</option>");
                        out.print("<option value='男'>男</option>");
                    }
                %>
            </select>
        </div>
        <div class="form-group form-inline">
            <label for="birthday">出生日期:</label>
            <input type="date" class="form-control" id="birthday" name="birthday" value='<%=studs.getBirthday() %>'
                   required="required">
        </div>
        <div class="form-group form-inline">
            <label for="college">院部:</label>
            <select name="college" id="college" onchange="change()"  class="college">
                <%--<option selected="selected" value='<%=classname %>'><%=classname %>--%>
                <%--</option>--%>
            </select>
        </div>
        <div class="form-group form-inline">
            <label for="major">专业:</label>
            <select name="major" id="major" class="major">
                <%--<option selected="selected" value='<%=major %>'><%=major %>--%>
                <%--</option>--%>
            </select>
        </div>
        <div class="form-group form-inline">
            <label for="height">身高:</label>
            <input type="text" class="form-control" id="height" name="height" value='<%=studs.getHeight() %>' maxlength="3"
                   required="required">cm
        </div>
        <div class="form-group form-inline">
            <label for="weight">体重:</label>
            <input type="text" class="form-control" id="weight" name="weight" value='<%=studs.getWeight() %>' maxlength="6"
                   required="required">kg
        </div>
        <div class="form-group form-inline">
            <label for="image">头像:</label>
            <input type="file" style="height: 60px; width:200px;text-align: center;" class="form-control" id="image" src="" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" name="image" onchange="changeimg(this)">
            <%--<input type="text" class="form-control" id="image" name="image" required="required">--%>
            <img  id="img1" src="" style="width: 60px;height: 60px;display: none;">
            <input type="hidden" id="hidden" name="=hidden" value='<%=(studs.getPhoto()).replaceAll("\\\\","/")%>'>
        </div>
        <div class="form-group form-inline">
            <input type="button" id="" name="" onclick="update()"   class="btn btn-primary submit" value='修改'/><input type="reset"
                                                                                                 class="btn btn-warning"
                                                                                                 value="重置"/>
        </div>
    </form>
</div>
</body>
</html>
<script type="text/javascript">
    window.onload = function () {
        add_option();
    };
    function add_option() {
        var cls='<%=studs.getClassname()%>';
        var maj='<%=studs.getMajor()%>';
        var target = document.getElementById("college");
        // target.addEventListener("onChange",change());
        for (var i = 0; i < librarians.length; i++) {
            var add_option = document.createElement("option");
            target.appendChild(add_option);
            add_option.text = librarians[i];
            add_option.value = librarians[i];
            if (add_option.value==cls){
                add_option.setAttribute("selected",true);
            }
        }
        var ind=librarians.indexOf(cls);
        if (ind<0)
            ind=0;
        //加载第一个major
        var major = document.getElementById("major");
        for (var j = 0; j < professional[ind].length; j++) {
            var add = document.createElement("option");
            major.appendChild(add);
            add.text = professional[ind][j];
            add.value = professional[ind][j];
            if (add.value==maj){
                add.setAttribute("selected",true);
            }
        }
        var phot='<%=(studs.getPhoto()).replaceAll("\\\\","/").trim()%>';
        if (phot!='null'){
            document.getElementById("img1").src=phot;
            document.getElementById("img1").style.display="block";
        }
    }
</script>