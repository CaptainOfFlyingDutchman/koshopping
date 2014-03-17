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
    <p><button data-bind="click: saveUserData">Submit</button></p>
</form>

<script type="text/javascript">
    function PersonViewModel() {
        var self = this;

        this.firstName = ko.observable("Manvendra");
        this.lastName = ko.observable("SK");

        this.saveUserData =  function(model, event) {
            alert(model.firstName() + " is trying to checkout!");
            if (event.ctrlKey) {
                alert("He was holding down the Control key for some reason.");
            }
        };
    }

    var personVM = new PersonViewModel();
    ko.applyBindings(personVM);
</script>
</body>
</html>