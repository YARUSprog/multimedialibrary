<!DOCTYPE HTML>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
    <%--<spring:url value="/webjars/bootstrap/3.3.7/css/bootstrap.min.css" var="bootstrapCss" />--%>
    <%--<link rel="stylesheet" type="text/css" href="${bootstrapCss}" />--%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <spring:url value="/css/main.css" var="springCss" />
        <link href="${springCss}" rel="stylesheet" />
</head>
<body>



<div class="container">

    <div class="starter-template">
        <h1>403 - Access is denied</h1>
        <div>Hello '${httpServletRequest.remoteUser}',
                you do not have permission to access this page.</div>
    </div>

</div>
<!-- /.container -->



</body>
</html>