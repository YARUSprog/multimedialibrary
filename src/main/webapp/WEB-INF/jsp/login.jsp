<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Spring Security Example </title>
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
    <spring:url value="/css/main.css" var="springCss" />
    <link href="${springCss}" rel="stylesheet" />
</head>
<body>

<div class="container">

    <div class="row" style="margin-top:20px">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
            <form action="/login" method="post">
                <fieldset>
                    <h1>Please Sign In</h1>


                    <c:if test="${error eq true}">
                        <div class="alert alert-danger">
                            Invalid username and password.
                        </div>
                    </c:if>

                    <c:if test="${logout eq true}">
                        <div class="alert alert-info">
                            You have been logged out.
                        </div>
                    </c:if>

                    <div class="form-group">
                        <input type="text" name="username" id="username" class="form-control input-lg"
                               placeholder="UserName" required="true" autofocus="true"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" id="password" class="form-control input-lg"
                               placeholder="Password" required="true"/>
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

</body>
</html>