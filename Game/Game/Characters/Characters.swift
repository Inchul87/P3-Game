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
    
    func fightForTeam1(characterB: Characters) {
        if healthPoints > 0 {
            if characterB.healthPoints <= 0 {
                print("Sorry this \(characterB.type) is already dead !")
            } else {
                characterB.healthPoints -= weapon.damage
                if characterB.healthPoints <= 0 {
                    print("Well done ! You just killed his \(characterB.type) !")
            }
        }
    }
}
    
    func fightForTeam2(characterD: Characters) {
        if characterD.healthPoints > 0 {
            if characterD.healthPoints <= 0 {
                print("Sorry this \(characterD.type) is already dead !")
            } else {
                characterD.healthPoints -= weapon.damage
                if characterD.healthPoints <= 0 {
                    print("Well done ! You just killed his \(characterD.type) !")
                }
            }
        }
    }
}
