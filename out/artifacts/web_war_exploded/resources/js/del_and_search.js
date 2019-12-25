function del(id) {
    if (confirm("是否确定删除该学生用户？请慎重考虑！！")) {
        var param = "id=" + id;
        req.open("POST", "servlet/deleteServlet", true);
        req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req.onreadystatechange = function () {
            if (req.readyState == 4) {
                if (req.status != 200) {
                    alert(req.responseText);
                    alert("AJAX error:" + req.status);
                    return;
                }
                alert("删除成功");
                window.location.href = "frame.jsp";
            }
        };
        req.send(param);
    }
}

function search() {
    var s = document.getElementById("ch").value.trim();
    if(s.indexOf("&")||s.indexOf("+")||s.indexOf("select")||s.indexOf("drop")){
        alert("请输入合法的字符串");
        return false;
    }

    if (s != "") {
        window.location.href = "frame.jsp?type=search&paramets='" + s + "'";
    }
}