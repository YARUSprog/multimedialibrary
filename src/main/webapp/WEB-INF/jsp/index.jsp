<%--
  Created by IntelliJ IDEA.
  User: Yarus
  Date: 28.12.2018
  Time: 01:04
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

<div class="section no-pad-bot" id="index-banner">
    <div class="container">
        <%--<br><br>--%>
        <%--<h1 class="header center orange-text">--%>
        <%--Starter Template--%>
        <%--</h1>--%>

        <%--<div class="row center">--%>
        <%--<h5 class="header col s12 light">A modern responsive front-end framework based on Material Design</h5>--%>
        <%--</div>--%>
        <%--<div class="row center">--%>
        <%--<a href="http://materializecss.com/getting-started.html" id="download-button"--%>
        <%--class="btn-large waves-effect waves-light orange">Get Started</a>--%>
        <%--</div>--%>
        <%--<br><br>--%>

        <div class="section">
            <div class="row">
                <div class="group-search">
                    <form action="/index" method="GET" id="searchForm">
                        <div class="input-field col s4">
                            <input id="searchText" type="text" name="searchText" value="${searchText}"/>
                            <label>Назва статті</label>
                        </div>
                        <div class="input-field col s4">
                            <select name="searchAuthor" id="searchAuthor">
                                <option value="">Оберіть автора</option>
                                <c:forEach var="author" items="${allAuthors}">
                                    <c:if test="${searchAuthor eq author.id}">
                                        <option value="${author.id}" selected>${author.nameWithInitials}</option>
                                    </c:if>
                                    <c:if test="${searchAuthor ne author.id}">
                                        <option name="selectType" value="${author.id}">${author.nameWithInitials}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <label>Author Select</label>
                        </div>
                        <div class="input-field col s4">
                            <select class="input-field" name="searchConf" id="searchConf">
                                <option value="">Оберіть конференцію</option>
                                <c:forEach var="conference" items="${allConferences}">
                                    <c:if test="${searchConf eq conference.id}">
                                        <option value="${conference.id}" selected>${conference.name}</option>
                                    </c:if>
                                    <c:if test="${searchConf ne conference.id}">
                                        <option value="${conference.id}">${conference.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <label>Конференція</label>
                        </div>
                        <div class="input-field col s4">
                            <select id="searchSubject" name="searchSubject">
                                <option value="">Оберіть тему</option>
                                <c:forEach var="subject" items="${allSubjects}">
                                    <c:if test="${searchSubject eq subject.id}">
                                        <option value="${subject.id}" selected>${subject.name}</option>
                                    </c:if>
                                    <c:if test="${searchSubject ne subject.id}">
                                        <option value="${subject.id}">${subject.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <label>Тематика</label>
                        </div>
                        <div class="input-field col s4">
                            <select name="searchYear" id="searchYear">
                                <option name="selectYear" value="">Оберіть рік</option>
                                <%--<c:forEach begin="1980" end="2050" varStatus="i">--%>
                                <c:forEach var="date" items="${allDates}">
                                    <fmt:formatDate value="${date}" pattern="yyyy" var="formattedDate"/>
                                    <c:if test="${searchYear == formattedDate}">
                                        <option value="${formattedDate}" selected>${formattedDate}</option>
                                    </c:if>
                                    <c:if test="${searchYear != formattedDate}">
                                        <option value="${formattedDate}">${formattedDate}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <label>Рік</label>
                        </div>
                        <div class="input-field col s4">
                            <input class="col s12 btn waves-effect waves-light orange" type="submit" value="Пошук" id="searchButton"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>


<div class="container">
    <div class="section">

        <div class="row">
            <c:forEach var="article" items="${articles}">
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
                            ${fn:substring(article.text,0,500)} ...
                    </p>
                </div>
            </c:forEach>
        </div>

        <ul class="pagination">
            <c:if test="${currentPage == startNumberOfPage}" >
                <li class="disabled"><a href="/index?searchText=${searchText}&searchAuthor=${searchAuthor}&searchConf=${searchConf}&searchSubject=${searchSubject}&searchYear=${searchYear}&pageNumber=${currentPage-1}"><i class="material-icons">chevron_left</i></a></li>
            </c:if>
            <c:if test="${currentPage != startNumberOfPage}" >
                <li class="waves-effect"><a href="/index?searchText=${searchText}&searchAuthor=${searchAuthor}&searchConf=${searchConf}&searchSubject=${searchSubject}&searchYear=${searchYear}&pageNumber=${currentPage-1}"><i class="material-icons">chevron_left</i></a></li>
            </c:if>

            <c:forEach begin="${startNumberOfPage}" end="${endNumberOfPage}" varStatus="i">
                <c:if test="${currentPage == i.index}" >
                    <li class="active"><a href="/index?searchText=${searchText}&searchAuthor=${searchAuthor}&searchConf=${searchConf}&searchSubject=${searchSubject}&searchYear=${searchYear}&pageNumber=${i.index}">${i.index + 1}</a></li>
                </c:if>
                <c:if test="${currentPage != i.index}" >
                    <li><a class="waves-effect" href="/index?searchText=${searchText}&searchAuthor=${searchAuthor}&searchConf=${searchConf}&searchSubject=${searchSubject}&searchYear=${searchYear}&pageNumber=${i.index}">${i.index + 1}</a></li>
                </c:if>
            </c:forEach>
            <%--<li class="active"><a href="#!">1</a></li>--%>
            <%--<li class="waves-effect"><a href="#!">2</a></li>--%>
            <%--<li class="waves-effect"><a href="#!">3</a></li>--%>
            <%--<li class="waves-effect"><a href="#!">4</a></li>--%>
            <%--<li class="waves-effect"><a href="#!">5</a></li>--%>

            <c:if test="${currentPage == endNumberOfPage}" >
                <li class="disabled"><a href="/index?searchText=${searchText}&searchAuthor=${searchAuthor}&searchConf=${searchConf}&searchSubject=${searchSubject}&searchYear=${searchYear}&pageNumber=${currentPage+1}"><i class="material-icons">chevron_right</i></a></li>
            </c:if>
            <c:if test="${currentPage != endNumberOfPage}" >
                <li class="waves-effect"><a href="/index?searchText=${searchText}&searchAuthor=${searchAuthor}&searchConf=${searchConf}&searchSubject=${searchSubject}&searchYear=${searchYear}&pageNumber=${currentPage+1}"><i class="material-icons">chevron_right</i></a></li>
            </c:if>

        </ul>
    </div>
    <br><br>
</div>

<%@ include file="/WEB-INF/jsp/fragments/footer.jsp" %>


<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/materialize.js"></script>
<script src="/js/init.js"></script>
<script type="text/javascript">
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