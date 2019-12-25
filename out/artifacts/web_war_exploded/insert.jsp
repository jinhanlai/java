<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/12/8
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="resources/css/insert.css" type="text/css" rel="stylesheet"/>
    <script src="resources/js/insert.js" charset="UTF-8"></script>
    <script src="resources/js/ajax.js" charset="UTF-8"></script>

</head>
<body>
<%
    if((String)session.getAttribute("username")==null){
        out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='index.jsp'</script>");
    }
%>
<div class="contain">
    <form enctype="multipart/form-data" method="post" id="Fileinfo" >
        <div class="form-group form-inline">
            <label for="id">学号:</label>
            <input type="text" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control" id="id" name="id" maxlength="11" required="required">
        </div>
        <div class="form-group form-inline">
            <label for="name">姓名:</label>
            <input type="text" class="form-control" id="name" name="name" maxlength="4" required="required">
        </div>
        <div class="form-group form-inline">
            <label for="sex" >性别:</label>
            <select name="sex" id="sex">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
        <div class="form-group form-inline">
            <label for="birthday">出生日期:</label>
            <input type="date" class="form-control" id="birthday" name="birthday" required="required">
        </div>
        <div class="form-group form-inline">
            <label for="college">院部:</label>
            <select name="college" id="college" onchange="change()" class="college" >
                <option selected="selected" value="">---请选择---</option>
            </select>
        </div>
        <div class="form-group form-inline">
            <label for="major">专业:</label>
            <select name="major" id="major" class="major">
                <option selected="selected" value="">---请选择---</option>
            </select>
        </div>

        <div class="form-group form-inline">
            <label for="height">身高:</label>
            <input type="text" class="form-control" id="height" name="height"   maxlength="3" required="required">cm
        </div>
        <div class="form-group form-inline">
            <label for="weight">体重:</label>
            <input type="text" class="form-control" id="weight" name="weight"  maxlength="6" required="required">kg
        </div>
        <div class="form-group form-inline">
            <label for="image">头像:</label>
            <input type="file" style="height: 60px; width:200px;text-align: center;" class="form-control" id="image" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" name="image" onchange="changeimg(this)">
            <%--<input type="text" class="form-control" id="image" name="image" required="required">--%>
            <img src="" id="img1" style="width: 60px;height: 60px;display: none;">
        </div>
        <div class="form-group form-inline">
            <input type="button" style="width:100px; margin-left: 125px;"  value="提交" onclick="submitd()"   class="btn btn-primary"/>
        </div>
    </form>
</div>
</body>
</html>
