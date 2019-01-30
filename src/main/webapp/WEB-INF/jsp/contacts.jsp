<%--
  Created by IntelliJ IDEA.
  User: Yarus
  Date: 29.01.2019
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
    <title>Multimedia-library</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="/css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body class="grey lighten-4">
<%@ include file="/WEB-INF/jsp/fragments/header.jsp" %>
<div class="container">
    <div class="section">
        <div class="row">
            <div class="card-panel hoverable">
                <h1>Контакти</h1>
                <div class="grey-text">
                    Відповідальний викладач: Радішевський <br>
                    Кафедра ІПЗ: 6.303
                </div>
                <div>
                    <div class="customer-field" id="map" style="width: auto; height: 270px;"></div>
                </div>


            </div>
        </div>
    </div>
    <br><br>
</div>

<%@ include file="/WEB-INF/jsp/fragments/footer.jsp" %>

<!--  Scripts-->
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/js/materialize.js"></script>
<script src="/js/init.js"></script>

</body>
</html>

<script>
    var lat = 50.438057;
    var lng = 30.432067;

    function initMap() {
        var map_center = new google.maps.LatLng(lat, lng);
        var mapOptions = {
            center: map_center,
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var mapCanvas = document.getElementById("map");
        var map = new google.maps.Map(mapCanvas, mapOptions);
        new google.maps.Marker({
            map: map,
            draggable: false,
            position: new google.maps.LatLng(lat, lng)
        });
        google.maps.event.addDomListener(window, 'resize', function () {
            map.setCenter(map_center);
        });
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCT7tBQN8l0fcDdcZUwuxD0XGjgM7qbTL4&callback=initMap"
        async defer></script>
<%--Google API Key: AIzaSyCT7tBQN8l0fcDdcZUwuxD0XGjgM7qbTL4 --%>
