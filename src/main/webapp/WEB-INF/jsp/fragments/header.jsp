<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <div th:fragment="header-css">
        <!-- this is header-css -->
        <link rel="stylesheet" type="text/css"
              href="webjars/bootstrap/3.3.7/css/bootstrap.min.css" />

        <link rel="stylesheet" href="../../css/main.css" />
    </div>
</head>
<body>
<div>
    <!-- this is header -->
    <nav class="navbar navbar-inverse">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" th:href="/">Spring Boot</a>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/">Home</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>

</body>
</html>