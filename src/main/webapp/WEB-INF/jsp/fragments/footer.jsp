<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<div th:fragment="footer">

    <div class="container">

        <footer>
        <!-- this is footer -->
        © 2017 mkyong.com
            <span sec:authorize="isAuthenticated()">
                | Logged user: <span sec:authentication="name"></span> |
                Roles: <span sec:authentication="principal.authorities"></span> |
                <a href="/logout">Sign Out</a>
            </span>

        <script type="text/javascript"
                src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        </footer>
    </div>

</div>
</body>
</html>