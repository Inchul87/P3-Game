class Warrior: Character {
    init(characterName: String) {
        super.init(characterName: characterName, healthPoints: 100, maxNbOfHealthPoints: 100, weapon: Sword(), characterType: "warrior", moveType: "Attack")
    }
}
