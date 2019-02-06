<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="card-content">
    <form id="create-article-form" action="/article" method="post">
        <div class="row">
            <div class='input-field col s12'>
                <i class="material-icons prefix Small">title</i>
                <input class='validate' type='text' name='title' id='title'/>
                <label for='title'>Заголовок*</label>
            </div>

        </div>
        <div class="row">
            <div class='input-field col s12' id="text-wrapper">
                <i class="material-icons prefix Small">title</i>
                <%--<input class='validate' type='text' name='text' id='text'/>--%>
                <textarea id="text" class="full-text" name="text"></textarea>
                <script type="text/javascript">
                    var editor = CKEDITOR.replace('text');
                </script>
            </div>
            <%--<label for='text-wrapper'>Текст*</label>--%>
        </div>
        <div class="row">
            <div class='input-field col s6'>
                <i class="material-icons prefix Small">title</i>
                <input class='validate' type='date' name='updateDate' id='updateDate'/>
                <label for='updateDate'>Дата*</label>
            </div>

            <div class="input-field col s6">
                <select name="conference" id="conference">
                    <option value="">Оберіть конференцію</option>
                    <c:forEach var="conference" items="${allConferences}">
                        <option value="${conference.id}">${conference.name}</option>
                    </c:forEach>
                </select>
                <label>Конференція*</label>
            </div>

        </div>
        <div class="row">
            <div class="input-field col s6">
                <select multiple name="subjects" id="subjects">
                    <option value="" disabled selected>Choose your option</option>
                    <c:forEach var="subject" items="${allSubjects}">
                        <option value="${subject.id}">${subject.name}</option>
                    </c:forEach>
                </select>
                <label>Теми*</label>
            </div>

            <div class="input-field col s6">
                <select multiple name="users" id="users">
                    <option value="" disabled selected>Choose your option</option>
                    <c:forEach var="user" items="${allUsers}">
                        <option value="${user.id}">${user.nameWithInitials}</option>
                    </c:forEach>
                </select>
                <label>Співавтори</label>
            </div>
        </div>
        <div class="row">
            <div class='col s12'>
                <br/>
                <button type='submit' name='btn_login'
                        class='col s12 btn btn-large waves-effect orange darken-3'>
                    Створити
                </button>
            </div>
        </div>
    </form>
</div>
<script src="/js/select-init.js"></script>