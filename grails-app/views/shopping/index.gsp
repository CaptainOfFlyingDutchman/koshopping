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

<p><span data-bind="text: firstName"></span>'s Shopping Cart</p>

<script type="text/javascript">
    var personViewModel = {
        firstName: ko.observable("Manvendra"),
        lastName: ko.observable("SK")
    };
    ko.applyBindings(personViewModel);
</script>
</body>
</html>