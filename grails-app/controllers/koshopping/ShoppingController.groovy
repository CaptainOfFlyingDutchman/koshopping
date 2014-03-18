package koshopping

import grails.converters.JSON

class ShoppingController {

    def index() {}

    def bindings() {}

    def interactive() {}

    def external() {}

    def loadData() {
        render([firstName: "Manvendra",
                lastName: "SK",
                activities: ["Golf", "Football", "Web Development"],
                favoriteHobby: "Football"] as JSON)
    }
}
