<!DOCTYPE HTML>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <%--<spring:url value="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" var="bootstrapCss" />--%>
    <%--<link rel="stylesheet" type="text/css" href="${bootstrapCss}" />--%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <spring:url value="/css/main.css" var="springCss" />
    <link href="${springCss}" rel="stylesheet" />
</head>
<body>

<div class="container">

    <div class="starter-template">
        <h1>Admin page (Spring Security protected)</h1>

        <h1>Hello ${httpServletRequest.remoteUser}!</h1>
        <form action="/logout" method="post">
            <input type="submit" value="Sign Out"/>
        </form>

    </div>

</div>
<!-- /.container -->

</body>
</html>