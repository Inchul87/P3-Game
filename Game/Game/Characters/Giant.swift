class Giant: Characters {
    init(name: String) {
        super.init(characterName: name, healthPoints: 80, maxHealthPoints: 80, weapon: Hammer(), type: "giant")
    }
}
