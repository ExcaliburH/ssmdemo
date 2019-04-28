<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/11
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.js"></script>
    <title>登录成功</title>
    <script>
        /*删除用户*/
        function deleteUserById(id) {
            var c = confirm("是否确定删除用户?")
            if (c) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/demo/deleteUser",
                    type: "post",
                    data: { //请求的参数
                        "id": id
                    },
                    success: function (data) {  //执行成功的回调函数 中的data是响应的参数
                        if (data) {
                            alert("删除成功!");
                            window.location.reload();
                        } else {
                            alert("删除失败!");
                        }
                    }
                });
            }
        }
        function updatePd(id) {
            var c = confirm("是否确定重置密码?")
            if (c) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/demo/updatePd",
                    type: "post",
                    data: {
                        "id": id
                    },
                    dataType: "json",
                    success: function (data) {
                        if (data) {
                            alert("密码重置成功!")
                            window.location.reload()
                        } else {
                            alert("密码重置失败!")
                        }
                    }
                });
            }
        }
        function updateUserInfoById() {
            $.ajax({
                url:"${pageContext.request.contextPath}/demo/updataUser",
                type:"post",
                data:{
                    "id":$("#id").val(),
                    "sex": $('input[type=radio][name=sex]:checked').val(),
                    "phonenum":$("#phonenum").val()
                },
                dataType:"json", //服务器返回的数据类型
                success:function (data) {
                    if(data){
                        alert("成功");
                        window.location.reload();
                    }else {
                        alert("失败");
                    }
                }
            });
        }
        function selectUser(id) {
            $.ajax({
                url:"${pageContext.request.contextPath}/demo/selectUser",
                type:"post",
                data:{
                    "id":id
                },
                dataType:"json",
                success:function (data) {
                    $("#id").val(data.id);
                    $("#username").val(data.username);
                    $(":radio[name='sex'][value='" + data.sex + "']").prop("checked", "checked");
                    $("#phonenum").val(data.phonenum);

                }
            });
        }
    </script>
</head>
<body>
<a href="${pageContext.request.contextPath}/demo/delectSeesion"><input type="button" value="退出"></a>
  <table border="1">
      <tr>
          <td>名字</td>
      <td>密码</td>
      <td>性别</td>
          <td>电话</td>
      <td>注册时间</td>
      <td>编辑时间</td>
          <td>操作</td>
      </tr>
      <c:forEach items="${requestScope.list}" var="li">
          <tr>
              <td>${li.username}</td>
              <td>${li.password}</td>
              <td>${li.sex}</td>
              <td>${li.phonenum}</td>
              <td>${li.rtime}</td>
              <td>${li.ctime}</td>
              <td>
                  <button  type='button' class='btn btn-primary btn-xm'
                           data-toggle='modal' data-target='#myModal1' onclick="selectUser(${li.id})" >修改</button>
                  <button  type='button' class='btn btn-primary btn-xm'
                           onclick="updatePd(${li.id})" >重置密码</button>
                  <button  type='button' class='btn btn-primary btn-xm'
                           onclick="deleteUserById(${li.id})" >删除</button>
              </td>
          </tr>
      </c:forEach>

  </table>
  <!--*******模态框********-->
  <div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
       aria-labelledby="myModalLabel" style="margin-top: 95px">
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"
                          aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
              </div>
              <div class="modal-body" align="center">
                  <form class="form-horizontal">
                      <div class="control-group">
                          <label class="control-label" for="username">用户名</label>
                          <div class="controls">
                              <input name="id" type="hidden" id="id" value="">
                              <input name="username" type="text" id="username" readonly="readonly"/>
                          </div>
                      </div>
                      <div class="control-group">
                          <div class="controls">
                              <label class="control-label" for="sex1">性别:男</label>
                              <input name="sex" type="radio" id="sex1" checked="" value="男"/>
                              <label class="control-label" for="sex2">女</label>
                              <input name="sex" type="radio" id="sex2" value="女"/>

                          </div>
                      </div>
                      <div class="control-group">
                          <label class="control-label" for="phonenum">联系电话</label>
                          <span id="span2"></span>
                          <div class="controls">
                              <input onblur="checkNum1()" name="phonenum" type="text" maxlength="11" id="phonenum"
                                     onkeyup="this.value=this.value.replace(/\D/g,'')"
                                     onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                          </div>
                      </div>
                  </form>
              </div>
              <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                  <button type="button" class="btn btn-primary" id="button"
                          onclick="updateUserInfoById()" data-dismiss="modal">保存并修改</a>
                  </button>
              </div>
          </div>
      </div>
  </div>
</body>
</html>