package koshopping

import grails.converters.JSON

class ShoppingController {

    def index() {}

    def bindings() {}

    def interactive() {}

    def external() {}

    def loadData() {
        def person = new Person(
                firstName: "Manvendra",
                lastName: "SK",
                activities: ["Golf", "Football", "Web Development"],
                favoriteHobby: "Football"
        ).save(flush: true, failOnError: true)

        render(person as JSON)
    }

    def loadNewData() {
        def person = new Person(
                firstName: "Gaurav",
                lastName: "Singh",
                activities: ["Phone", "Books", "Brain Storming"],
                favoriteHobby: "Books"
        ).save(flush: true, failOnError: true)

        render(person as JSON)
    }

    def saveData() {
        def personJson = JSON.parse(params.dts)
        def person = Person.get(personJson.id)
        person.properties = personJson
        boolean isSaved = person.save(flush: true, failOnError: true)
        isSaved ? render("SAVED") : render("ERROR")
    }

    def animation() {}
}
