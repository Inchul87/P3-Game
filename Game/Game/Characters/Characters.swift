class Characters {
    var charactersName: String
    var healthPoints: Int
    var maxHealthPoints: Int
    var weapon: Weapon
    var type: String
    
    init(charactersName: String, healthPoints: Int, maxHealthPoints: Int, weapon: Weapon, type: String) {
        self.charactersName = charactersName
        self.healthPoints = healthPoints
        self.maxHealthPoints = maxHealthPoints
        self.weapon = weapon
        self.type = type
    }
}
