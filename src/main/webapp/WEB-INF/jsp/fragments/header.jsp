<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="light-blue lighten-1" role="navigation">
    <div class="nav-wrapper container"><a id="logo-container" href="#" class="brand-logo">
        <%--<img alt="logo" id="top-image" src="/images/NauLogo300.png" height="46" width="56"/>--%>
        <%--height="56" width="56"--%>
        <%--Scientific library--%>
        Наукова бібліотека
    </a>
        <ul class="right hide-on-med-and-down">
            <li><a href="/index">Головна</a></li>
            <li><a href="/contacts">Контакти</a></li>
            <li><a href="/admin">Кабінет</a></li>

            <sec:authorize access="!isAuthenticated()">
                <li><a href="/login">Увійти</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li><a href="/logout">Вийти</a></li>
            </sec:authorize>
        </ul>

        <ul id="nav-mobile" class="sidenav">
            <li><a href="/index">Головна</a></li>
            <li><a href="/contacts">Контакти</a></li>
            <li><a href="/admin">Кабінет</a></li>

            <sec:authorize access="!isAuthenticated()">
                <li><a href="/login">Увійти</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <li><a href="/logout">Вийти</a></li>
            </sec:authorize>
        </ul>
        <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
    </div>
</nav>