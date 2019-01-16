class Wizard: Characters {
    init(name: String) {
        super.init(charactersName: name, healthPoints: 90, weapon: magicWand, type: "Wizard")
    }
}

var magicWand = MagicWand()
