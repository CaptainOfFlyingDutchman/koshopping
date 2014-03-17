<%--
  Created by IntelliJ IDEA.
  User: manvendrask
  Date: 3/16/14
  Time: 12:21 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Interactive Bindings</title>
    <meta name="layout" content="main"/>
</head>

<body>
<h1>Interactive Bindings</h1>

<form action="#" method="post">
    <p data-bind="event: {mouseover: showDetails, mouseout: hideDetails}">
        First name: <input data-bind="value: firstName"/>
        <span data-bind="visible: details">Your given name</span>
    </p>

    <p>Last name: <input data-bind="value: lastName"/></p>

    <p><button data-bind="click: saveUserData">Submit</button></p>

    <p>
        <button data-bind="click: displayName">Display Name</button>
        <button data-bind="click: setName">Set Name</button>
    </p>
</form>

<script type="text/javascript">
    function PersonViewModel() {
        var self = this;

        this.firstName = ko.observable("Manvendra");
        this.lastName = ko.observable("SK");

        this.saveUserData = function (model, event) {
            alert(model.firstName() + " is trying to checkout!");
            if (event.ctrlKey) {
                alert("He was holding down the Control key for some reason.");
            }
        };

        this.displayName = function () {
            alert(this.firstName());
        };

        this.setName = function () {
            this.firstName("Gaurav");
        };

        this.details = ko.observable(false);

        this.showDetails = function (target, event) {
            this.details(true);
        };

        this.hideDetails = function (target, event) {
            this.details(false);
        };
    }

    var personVM = new PersonViewModel();
    ko.applyBindings(personVM);
</script>
</body>
</html>