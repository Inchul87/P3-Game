class Wizard: Characters {
    init(name: String) {
        super.init(charactersName: name, healthPoints: 90, maxHealthPoints: 90, weapon: MagicWand(), type: "Wizard")
    }
}
