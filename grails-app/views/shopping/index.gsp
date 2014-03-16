<%--
  Created by IntelliJ IDEA.
  User: manvendrask
  Date: 3/16/14
  Time: 12:21 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Hello, Knockout.js</title>
    <meta name="layout" content="main"/>
</head>

<body>
<h1>Hello, Knockout.js</h1>

<p><span data-bind="text: fullName"></span>'s Shopping Cart</p>

<button data-bind="click: checkout">Checkout</button>

<script type="text/javascript">
    function PersonViewModel() {
        this.firstName = ko.observable("Manvendra");
        this.lastName = ko.observable("SK");

        this.fullName = ko.computed(function() {
            return this.firstName() + " " + this.lastName();
        }, this);

        this.checkout = function() {
            alert("Trying to check out!");
        }
    }
    ko.applyBindings(new PersonViewModel());
</script>
</body>
</html>