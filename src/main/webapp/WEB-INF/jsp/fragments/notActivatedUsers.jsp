<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="highlight">
    <thead>
    <tr>
        <th>Email</th>
        <th>First name</th>
        <th>Middle name</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="newUser" items="${newUsers}">
        <tr>
            <td>${newUser.email}</td>
            <td>${newUser.firstName}</td>
            <td>${newUser.middleName}</td>
            <td>
                <button type='button' name='btn_activate' class='btn waves-effect'
                        onclick="activateUser('/activateUser/${newUser.id}')">
                    Активувати
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>