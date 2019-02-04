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

<!-- Navbar goes here -->
<%@ include file="/WEB-INF/jsp/fragments/header.jsp" %>
<!-- Page Layout here -->
<div class="row">

    <div class="col s12 m4 l3"> <!-- Note that "m4 l3" was added -->
        <div class="collection">

            <a href="#/notActivatedUsers" class="collection-item">Нові користувачі</a>
            <a href="#/users" class="collection-item">Користувачі</a>
            <a href="#/createArticle" class="collection-item">Додати статтю</a>
            <a href="#/conferences" class="collection-item">Конференції</a>
            <a href="#/subjects" class="collection-item">Теми</a>

            <a href="#!" class="collection-item"><span class="badge">1</span>Alan</a>
            <a href="#!" class="collection-item"><span class="new badge">4</span>Alan</a>
            <a href="#!" class="collection-item">Alan</a>
            <a href="#!" class="collection-item"><span class="badge">14</span>Alan</a>

        </div>
        <!-- Grey navigation panel

              This content will be:
          3-columns-wide on large screens,
          4-columns-wide on medium screens,
          12-columns-wide on small screens  -->

    </div>

    <div class="col s12 m8 l9"> <!-- Note that "m8 l9" was added -->
        <div class="container" id="content">
            <h1>Вітаємо в особистому кабінеті !</h1>
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

    $(document).ready(function () {

        // Bind a callback that executes when document.location.hash changes.
        $(window).bind("hashchange", function (e) {


            var url = window.location.hash.replace("#", "");

            if (url == "/notActivatedUsers" || url == "/users" || url == "/createArticle" ||
                url == "/conferences" || url == "/subjects") {
                loadSubPage(url);
            }
        });
    });

    function activateUser(activateUrl) {
        $.ajax({
            type: 'PUT',
            url: activateUrl,
            data: null,
            success: function () {
                loadSubPage("/notActivatedUsers")
                //window.location.reload();
            }
        });
    }



    function loadSubPage(url) {
        $.ajax({
            type: 'GET',
            url: url,
            data: null,
            success: function (receivedView) {
                $("#content").html(receivedView);
            }
        });
        console.log("url: " + url);
    }

    document.addEventListener('DOMContentLoaded', function () {
        var elems = document.querySelectorAll('select');
        var instances = M.FormSelect.init(elems, options);
    });

    // Or with jQuery

    $(document).ready(function () {
        $('select').formSelect();
    });
</script>
</body>
</html>