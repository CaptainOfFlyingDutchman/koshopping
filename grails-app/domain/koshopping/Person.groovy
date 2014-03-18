package koshopping

class Person {

    String firstName
    String lastName
    String favoriteHobby
    List activities

    static hasMany = [activities: String]

    static constraints = {
        firstName blank: true, nullable: true
        lastName blank: true, nullable: true
        favoriteHobby blank: true, nullable: true
    }
}
