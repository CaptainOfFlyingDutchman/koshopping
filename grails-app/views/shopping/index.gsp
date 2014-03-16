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

<button data-bind="click: addProduct">Add Bear</button>

<table>
    <thead>
    <tr>
        <th>Product</th>
        <th>Price</th>
    </tr>
    </thead>
    <tbody data-bind="foreach: shoppingCart">
    <tr>
        <td data-bind="text: name"></td>
        <td data-bind="text: price"></td>
        <td><button data-bind="click: $root.removeProduct">Remove</button></td>
    </tr>
    </tbody>
</table>

<script type="text/javascript">
    function Product(name, price) {
        this.name = ko.observable(name);
        this.price = ko.observable(price);
    }

    function PersonViewModel() {
        var self = this;

        this.firstName = ko.observable("Manvendra");
        this.lastName = ko.observable("SK");

        this.fullName = ko.computed(function () {
            return this.firstName() + " " + this.lastName();
        }, this);

        this.shoppingCart = ko.observableArray([
            new Product("Beer", 10.99),
            new Product("Brats", 7.99),
            new Product("Buns", 1.49)
        ]);

        this.addProduct = function () {
            this.shoppingCart.push(new Product("More Beer", 10.99))
        };

        this.removeProduct = function (product) {
            self.shoppingCart.destroy(product);
            console.info(self.shoppingCart().length);
            console.info(self.shoppingCart());
        };

        this.checkout = function () {
            alert("Trying to check out!");
        }
    }
    ko.applyBindings(new PersonViewModel());
</script>
</body>
</html>