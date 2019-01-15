<!DOCTYPE HTML>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Кабінет</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body>

<div class="container">

    <div class="row">
        <form action="/activateUser" method="post" id="auth-form">
            <div class='input-field col s12'>
                <input type="hidden" value="${user.email}"/>
                <p class="col s4">
                    ${user.email}
                </p>
                <p class="col s4">
                    ${user.firstName}
                </p>
                <p class="col s4">
                    ${user.middleName}
                </p>
                <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect orange darken-3'>
                    Активувати
                </button>
            </div>
        </form>
    </div>
</div>

<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/materialize.js"></script>
<script src="/js/init.js"></script>

</body>
</html>