<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Сторінка авторизації</title>
    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body>
<div class="row">
    <div class="col s12 m4 offset-m4">
        <div class="card">
            <div class="card-action center-align">
                <h2 class="orange-text darken-3-text">Наукова бібліотека</h2>
                <h5 class="orange-text lighten-5">Будь-ласка, увійдіть в свій акаунт</h5>
            </div>
            <div class="card-content">
                <form action="/login" class="row" method="post" id="auth-form">
                    <div class='input-field col s12'>
                        <input class='validate' type='email' name="username" id="username" required="true"/>
                        <label for='username'>Введіть ваш імейл</label>
                    </div>
                    <div class='input-field col s12'>
                        <input class='validate' type='password' name='password' id='password' required="true"/>
                        <label for='password'>Введіть ваш пароль</label>
                    </div>
                    <%--<div class='col s12'>--%>
                        <%--<label>--%>
                            <%--<input type='checkbox' name='remember-me' id='remember'/>--%>
                            <%--<span>Запам'ятати мене</span>--%>
                        <%--</label>--%>
                    <%--</div>--%>
                    <div class='col s12'>
                        <br/>
                        <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect orange darken-3'>
                            Увійти
                        </button>
                    </div>
                    <%--<div class="col s12">--%>
                        <%--<label class="label-forgot center-align">--%>
                            <%--<a class='modal-trigger waves-effect waves-light blue-grey-text lighten-2'--%>
                               <%--href='#modal1'><b>Забули пароль?</b></a>--%>
                        <%--</label>--%>
                    <%--</div>--%>

                    <div class="col s12">
                        <label class="label-forgot center-align">
                            <a class='modal-trigger waves-effect waves-light blue-grey-text lighten-2'
                               href='/registration'><b>Реєстрація</b></a>
                        </label>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="modal1" class="modal">
    <form action="/forgot" method="post">
        <div class="modal-content">
            <h4>Recovery password</h4>

            <div class='input-field'>
                <input class='validate' type='email' name='email' id="email1"/>
                <label for='email1'>Enter your email</label>
            </div>
            <div class='input-field'>
                <input class='validate' type='tel' name='phone' id="phone"/>
                <label for='phone'>Enter your phone</label>
            </div>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        </div>
        <div class="modal-footer">
            <div class='col s12'>
                <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect teal'>Recovery</button>
            </div>
        </div>
    </form>
</div>


<%--<div class="container">--%>

<%--<div class="row" style="margin-top:20px">--%>
<%--<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">--%>
<%--<form action="/login" method="post">--%>
<%--<fieldset>--%>
<%--<h1>Please Sign In</h1>--%>


<%--<c:if test="${error eq true}">--%>
<%--<div class="alert alert-danger">--%>
<%--Invalid username and password.--%>
<%--</div>--%>
<%--</c:if>--%>

<%--<c:if test="${logout eq true}">--%>
<%--<div class="alert alert-info">--%>
<%--You have been logged out.--%>
<%--</div>--%>
<%--</c:if>--%>

<%--<div class="form-group">--%>
<%--<input type="text" name="username" id="username" class="form-control input-lg"--%>
<%--placeholder="UserName" required="true" autofocus="true"/>--%>
<%--</div>--%>
<%--<div class="form-group">--%>
<%--<input type="password" name="password" id="password" class="form-control input-lg"--%>
<%--placeholder="Password" required="true"/>--%>
<%--</div>--%>

<%--<div class="row">--%>
<%--<div class="col-xs-6 col-sm-6 col-md-6">--%>
<%--<input type="submit" class="btn btn-lg btn-primary btn-block" value="Sign In"/>--%>
<%--</div>--%>
<%--<div class="col-xs-6 col-sm-6 col-md-6">--%>
<%--</div>--%>
<%--</div>--%>
<%--</fieldset>--%>
<%--</form>--%>
<%--</div>--%>
<%--</div>--%>

<%--</div>--%>

<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/materialize.js"></script>
<script src="/js/init.js"></script>
<script>
    $(document).ready(function(){
        <c:if test="${error eq true}">
            //Invalid username or password.
            M.toast({html: "Не вірний логін чи пароль.", timeRemaining: 10000});
        </c:if>
        <c:if test="${logout eq true}">
            //You've been logged out successfully.
            M.toast({html: "Ви успішно вийшли.", timeRemaining: 10000});
        </c:if>

        // $('#auth-form').submit(function() {
        //     var el = $(this);
        //     var hash = window.location.hash;
        //     if (hash) el.prop('action', el.prop('action') + '#' + unescape(hash.substring(1)));
        //     return true;
        // });
        //
        // $('.modal-trigger').leanModal();
        M.updateTextFields();
    });
</script>
</body>
</html>