<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/12/3
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <link href="resources/css/Login.css" type="text/css" rel="stylesheet"/>
    <script src="resources/js/ajax.js" charset="utf-8"></script>
    <title>登录界面</title>
    <script type="text/javascript">
        function login() {
            var name = document.getElementById("user").value;
            var pwd = document.getElementById("password").value;
            var param = "name=" + name + "&password=" + pwd;
            if (name=""||pwd=="")
                alert("请输入账号密码");
            else {
                req.open("POST", "servlet/loginServlet", true);
                req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                req.onreadystatechange = function () {
                    if (req.readyState == 4) {
                        if (req.status != 200) {
                            alert(req.responseText);
                            alert("AJAX error:" + req.status);
                            return;
                        }
                        var s = parseInt(req.responseText);
                        if (s == 1) {
                            alert("登陆成功");
                            window.location.href = "frame.jsp";
                        }
                        else {
                            alert("账号密码错误");
                        }
                    }
                };
                req.send(param);
            }
        }
    </script>
</head>


<body>
<div id="bg">
    <div id="whiteblock">
        <h2>学生信息系统登录</h2>
        <form action="#" method="post">
            <div class="input-group input-group-lg">
                <p><input type="text" id="user" class="form-control user" placeholder="请输入管理员用户名" size="25" value=""></p>
                <p><input type="password" id="password" class="form-control user" placeholder="请输入管理员密码" size="25" value="">
                </p>
            </div>
            <p>
                <input type="button" id="put" value="登录" class="btn btn-primary"  onclick="login()"/>
                <span style="font-size:12px">还没有帐号？</span><a href="signup.jsp">前往注册</a>
            </p>
        </form>
    </div>
</div>
</body>

</html>
