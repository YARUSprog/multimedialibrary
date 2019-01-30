<%--
  Created by IntelliJ IDEA.
  User: Yarus
  Date: 29.01.2019
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div class="container">
    <div class="section">
        <div class="row">
            <div class="card-panel hoverable">

                <h4><a class="black-text" href="/article/${article.id}">${article.title}</a></h4>
                <span class="date-article grey-text">
                            <fmt:formatDate value="${article.updateDate}" pattern="dd MMMM, yyyy "/> |
                        </span>

                <span class="grey-text">
                            <c:forEach var="author" items="${article.users}">
                                <a href="#">${author}</a>
                                <c:if test="${users.size > (users.indexOf(author)-1)}">
                                    , &nbsp;
                                </c:if>
                            </c:forEach>
                        </span>
                <p class="text-article grey-text">
                    ${article.text}
                </p>
            </div>
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
