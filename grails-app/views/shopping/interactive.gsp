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
    <p data-bind="event: {mouseover: function(data, event) {
            showDetails(data, event, 'firstName');
        }, mouseout: hideDetails}">
        First name: <input data-bind="value: firstName"/>
        <span data-bind="visible: details() == 'firstName'">Your given name</span>
    </p>

    <p data-bind="event: {mouseover: function(data, event) {
            showDetails(data, event, 'lastName');
        }, mouseout: hideDetails}">
        Last name: <input data-bind="value: lastName"/>
        <span data-bind="visible: details() == 'lastName'">Your surname</span>
    </p>

    <p>
        Primary phone: <input data-bind="value: primaryPhone" />
    </p>

    <p>
        Secondary phone: <input data-bind="value: secondaryPhone, enable: primaryPhone" />
    </p>

    <p>Annoy me with special offers: <input type="checkbox" data-bind="checked: annoyMe" /> </p>
    <div data-bind="visible: annoyMe">
        <div>
            <input type="checkbox" value="morning" data-bind="checked: annoyTimes" /> In the morning
        </div>
        <div>
            <input type="checkbox" value="afternoon" data-bind="checked: annoyTimes" /> In the afternoon
        </div>
        <div>
            <input type="checkbox" value="evening" data-bind="checked: annoyTimes" /> In the evening
        </div>
    </div>

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

        this.details = ko.observable("");

        this.showDetails = function (target, event, details) {
            this.details(details);
        };

        this.hideDetails = function (target, event) {
            this.details("");
        };

        this.primaryPhone = ko.observable("");
        this.secondaryPhone = ko.observable("");

        this.annoyMe = ko.observable(true);
        this.annoyTimes = ko.observableArray(["morning", "evening"]);
    }

    var personVM = new PersonViewModel();
    ko.applyBindings(personVM);
</script>
</body>
</html>