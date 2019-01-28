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

<%--<div class="row">--%>
    <%--<%@ include file="/WEB-INF/jsp/fragments/header.jsp" %>--%>
<%--</div>--%>
<%--<div class="row">--%>
<%--<header class="col s3">--%>
    <%--&lt;%&ndash;<nav>&ndash;%&gt;--%>


    <%--&lt;%&ndash;</nav>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<ul id="slide-out" class="sidenav sidenav-fixed">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="user-view">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<div class="background">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<img src="images/office.jpg">&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<a href="#user"><img class="circle" src="images/yuna.jpg"></a>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<a href="#name"><span class="white-text name">John Doe</span></a>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<a href="#email"><span class="white-text email">jdandturk@gmail.com</span></a>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<li><a href="#!">Second Link</a></li>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="divider"></div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<li><a class="subheader">Subheader</a></li>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<li><a class="waves-effect" href="#!">Third Link With Waves</a></li>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>&ndash;%&gt;--%>

        <%--<div class="collection">--%>
            <%--<a href="#!" class="collection-item">Нові користувачі</a>--%>
            <%--<a href="#!" class="collection-item"><span class="badge">1</span>Alan</a>--%>
            <%--<a href="#!" class="collection-item"><span class="new badge">4</span>Alan</a>--%>
            <%--<a href="#!" class="collection-item">Alan</a>--%>
            <%--<a href="#!" class="collection-item"><span class="badge">14</span>Alan</a>--%>
        <%--</div>--%>
<%--</header>--%>
<%--<main class="col s9">--%>
    <%--<div >--%>
        <%--<div class="container">--%>
            <%--<table class="highlight">--%>
                <%--<thead>--%>
                <%--<tr>--%>
                    <%--<th>Email</th>--%>
                    <%--<th>First name</th>--%>
                    <%--<th>Middle name</th>--%>
                    <%--<th>Action</th>--%>
                <%--</tr>--%>
                <%--</thead>--%>
                <%--<tbody>--%>
                <%--<c:forEach var="newUser" items="${newUsers}">--%>
                    <%--<tr>--%>
                        <%--<td>${newUser.email}</td>--%>
                        <%--<td>${newUser.firstName}</td>--%>
                        <%--<td>${newUser.middleName}</td>--%>
                        <%--<td>--%>
                            <%--<button type='button' name='btn_activate' class='btn waves-effect'--%>
                                    <%--onclick="activateUser('/activateUser/${newUser.id}')">--%>
                                <%--Активувати--%>
                            <%--</button>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                <%--</c:forEach>--%>
                <%--</tbody>--%>
            <%--</table>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</main>--%>

<%--</div>--%>



<!-- Navbar goes here -->
<%@ include file="/WEB-INF/jsp/fragments/header.jsp" %>
<!-- Page Layout here -->
<div class="row">

    <div class="col s12 m4 l3"> <!-- Note that "m4 l3" was added -->
        <div class="collection">

        <a href="#!" class="collection-item">Нові користувачі</a>
        <a href="#!" class="collection-item"><span class="badge">1</span>Alan</a>
        <a href="#!" class="collection-item"><span class="new badge">4</span>Alan</a>
        <a href="#!" class="collection-item">Alan</a>
        <a href="#!" class="collection-item"><span class="badge">14</span>Alan</a>

        <%--<ul>--%>
            <%--<li><a href="#!" class="btn">Нові користувачі</a></li>--%>
            <%--<li><a href="#!" class="btn-flat"><span class="badge">1</span>Alan</a></li>--%>
            <%--<li><a href="#!" class="btn-flat"><span class="new badge">4</span>Alan</a></li>--%>
            <%--<li><a href="#!" class="btn-flat">Alan</a></li>--%>
            <%--<li><a href="#!" class="btn-flat"><span class="badge">14</span>Alan</a></li>--%>
        <%--</ul>--%>

        <%--<div class="row">--%>
            <%--<a href="#!" class="collection-item">Нові користувачі</a>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
            <%--<a href="#!" class="collection-item"><span class="badge">1</span>Alan</a>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
            <%--<a href="#!" class="collection-item"><span class="new badge">4</span>Alan</a>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
            <%--<a href="#!" class="collection-item">Alan</a>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
            <%--<a href="#!" class="collection-item"><span class="badge">14</span>Alan</a>--%>
        <%--</div>--%>

        </div>
        <!-- Grey navigation panel

              This content will be:
          3-columns-wide on large screens,
          4-columns-wide on medium screens,
          12-columns-wide on small screens  -->

    </div>

    <div class="col s12 m8 l9"> <!-- Note that "m8 l9" was added -->
        <div class="container">
            <table class="highlight">
                <thead>
                <tr>
                    <th>Email</th>
                    <th>First name</th>
                    <th>Middle name</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="newUser" items="${newUsers}">
                    <tr>
                        <td>${newUser.email}</td>
                        <td>${newUser.firstName}</td>
                        <td>${newUser.middleName}</td>
                        <td>
                            <button type='button' name='btn_activate' class='btn waves-effect'
                                    onclick="activateUser('/activateUser/${newUser.id}')">
                                Активувати
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Teal page content

              This content will be:
          9-columns-wide on large screens,
          8-columns-wide on medium screens,
          12-columns-wide on small screens  -->

    </div>

</div>


<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/materialize.js"></script>
<script src="/js/init.js"></script>

<script type="text/javascript">
    function activateUser(activateUrl) {
        $.ajax({
            type: 'PUT',
            url: activateUrl,
            data: null,
            success: function () {
                window.location.reload();
            }
        });
    }
</script>
</body>
</html>