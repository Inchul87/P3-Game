class Giant: Character {
    init(characterName: String) {
        super.init(characterName: characterName, healthPoints: 80, maxNbOfHealthPoints: 80, weapon: Hammer(), characterType: "giant", moveType: "Attack")
    }
}
