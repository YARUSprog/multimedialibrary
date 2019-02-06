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

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        var elems = document.querySelectorAll('select');
        var instances = M.FormSelect.init(elems, options);
    });

    // Or with jQuery

    $(document).ready(function () {
        $('select').formSelect();
    });

    $("#create-article-form").submit(function (event) {
        event.preventDefault();

        updateAllMessageForms();

        var $form = $(this);
        var formUrl = $form.attr('action');
        var method = $form.attr('method');

        var formData = getFormData($form);

        console.log("formUrl: " + formUrl);
        console.log("method: " + method);
        console.log("formData: " + formData);

        var xhr = $.ajax({
            headers: {
                'Accept': 'application/json;charset=UTF-8',
                'Content-Type': 'application/json;charset=UTF-8'
            },
            type: method,
            url: formUrl,
            data: formData,
            // statusCode: {
            //     200: function (data) {
            //         M.toast({
            //             html: xhr.getResponseHeader("message"), timeRemaining: 10000
            //         });
            //     },
            //     201: function (data) {
            //         M.toast({
            //             html: xhr.getResponseHeader("message"), timeRemaining: 10000
            //         });
            //         // M.toast(data.getResponseHeader("successMessage"), 10000);
            //     },
            //     417: function (data) {
            //         M.toast({
            //             html: xhr.getResponseHeader("message"), timeRemaining: 10000
            //         });
            //         // M.toast(data.getResponseHeader("validationMessage"), 10000);
            //     },
            //     500: function (data) {
            //         M.toast({
            //             html: xhr.getResponseHeader("message"), timeRemaining: 10000
            //         });
            //         // M.toast(data.getResponseHeader("errorMessage"), 10000, 'red');
            //     }
            // }
            // ,

            success: function (data) {
                loadSubPage("/createArticle");
                M.toast({
                    html: xhr.getResponseHeader("message"), timeRemaining: 10000
                });
            },
            error: function (data) {
                // loadSubPage("/createArticle");
                M.toast({
                    html: xhr.getResponseHeader("message"), timeRemaining: 10000
                });
            }
        });
    });

    function getFormData($form) {
        var subjectsData = M.FormSelect.getInstance($("#subjects")).getSelectedValues();
        var usersData = M.FormSelect.getInstance($("#users")).getSelectedValues();

        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.each(unindexed_array, function (i, v) {
            if (v.name == "subjects") {
                indexed_array[v.name] = subjectsData;
            } else if (v.name == "users") {
                indexed_array[v.name] = usersData;
            } else if (v.name == "conference") {
                indexed_array[v.name] = parseInt(v.value);
            } else {
                indexed_array[v.name] = v.value;
            }
        });

        return JSON.stringify(indexed_array);
    }

    function updateAllMessageForms()
    {
        for (instance in CKEDITOR.instances) {
            CKEDITOR.instances[instance].updateElement();
        }
    }

</script>