<%--
  Created by IntelliJ IDEA.
  User: manvendrask
  Date: 3/16/14
  Time: 12:21 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Appearance Bindings</title>
    <meta name="layout" content="main"/>
</head>

<body>
<h1>Hello, Knockout.js</h1>

<fieldset title="text">
    <legend>text binding</legend>

    My name is <span data-bind="text: name"></span>
</fieldset>

<br/><br/>

<fieldset title="text">
    <legend>html binding</legend>

    My name is <span data-bind="html: formattedName"></span>
</fieldset>

<br/><br/>

<fieldset title="text">
    <legend>visible binding</legend>

    My name is <span data-bind="visible: shouldVisible">Manvendra</span>
</fieldset>

<br/><br/>

<fieldset title="text">
    <legend>attr binding</legend>

    My name is <a data-bind="attr: {href: link}">My blog...</a>
</fieldset>


<script type="text/javascript">
    function PersonViewModel() {
        var self = this;

        this.name = ko.observable("Manvendra");

        this.formattedName = ko.computed(function () {
            return "<strong>" + this.name() + "<strong>";
        }, this);

        this.shouldVisible = ko.observable(true);

        this.link = ko.observable("http://manvendrask.blogspot.com");
    }
    var personVM = new PersonViewModel();
    ko.applyBindings(personVM);
</script>
</body>
</html>