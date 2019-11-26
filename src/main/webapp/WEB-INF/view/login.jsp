<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录页面</title>
</head>
<body>
    <h2>登录页面</h2>
    <form action="<%=basePath%>login/login" method="post">
        <table border="1" align="center" cellpadding="2" cellspacing="2">
            <tr>
                <th align="center">用户名：</th>
                <td>
                    <input type="text" name="userName">
                </td>
            </tr>
            <tr>
                <th align="center">密码：</th>
                <td>
                    <input type="password" name="pwd">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <button type="submit">登录</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>