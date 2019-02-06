class Giant: Characters {
    init(name: String) {
        super.init(charactersName: name, healthPoints: 80, maxHealthPoints: 80, weapon: Hammer(), type: "Giant")
    }
}
