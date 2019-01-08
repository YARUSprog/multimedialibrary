<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>

	<!-- Access the bootstrap Css like this,
		Spring boot will handle the resource mapping automcatically -->
	<%--<spring:url value="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" var="bootstrapCss" />--%>
	<%--<link rel="stylesheet" type="text/css" href="${bootstrapCss}" />--%>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
		  integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


	<!--
	<spring:url value="/css/main.css" var="springCss" />
	<link href="${springCss}" rel="stylesheet" />
	 -->
	<c:url value="/css/main.css" var="jstlCss" />
	<link href="${jstlCss}" rel="stylesheet" />

</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Spring Boot</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#about">About</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">

		<div class="starter-template">
			<h1>Spring Boot Web JSP Example</h1>
			<h2>Message: ${message}</h2>
		</div>

	</div>

	<c:forEach var="article" items="${articles}">
		<article>
			<h1>${article.title}</h1>
			<div class="text-article">
					${fn:substring(article.text,0,300)} ...
			</div>
			<div class="fotter-article">
                            <span class="read"><a href="article?article_id=${article.id}">
                                    Читать...</a></span>
				<span >Автори:
                                <c:forEach var="author" items="${article.users}">
									<p style="display: inline;">${author}.</p>
								</c:forEach>
                            </span>
				<span class="date-article">Дата статті:
                                <fmt:formatDate value="${article.updateDate}" pattern="MM-dd-yyyy"/>
                            </span>
			</div>
		</article>
	</c:forEach>

	<script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>

</html>