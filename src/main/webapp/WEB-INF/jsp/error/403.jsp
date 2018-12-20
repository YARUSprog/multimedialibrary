<!DOCTYPE HTML>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />
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