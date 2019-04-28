<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
<title>注册</title>
    <script>
        function check(){
            var text=document.getElementById("username").value;
            var pass=document.getElementById("password").value;                              //通过id获取需要验证的表单元素的值
            if(text==" "){                                                                               //当上面获取的值为空时
                alert("不能为空哦！");                                                         //弹出提示
                return false;                                                        //返回false（不提交表单）
            }if(pass==""){
                alert("密码不能为空!");
                return false;
            }
            return true;                                                                   //提交表单
        }

        function checkphone(){
            $.ajax({
                url: "${pageContext.request.contextPath}/demo/phone",
                type: "post",
                data: {
                    "phonenum":$("#phonenum").val() ///用#号，代表id选择器。$("#"+)选择出相应的元素
                },
                dataType: "json",
                success: function (data) {
                    if (data) {
                        $("#span2").html("<font color='red'>重复!</font>");
                        $("#button").attr("disabled", true);
                    } else {
                        $("#span2").html("<font color='#ffd700'>可以使用!</font>")
                        $("#button").attr("disabled", false);
                    }
                }
            });
        }
        //用户名校验
        function checkname() {
            $.ajax({
                url: "${pageContext.request.contextPath}/demo/name",
                type: "post",
                data: {
                    "username": $("#username").val()
                },
                dataType: "json",
                success: function (data) {
                    if (data) {
                        $("#span1").html("<font color='red'>用户名重复!</font>");
                        $("#button").attr("disabled", true);
                    } else {
                        $("#span1").html("<font color='green'>用户名可以使用!</font>")
                        $("#button").attr("disabled", false);
                    }
                }
            });
        }
        /*校验手机
        var pValue = document.getElementById("phone").value;
        if(!(86)*0*13\d{9}.test(eValue)){
            alert("手机格式不正确!");
            return false;
        }*/
    </script>
</head>
<body>
<form action="${pageContext.request.contextPath}/demo/userRegist" method="post" onsubmit="return check()">
    <table class="table1">
        <caption>注册</caption>
        <tr>
            <td>用户名</td>
            <td><input type="text" id="username" name="username"  onblur="checkname()"  onkeyup="this.value=this.value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\. @~（）_《》。？?【】：：:;]/g,'')"> <span id="span1"></span></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="password" id="password"></td>
        </tr>
        <tr>
            <td>手机号</td>
            <td><input type="text" name="phonenum" id="phonenum" onblur="checkphone()"><span id="span2"></span></td>
        </tr>
        <tr>
            <td>性别</td>
            <td><input type="radio" name="sex" value="男">男
                <input type="radio" name="sex" value="女">女<br></td>
        </tr>
        <tr>
            <td><input type="submit"  value="注册" id="button" ></td>
        </tr>
    </table>
</form>
<form action="${pageContext.request.contextPath}/demo/userLogin" method="post">
    <table id="table2">
        <tr>
            <td>用户名</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="password"></td>
        </tr>
    </table>
    <input type="submit"  value="登录"  >
</form>
</body>
</html>