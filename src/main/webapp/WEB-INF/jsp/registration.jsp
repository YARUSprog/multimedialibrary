<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Spring Security Example </title>
    <%--&lt;%&ndash;<spring:url value="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" var="bootstrapCss" />&ndash;%&gt;--%>
    <%--&lt;%&ndash;<link rel="stylesheet" type="text/css" href="${bootstrapCss}" />&ndash;%&gt;--%>
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"--%>
          <%--integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">--%>
    <%--<spring:url value="/css/main.css" var="springCss" />--%>
    <%--<link href="${springCss}" rel="stylesheet" />--%>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>

</head>
<body>

<div class="container">

    <div class="row" style="margin-top:20px">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form action="/registration" method="post">
                <fieldset>
                    <h1>Please Sign up ${lol}</h1>

                    <div class="form-group">
                        <input type="text" name="email" id="email" value="${user.email}" class="form-control input-lg"
                               placeholder="Email" required="true" autofocus="true"/>
                        <form:errors path="email" cssClass="error" />
                        <p>${emailError}</p>
                    </div>

                    <div class="form-group">
                        <input type="password" name="password" id="password" value="${user.password}" class="form-control input-lg"
                               placeholder="Password" required="true"/>
                        <form:errors path="password" cssClass="error" />
                        <p>${passwordError}</p>
                    </div>

                    <div class="form-group">
                        <input type="text" name="name" id="name" value="${user.name}" class="form-control input-lg"
                               placeholder="Name" required="true" autofocus="true"/>
                        <form:errors path="name" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <input type="text" name="lastName" id="lastName" value="${user.lastName}" class="form-control input-lg"
                               placeholder="Last Name" required="true" autofocus="true"/>
                        <form:errors path="lastName" cssClass="error" />
                    </div>

                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign In"/>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>

</div>

<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/materialize.js"></script>
<script src="/js/init.js"></script>

</body>
</html>