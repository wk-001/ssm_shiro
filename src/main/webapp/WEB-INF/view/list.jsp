<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
</head>
<body>
<h1>欢迎登录：<shiro:principal></shiro:principal> </h1>
<h1>欢迎登录：${sessionScope.user.userName} </h1>
    <shiro:hasPermission name="user:add">
        <h2><a href="/user/add">添加</a></h2>
    </shiro:hasPermission>

    <shiro:hasRole name="admin">
        <h2><a href="/user/del">删除</a></h2>
    </shiro:hasRole>

    <shiro:hasPermission name="user:delete">
        <h2><a href="/user/upd">修改</a></h2>
    </shiro:hasPermission>

    <h2><a href="/user/query">查询</a></h2>
</body>
</html>