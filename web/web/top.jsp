<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2019/12/7
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>顶部选择框</title>
    <script src="resources/js/ajax.js" charset="UTF-8"></script>
    <script type="text/javascript">
        function zX() {
            document.getElementById("bt1").style.border="none";
            if (confirm("是否注销登录?") == true) {
                req.open("get", "do_logout.jsp", true);
                req.onreadystatechange = function () {
                    if (req.readyState == 4) {
                        if (req.status != 200) {
                            alert(req.responseText);
                            alert("AJAX error:" + req.status);
                            return;
                        }
                        window.location.href = "index.jsp";
                    }
                };
                req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                req.send();
            }
        }
    </script>
</head>
<body>
<%
    String username=(String)session.getAttribute("username");
    if(username==null){
        out.print("<script language='JavaScript'>alert('请先登录！');window.location.href='index.jsp'</script>");
    }
%>
<span style="font-size: 30px;">欢迎<%=username%>用户使用学生管理系统</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="frame.jsp" onmouseover="this.style.color='red'" onmouseout="this.style.color='blue'">返回首页</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type='button' id="bt1"  style="font-size: 20px;background-color: white; color: blue ;border: none;" onmouseover="this.style.color='red'"  onmouseout="this.style.color='blue'" value='注销' onClick='zX()'>

</body>
</html>
