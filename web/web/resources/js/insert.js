var librarians = ['信息科学与技术学院', '机电工程学院', '电子信息学院', '工商管理学院', '财经管理学院', '汽车工程学院'];
var choice = ['---请选择---'];
var informationScience = ['软件工程', '计算机科学与技术', '信息科学与技术', '自动化', '物联网']
var electromeChanical = ['数控技术', '模具设计与制造', '机械制造与自动化', '机电设备维修与管理', '工业机器人', '电气自动化', '机械设计与制造'];
var electronicInformation = ['工业设计', '艺术设计', '光伏工程技术', '光伏发电技术与应用', '物联网应用技术', '计算机应用技术', '通讯技术', '电子信息工程技术'];
var businessCircles = ['物流管理', '电子商务', '市场营销', '国际贸易实务', '工商企业管理', '商务管理'];
var financialManagement = ['会计', '金融管理与实务', '财务管理', '酒店管理', '旅游管理'];
var automobileEngineering = ['食品营养与检测', '汽车技术服务与营销', '汽车检测与维修技术'];

var professional = new Array(7);
professional[0] = choice;
professional[1] = informationScience;
professional[2] = electromeChanical;
professional[3] = electronicInformation;
professional[4] = businessCircles;
professional[5] = financialManagement;
professional[6] = automobileEngineering;


function add_option() {
    var target = document.getElementById("college");
    // target.addEventListener("onChange",change());
    for (var i = 0; i < librarians.length; i++) {
        var add_option = document.createElement("option");
        target.appendChild(add_option);
        add_option.text = librarians[i];
        add_option.value = librarians[i];
    }
}

window.onload = function () {
    add_option();
};

function change() {
    var selevted_college = document.getElementById("college");
    var major = document.getElementById("major");
    major.options.length = 0;
    var index = selevted_college.selectedIndex;
    for (var i = 0; i < professional[index].length; i++) {
        var add_option = document.createElement("option");
        major.appendChild(add_option);
        add_option.text = professional[index][i];
        add_option.value = professional[index][i];
    }
}

function submitd() {
    var x=document.getElementById("Fileinfo");
    var oData = new FormData(x);
    var name=oData.get("name");
    var major=oData.get("major");
    var gender=oData.get("sex");
    var classname = oData.get("college");
    oData.set("name",encodeURI(name));
    oData.set("major",encodeURI(major));
    oData.set("sex",encodeURI(gender));
    oData.set("college",encodeURI(classname));

    var studentId = oData.get("studentId");
    var birthday = oData.get("birthday");


    if (studentId == "" || name == "" || gender == "" || birthday == "" || classname == "" || major == "") {
        alert("请完善学生个人信息");
        return false;
    }
    if(name.indexOf("&")||name.indexOf("+")){
        alert("请输入合法的字符串");
        return false;
    }
    // param = "studentId=" + studentId + "&name=" + name + "&gender=" + gender + "&birthday=" + birthday + "&classname=" + classname + "&major=" + major + "&height=" + height + "&weight=" + weight + "&photo=" + photo;
    // param = encodeURI(param);
    // param = encodeURI(param);
    req.open("POST", "servlet/insertServlet", true);
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
                if (confirm("学生信息注册成功,是否继续注册")) {
                    window.location.href = "frame.jsp?type=insert";
                }
                else {
                    window.location.href = "frame.jsp";
                }
            }
            else if (s == 0) {
                alert("该学生ID已经存在");
            }
            else {
                alert("注册失败")
            }
        }
    };
    req.send(oData);
}

function changeimg() {
    var f= document.getElementById("image").files[0];
    var reader = new FileReader();
    if (typeof(f) == "undefined"){
        document.getElementById('img1').style.display="none";
        return false;
    }
    reader.readAsDataURL(f);
    reader.onload=function (e) {
        document.getElementById('img1').src = reader.result;
        document.getElementById('img1').style.display="block";
    }
    var formData = new FormData();
    formData.append("imageFile",f);
}
