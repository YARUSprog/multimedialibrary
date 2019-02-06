<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="highlight">
    <thead>
    <tr>
        <th>Link to file</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="file" items="${files}">
        <tr>
            <form action="/file/${file.pathToFile}" method="DELETE" id="delete_file_form">
                <td>${file.pathToFile}</td>
                <td>
                    <input type="submit" value="Видалити" class='btn waves-effect'/>
                </td>
            </form>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class"row">
    <form method="POST" enctype="multipart/form-data" action="/file/upload" id="add_file_form">
        <div class="file-field input-field col s4">
            <div class="btn">
                <span>File</span>
                <input type="file" name="file" id="file">
            </div>
            <div class="file-path-wrapper  col s4">
                <input class="file-path validate" type="text">
            </div>
        </div>
        <input type='submit' name='btn_add_file' class='btn waves-effect col s4' id="add_file_btn" value="Завантажити"/>
    </form>
</div>