<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/12/4
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
    <link href="resources/css/signup.css" type="text/css" rel="stylesheet"/>
    <script src="resources/js/ajax.js" charset="utf-8"></script>
</head>
<script type="text/javascript">
    function register() {
        req.open("POST", "do_signup.jsp", true);
        req.onreadystatechange = function () {
            if (req.readyState == 4) {
                if (req.status != 200) {
                    alert(req.responseText);
                    alert("AJAX error:" + req.status);
                    return;
                }
                var s = req.responseText;

                if (s == 1) {
                    alert("注册成功,返回登录界面");
                    window.location.href = "index.jsp";
                }
                else if (s==0){
                    alert("账号已经存在");
                }
                else {
                    alert("注册失败")
                }
            }
        };
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var count = document.getElementById("name").value;
        var ps1 = document.getElementById("ps1").value;
        var ps2 = document.getElementById("ps2").value;
        if (count.length > 6) {
            alert("最多只能输入六位字符或者数字");
        }
        else {
            if (count.indexOf("+") != -1 && count.indexOf("&") != -1 && ps1.indexOf("+") != -1 && ps1.indexOf("&") != -1) {
                alert("账号密码不能包含特殊字符+ &");
                return;
            }
            if (ps1 == ps2) {
                var param = "count=" + count + "&password=" + ps1;
                req.send(param);
            }
            else {
                alert("两次输入的密码不一致");
            }
        }
    }
</script>
<body>
<div id="bg">
    <div id="whiteblock">
        <h2>管理员账号注册</h2>
        <form action="#" >
            <div class="input-group input-group-lg">
                <p><input type="text" id="name" class="form-control user" placeholder="请输入用户名" size="25" value=""></p>
                <p><input type="password" id="ps1" class="form-control user" placeholder="请输入密码" size="25" value="">
                <p><input type="password" id="ps2" class="form-control user" placeholder="请再次输入密码" size="25" value="">
                </p>
            </div>
            <p>
                <input type="button" id="put" value="注册" class="btn btn-primary"  onclick="register();"/>
                <span style="font-size:12px">已有账号返回登录界面？</span><a href="index.jsp">前往登录</a>
            </p>
        </form>
    </div>
</div>
</body>

</html>
