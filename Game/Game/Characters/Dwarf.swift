class Dwarf: Character {
    init(characterName: String) {
        super.init(characterName: characterName, healthPoints: 50, maxNbOfHealthPoints: 50, weapon: Axe(), characterType: "dwarf", moveType: "Attack")
    }
}
