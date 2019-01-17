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

<div class="container">

    <c:forEach var="newUser" items="${newUsers}">
        <div class="row">
            <%--<form action="/activateUser/${newUser.email}" method="PUT">--%>
                <div class='input-field col s12'>
                    <%--<input type="hidden" value="${newUser.email}" name="email"/>--%>
                    <p class="col s3">
                            ${newUser.email}
                    </p>
                    <p class="col s3">
                            ${newUser.firstName}
                    </p>
                    <p class="col s3">
                            ${newUser.middleName}
                    </p>
                    <button type='button' name='btn_login' class='col s3 btn waves-effect'
                            onclick="activateUser('/activateUser/${newUser.id}')">
                        Активувати
                    </button>

                </div>
            <%--</form>--%>
        </div>
    </c:forEach>


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
            success: function() {
                window.location.reload();
            }
        });
    }
</script>
</body>
</html>