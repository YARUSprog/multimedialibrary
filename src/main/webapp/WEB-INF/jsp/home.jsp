<!DOCTYPE HTML>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Spring Boot Thymeleaf + Spring Security</title>
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
    <spring:url value="/css/main.css" var="springCss" />
	<link href="${springCss}" rel="stylesheet" />
</head>
<body>



<div class="container">

    <div class="starter-template">
        <h1>Spring Boot Web Thymeleaf + Spring Security</h1>
        <h2>1. Visit <a href="/admin">Admin page (Spring Security protected, Need Admin Role)</a></h2>
        <h2>2. Visit <a href="/user">User page (Spring Security protected, Need User Role)</a></h2>
        <h2>3. Visit <a href="/about">Normal page</a></h2>
    </div>

</div>
<!-- /.container -->
<!--<%@ include file="/WEB-INF/jsp/fragments/footer.jsp" %>-->

</body>
</html>