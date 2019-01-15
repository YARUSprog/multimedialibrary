<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Cторінка реєстрації</title>
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
<div class="row">
    <div class="col s12 m5 offset-m4">
        <div class="card">
            <div class="card-action center-align">
                <h2 class="orange-text darken-3-text">Наукова бібліотека</h2>
                <h5 class="orange-text lighten-5">Будь-ласка, зареєструйтесь</h5>
            </div>
            <div class="card-content">
                <form action="/registration" method="post" id="auth-form">
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix tiny">account_circle</i>
                            <input class="validate" type="email" name="email" id="email" value="${user.email}"
                                   required="true"/>
                            <label for="email">Імейл*</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class='input-field col s6'>
                            <i class="material-icons prefix small">account_circle</i>
                            <input class='validate' type='password' name='password' id='password'
                                   value="${user.password}"/>
                            <label for='password'>Пароль*</label>
                        </div>
                        <div class='input-field col s6'>
                            <i class="material-icons prefix Small">account_circle</i>
                            <input class='validate' type='password' name='confirmPassword' id='confirmPassword'
                                   value="${user.confirmPassword}"/>
                            <label for='confirmPassword'>Підтвердження*</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class='input-field col s6'>
                            <i class="material-icons prefix Small">title</i>
                            <input class='validate' type='text' name='firstName' id='firstName'
                                   value="${user.firstName}"/>
                            <label for='confirmPassword'>Ім'я*</label>
                        </div>
                        <div class='input-field col s6'>
                            <i class="material-icons prefix Small">title</i>
                            <input class='validate' type='text' name='middleName' id='middleName'
                                   value="${user.middleName}"/>
                            <label for='confirmPassword'>Прізвище*</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class='input-field col s12'>
                            <i class="material-icons prefix Small">title</i>
                            <input type='text' name='lastName' id='lastName'
                                   value="${user.lastName}"/>
                            <label for='confirmPassword'>По батькові</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class='input-field col s12'>
                            <i class="material-icons prefix Small">mode_edit</i>
                            <textarea name='details' id='details' class="materialize-textarea"
                                      data-length="500">${user.details}</textarea>
                            <label for='details'>Деталі</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="switch col s12">
                            <label>
                                <input type='checkbox' name='teacher' id='teacher'
                                       <c:if test="${user.teacher}">checked="checked"</c:if>
                                />
                                <span>Викладач</span>
                            </label>
                        </div>
                    </div>
                    <div class="row">
                        <div class='col s12'>
                            <br/>
                            <button type='submit' name='btn_login'
                                    class='col s12 btn btn-large waves-effect orange darken-3'>
                                Увійти
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<%--<div class="row" style="margin-top:20px">--%>
<%--<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">--%>
<%--<form action="/registration" method="post">--%>
<%--<fieldset>--%>
<%--<h1>Please Sign up ${lol}</h1>--%>

<%--<div class="form-group">--%>
<%--<input type="text" name="email" id="email" value="${user.email}" class="form-control input-lg"--%>
<%--placeholder="Email" required="true" autofocus="true"/>--%>
<%--<form:errors path="email" cssClass="error" />--%>
<%--<p>${emailError}</p>--%>
<%--</div>--%>

<%--<div class="form-group">--%>
<%--<input type="password" name="password" id="password" value="${user.password}" class="form-control input-lg"--%>
<%--placeholder="Password" required="true"/>--%>
<%--<form:errors path="password" cssClass="error" />--%>
<%--<p>${passwordError}</p>--%>
<%--</div>--%>

<%--<div class="form-group">--%>
<%--<input type="password" name="confirmPassword" id="confirmPassword" value="${user.confirmPassword}" class="form-control input-lg"--%>
<%--placeholder="Confirm password" required="true"/>--%>
<%--<form:errors path="confirmPassword" cssClass="error" />--%>
<%--<p>${passwordError}</p>--%>
<%--</div>--%>

<%--<div class="form-group">--%>
<%--<input type="text" name="firstName" id="firstName" value="${user.firstName}" class="form-control input-lg"--%>
<%--placeholder="First name" required="true" autofocus="true"/>--%>
<%--<form:errors path="firstName" cssClass="error" />--%>
<%--</div>--%>

<%--<div class="form-group">--%>
<%--<input type="text" name="middleName" id="middleName" value="${user.middleName}" class="form-control input-lg"--%>
<%--placeholder="Middle name" required="true" autofocus="true"/>--%>
<%--<form:errors path="middleName" cssClass="error" />--%>
<%--</div>--%>

<%--<div class="form-group">--%>
<%--<input type="text" name="lastName" id="lastName" value="${user.lastName}" class="form-control input-lg"--%>
<%--placeholder="Last Name" required="false" autofocus="true"/>--%>
<%--<form:errors path="lastName" cssClass="error" />--%>
<%--</div>--%>

<%--<div class="form-group">--%>
<%--<input type="text" name="details" id="details" value="${user.details}" class="form-control input-lg"--%>
<%--placeholder="Details" required="false" autofocus="true"/>--%>
<%--<form:errors path="details" cssClass="error" />--%>
<%--</div>--%>

<%--<label>--%>
<%--<input type='checkbox' name='teacher' id='teacher'/>--%>
<%--<span>Викладач</span>--%>
<%--</label>--%>

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


<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/materialize.js"></script>
<script src="/js/init.js"></script>

<script>
    $(document).ready(function () {
        <c:if test="${validationError != null}">
        M.toast({html: "${validationError}", timeRemaining: 10000});
        </c:if>
        $('input#input_text, textarea#details').characterCounter();
        M.updateTextFields();
    });
</script>

</body>
</html>