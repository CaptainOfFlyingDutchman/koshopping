<%--
  Created by IntelliJ IDEA.
  User: manvendrask
  Date: 3/16/14
  Time: 12:21 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Animating Knockout.js</title>
    <meta name="layout" content="main"/>
</head>

<body>
<h1>Animating Knockout.js</h1>

<form action="#" method="post">

    <table>
        <thead>
        <tr>
            <th>Product</th>
            <th>Price</th>
            <th></th>
        </tr>
        </thead>
        <tbody data-bind="foreach: {data: items, beforeRemove: hideProduct, afterAdd: showProduct}">
        <tr>
            <td data-bind="text: name"></td>
            <td data-bind="text: price"></td>
            <td><button data-bind="click: $root.removeProduct">Remove</button></td>
        </tr>
        </tbody>
    </table>

    <button data-bind="click: addProduct">Add Beer</button>
</form>

<script type="text/javascript">
    function Product(name, price) {
        this.name = ko.observable(name);
        this.price = ko.observable(price);
    }

    function ShoppingCart() {
        var self = this;

        self.instructions = ko.observable("");
        self.hasInstructions = ko.observable(false);

        self.items = ko.observableArray([
            new Product("Beer", 10.99),
            new Product("Brats", 7.99),
            new Product("Buns", 1.49)
        ]);

        self.addProduct = function () {
            self.items.push(new Product("More Beer", 10.99));
        };

        self.removeProduct = function (product) {
            self.items.destroy(product);
        };

        self.showProduct = function (element) {
            if (element.nodeType === 1) {
                $(element).hide().fadeIn();
            }
        };

        self.hideProduct = function (element) {
            if (element.nodeType === 1) {
                $(element).fadeOut(function () {
                    $(element).remove();
                });
            }
        };
    }

    var shoppingVM = new ShoppingCart();
    ko.applyBindings(shoppingVM);
</script>
</body>
</html>