<%--
  Created by IntelliJ IDEA.
  User: manvendrask
  Date: 3/16/14
  Time: 12:21 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>External Data</title>
    <meta name="layout" content="main"/>
</head>

<body>
<h1>External Data</h1>

<form action="#" method="post">
    <p>First name: <input data-bind="value: firstName"/></p>

    <p>Last name: <input data-bind="value: lastName"/></p>

    <div>
        Your favorite food::
        <select data-bind="options: activities, value: favoriteHobby"></select>
    </div>

    <p><button data-bind="click: loadUserData">Load Data</button>

        <button data-bind="click: saveUserData">Save Data</button></p>
</form>

<script type="text/javascript">
    var viewModel;
    $.getJSON("${createLink(action: "loadData", absolute: true)}", function (data) {
        viewModel = ko.mapping.fromJS(data);

        viewModel.loadUserData = function () {
            $.getJSON("${createLink(action: "loadNewData", absolute: true)}", function (data) {
                ko.mapping.fromJS(data, viewModel);
            });
        };

        viewModel.saveUserData = function () {
            var dataToSend = ko.toJSON(viewModel);
            console.info(dataToSend);
            $.post("${g.createLink(action: "saveData", absolute: true)}", {dts: dataToSend}, function (data) {
                data == "SAVED" ?
                        alert("Your data has been posted to the server!") :
                        alert("Error occurred during save.");
            });
        };

        ko.applyBindings(viewModel);
    });
</script>
</body>
</html>