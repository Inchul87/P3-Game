class Characters {
    var charactersName: String
    var healthPoints: Int
    var weapon: Weapon
    var type: String
    
    init(charactersName: String, healthPoints: Int, weapon: Weapon, type: String) {
        self.charactersName = charactersName
        self.healthPoints = healthPoints
        self.weapon = weapon
        self.type = type
    }
}
// print specs 
