<%--
  Created by IntelliJ IDEA.
  User: Yarus
  Date: 28.12.2018
  Time: 01:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
    <title>Multimedia-library</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body class="grey lighten-4">

<%@ include file="/WEB-INF/jsp/fragments/header.jsp" %>

<div class="section no-pad-bot" id="index-banner">
    <div class="container">
        <br><br>
        <h1 class="header center orange-text">
            Starter Template
        </h1>

        <div class="row center">
            <h5 class="header col s12 light">A modern responsive front-end framework based on Material Design</h5>
        </div>
        <div class="row center">
            <a href="http://materializecss.com/getting-started.html" id="download-button" class="btn-large waves-effect waves-light orange">Get Started</a>
        </div>
        <br><br>

    </div>
</div>


<div class="container">
    <div class="section">

        <!--   Icon Section   -->
        <div class="row">
            <%--<div class="col s12 m4">--%>
                <%--<div class="icon-block">--%>
                    <%--<h2 class="center light-blue-text"><i class="material-icons">flash_on</i></h2>--%>
                    <%--<h5 class="center">Speeds up development</h5>--%>

                    <%--<p class="light">We did most of the heavy lifting for you to provide a default stylings that incorporate our custom components. Additionally, we refined animations and transitions to provide a smoother experience for developers.</p>--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<div class="col s12 m4">--%>
                <%--<div class="icon-block">--%>
                    <%--<h2 class="center light-blue-text"><i class="material-icons">group</i></h2>--%>
                    <%--<h5 class="center">User Experience Focused</h5>--%>

                    <%--<p class="light">By utilizing elements and principles of Material Design, we were able to create a framework that incorporates components and animations that provide more feedback to users. Additionally, a single underlying responsive system across all platforms allow for a more unified user experience.</p>--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<div class="col s12 m4">--%>
                <%--<div class="icon-block">--%>
                    <%--<h2 class="center light-blue-text"><i class="material-icons">settings</i></h2>--%>
                    <%--<h5 class="center">Easy to work with</h5>--%>

                    <%--<p class="light">We have provided detailed documentation as well as specific code examples to help new users get started. We are also always open to feedback and can answer any questions a user may have about Materialize.</p>--%>
                <%--</div>--%>
            <%--</div>--%>
                <c:forEach var="article" items="${articles}">
                    <%--<div class="section grey lighten-4">--%>
                    <div class="card-panel hoverable">

                        <h4><a class="black-text" href="/article/${article.id}">${article.title}</a></h4>
                        <%--<div class="divider"></div>--%>
                        <span class="date-article grey-text">
                            <fmt:formatDate value="${article.updateDate}" pattern="dd MMMM, yyyy "/> |
                        </span>

                        <span class="grey-text">
                            <c:forEach var="author" items="${article.users}">
                                <%--<span style="display: inline;">${author}, </span>--%>
                                <a href="#">${author}</a>
                                <c:if test="${users.size > (users.indexOf(author)-1)}">
                                    , &nbsp;
                                </c:if>
                            </c:forEach>
                        </span>
                        <p class="text-article grey-text">
                                ${fn:substring(article.text,0,500)} ...
                        </p>
                        <%--<p class="fotter-article">--%>
                            <%--<span class="read"><a href="article?article_id=${article.id}">--%>
                                    <%--Читать...</a></span>--%>
                        <%--</p>--%>
                    </div>
                </c:forEach>
        </div>

    </div>
    <br><br>
</div>

<%@ include file="/WEB-INF/jsp/fragments/footer.jsp" %>


<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/materialize.js"></script>
<script src="/js/init.js"></script>

</body>
</html>