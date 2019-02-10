class Characters {
    var characterName: String
    var healthPoints: Int
    var maxHealthPoints: Int
    var weapon: Weapon
    var type: String
    
    init(characterName: String, healthPoints: Int, maxHealthPoints: Int, weapon: Weapon, type: String) {
        self.characterName = characterName
        self.healthPoints = healthPoints
        self.maxHealthPoints = maxHealthPoints
        self.weapon = weapon
        self.type = type
    }
}
