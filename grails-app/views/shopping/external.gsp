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
        Your favorite hobby:
        <select data-bind="options: activities, value: favoriteHobby"></select>
    </div>

    <p><button data-bind="click: loadUserData">Load Data</button></p>
</form>

<script type="text/javascript">
    function PersonViewModel() {
        var self = this;

        self.firstName = ko.observable("");
        self.lastName = ko.observable("");
        self.activities = ko.observableArray([]);
        self.favoriteHobby = ko.observable("");

        self.loadUserData = function () {
            $.getJSON("${g.createLink(action: "loadData", absolute: true)}", function (data) {
                console.info(data);
                self.firstName(data.firstName);
                self.lastName(data.lastName);
                self.activities(data.activities);
                self.favoriteHobby(data.favoriteHobby);
            });
        };
    }

    var personVM = new PersonViewModel();
    ko.applyBindings(personVM);
</script>
</body>
</html>